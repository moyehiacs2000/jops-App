import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jt_jobs/firebase/models/user_model.dart';
import 'package:jt_jobs/firebase/service/authentication_service.dart';
import 'package:jt_jobs/login_screen.dart';

class RegiterScreen extends StatefulWidget {
  const RegiterScreen({Key key}) : super(key: key);

  @override
  _RegiterScreenState createState() => _RegiterScreenState();
}

class _RegiterScreenState extends State<RegiterScreen> {
  var passwordVisablity = true;
  String _name, _email, _password, _confirmPassword, _jobTitle;
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _jobTitlecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmPasswordcontroller =
      TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  //FirebaseAuth auth;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Image.asset("assets/images/header.png"),
                Image.asset(
                  "assets/images/registerimage.png",
                  height: 250,
                  width: 250,
                ),

                // Name TextField

                Container(
                  margin: EdgeInsets.only(bottom: 10, right: 20, left: 20),
                  child: TextFormField(
                    controller: _namecontroller,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide(color: Colors.green, width: 1.5),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.5,
                        ),
                      ),
                      hintText: "Enater Name",
                      hintStyle: TextStyle(fontSize: 20),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter Name";
                      }
                      return null;
                    },
                    onSaved: (String name) {
                      _name = name;
                    },
                  ),
                ),
                //Job Title

                Container(
                  margin: EdgeInsets.only(bottom: 10, right: 20, left: 20),
                  child: TextFormField(
                    controller: _jobTitlecontroller,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide(color: Colors.green, width: 1.5),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 1.5,
                        ),
                      ),
                      hintText: "Enater JobTitle",
                      hintStyle: TextStyle(fontSize: 20),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter JobTitle";
                      }
                      return null;
                    },
                    onSaved: (String jopTitle) {
                      _jobTitle = jopTitle;
                    },
                  ),
                ),
                //Email TextField
                Container(
                  margin: EdgeInsets.only(bottom: 10, right: 20, left: 20),
                  child: TextFormField(
                    controller: _emailcontroller,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: Colors.green, width: 1.5),
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
                    onSaved: (String email) {
                      _email = email;
                    },
                  ),
                ),
                // Password TextField
                Container(
                  margin: EdgeInsets.only(bottom: 10, right: 20, left: 20),
                  child: TextFormField(
                    controller: _passwordcontroller,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: Colors.green, width: 1.5),
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
                        return "Please Enter Password";
                      } else if (value.length < 8) {
                        return "Password Must Contain Greater Than Or Equal 8 Digits";
                      } else if (value !=
                          _confirmPasswordcontroller.text.toString()) {
                        return "Two Password Not Identical";
                      }
                      return null;
                    },
                    onSaved: (String password) {
                      _password = password;
                    },
                  ),
                ),
                // ReEnter Password

                Container(
                  margin: EdgeInsets.only(bottom: 10, right: 20, left: 20),
                  child: TextFormField(
                    controller: _confirmPasswordcontroller,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: Colors.green, width: 1.5),
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
                      hintText: "Confirm Password",
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
                        return "Please Confirm Password";
                      } else if (value.length < 8) {
                        return "Password Must Contain Greater Than Or Equal 8 Digits";
                      } else if (value != _passwordcontroller.text.toString()) {
                        return "Two Password Not Identical";
                      }
                      return null;
                    },
                    onSaved: (String password) {
                      _confirmPassword = password;
                    },
                  ),
                ),

                // Login Button

                Container(
                  margin: EdgeInsets.only(right: 50, left: 50, bottom: 40),
                  child: SizedBox(
                    width: size.width,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          AuthenticationService auth =
                              new AuthenticationService();
                          bool valid = await auth.registration(
                            _emailcontroller.text.toString(),
                            _passwordcontroller.text.toString(),
                          );
                          if (valid) {
                            UserModel user = new UserModel(
                                name: _namecontroller.text.toString(),
                                email: _emailcontroller.text.toString(),
                                jopTitle: _jobTitlecontroller.text.toString());
                            user.skills = ["C++", "Java", "Python"];
                            await auth.addUser(user);
                            FirebaseAuth.instance.signOut();
                            Fluttertoast.showToast(
                                msg: "The Account Created Successfully.",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1);
                            Navigator.pop(context);
                          }
                        }
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(113, 40, 220, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                ),
                // Footer
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
