import 'package:flutter/material.dart';
import 'package:jt_jobs/DashBoardScreen/dashboard.dart';
import 'package:jt_jobs/register_screen.dart';
import 'package:jt_jobs/Home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/header.png"),
              Image.asset(
                "assets/images/loginimage.jpg",
                height: 250,
                width: 250,
              ),
              Card(
                elevation: 5.0,
                margin: EdgeInsets.only(right: 20, bottom: 10, left: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enater Name",
                    hintStyle: TextStyle(fontSize: 20),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.only(right: 20, bottom: 10, left: 20),
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enater Email",
                    hintStyle: TextStyle(fontSize: 20),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 50, left: 50, bottom: 10),
                child: SizedBox(
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    child: Text(
                      'Login',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
    );
  }
}
