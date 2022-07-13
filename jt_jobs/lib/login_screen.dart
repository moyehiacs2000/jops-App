import 'package:flutter/material.dart';
import 'package:jt_jobs/firebase/service/authentication_service.dart';
import 'package:jt_jobs/register_screen.dart';
import 'package:jt_jobs/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var passwordVisablity = true;
  bool loading = false;
  bool getSavedUserLoading = true;
  UserModel user;
  Future<void> getUser() async {
    User curUser = FirebaseAuth.instance.currentUser;
    if (curUser != null) {
      user = await AuthenticationService().getUser(curUser.uid.toString());
    } else {
      Fluttertoast.showToast(
          msg: "Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1);
      setState(() {
        loading = false;
      });
    }
    if (mounted) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home(user)));
    }
  }

  Future<bool> getSavedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    var password = prefs.getString('password');
    if (email != null && password != null) {
      await AuthenticationService().signIn(email, password);
      User curUser = FirebaseAuth.instance.currentUser;
      if (curUser != null) {
        user = await AuthenticationService().getUser(curUser.uid.toString());
      } else {
        Fluttertoast.showToast(
            msg: "Error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1);
        setState(() {
          getSavedUserLoading = false;
        });
      }
      if (mounted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home(user)));
      }
    } else {
      setState(() {
        getSavedUserLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getSavedUser();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: getSavedUserLoading
          ? Center(
              child: CircularProgressIndicator(
                  color: Color.fromRGBO(113, 40, 220, 1)),
            )
          : Container(
              height: size.height,
              child: SingleChildScrollView(
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/header.png"),
                      Image.asset(
                        "assets/images/loginimage.jpg",
                        height: 250,
                        width: 250,
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(bottom: 10, right: 20, left: 20),
                        child: TextFormField(
                          controller: _emailcontroller,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide:
                                  BorderSide(color: Colors.green, width: 1.5),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 1.5,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 1.5,
                              ),
                            ),
                            hintText: "Enater Email",
                            hintStyle: TextStyle(fontSize: 20),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.blue,
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Please Enter Email";
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(bottom: 10, right: 20, left: 20),
                        child: TextFormField(
                          controller: _passwordcontroller,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide:
                                  BorderSide(color: Colors.green, width: 1.5),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 1.5,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 1.5,
                              ),
                            ),
                            hintText: "Enater Password",
                            hintStyle: TextStyle(fontSize: 20),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.blue,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(passwordVisablity
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  passwordVisablity = !passwordVisablity;
                                });
                              },
                            ),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: passwordVisablity,
                          validator: (String value) {
                            if (value.isEmpty) {
                              setState(() {
                                loading = false;
                              });
                              return "Please Enter Password";
                            } else if (value.length < 8) {
                              setState(() {
                                loading = false;
                              });
                              return "Password Must Contain Greater Than Or Equal 8 Digits";
                            }
                            return null;
                          },
                        ),
                      ),
                      loading
                          ? Center(
                              child: Container(
                                margin: EdgeInsets.only(
                                  bottom: 10,
                                  top: 10,
                                ),
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3.0,
                                    color: Color.fromRGBO(113, 40, 220, 1),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.only(
                                  right: 50, left: 50, bottom: 10),
                              child: SizedBox(
                                width: size.width,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    setState(() {
                                      loading = true;
                                    });
                                    if (_formkey.currentState.validate()) {
                                      bool valid = await AuthenticationService()
                                          .signIn(
                                              _emailcontroller.text.toString(),
                                              _passwordcontroller.text
                                                  .toString());
                                      if (valid) {
                                        getUser();
                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        prefs.setString('email',
                                            _emailcontroller.text.toString());
                                        prefs.setString(
                                            'password',
                                            _passwordcontroller.text
                                                .toString());
                                      } else {
                                        setState(() {
                                          loading = false;
                                        });
                                      }
                                    }
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color.fromRGBO(113, 40, 220, 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    padding: EdgeInsets.all(10),
                                  ),
                                ),
                              ),
                            ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Don't Remember Password?",
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(left: 30, right: 30, bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                height: 2,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                child: Text("OR")),
                            Expanded(
                              child: Divider(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "assets/images/google.png",
                              height: 40,
                              width: 40,
                            ),
                            Image.asset(
                              "assets/images/facebook.png",
                              height: 40,
                              width: 40,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(right: 50, left: 50, bottom: 10),
                        child: SizedBox(
                          width: size.width,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegiterScreen()),
                              );
                            },
                            child: Text(
                              'Regiter',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromRGBO(113, 40, 220, 1)),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(width: 2),
                              shape: StadiumBorder(),
                            ),
                          ),
                        ),
                      ),
                      Image.asset(
                        "assets/images/footer.png",
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
