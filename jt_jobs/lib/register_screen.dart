import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:jt_jobs/login_screen.dart';

class RegiterScreen extends StatefulWidget {
  const RegiterScreen({Key key}) : super(key: key);

  @override
  _RegiterScreenState createState() => _RegiterScreenState();
}

class _RegiterScreenState extends State<RegiterScreen> {
  var passwordVisablity = true;
  String _name, _email, _password, _confirmPassword;
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmPasswordcontroller =
      TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  //FirebaseAuth auth;
  bool emailValidation = true,
      passwordValidation = true,
      secondPasswordValidation = true,
      nameValidation = true;
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
                      } else if (EmailValidator.validate(value)) {
                        return "Please Enter Valid Email";
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
                      onPressed: () {
                        if (_formkey.currentState.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        } else {}
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

  void isValide() {
    /*if (_emailcontroller.text.isEmpty || ) {
      emailValidation = false;
      
    }
    if()*/
  }
}
