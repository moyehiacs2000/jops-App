import 'package:flutter/material.dart';
import 'package:jt_jobs/firebase/service/authentication_service.dart';
import 'package:jt_jobs/register_screen.dart';
import 'package:jt_jobs/Home.dart';

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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
                  ),
                ),
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
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 50, left: 50, bottom: 10),
                  child: SizedBox(
                    width: size.width,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          bool valid = await AuthenticationService().signIn(
                              _emailcontroller.text.toString(),
                              _passwordcontroller.text.toString());
                          if (valid) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          }
                        }
                      },
                      child: Text(
                        'Login',
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
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Don't Remeber Password?",
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
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
                  margin: EdgeInsets.only(right: 50, left: 50, bottom: 10),
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
