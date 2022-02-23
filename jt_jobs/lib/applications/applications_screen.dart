import 'package:flutter/material.dart';
import 'package:jt_jobs/applications/applications_content.dart';

class ApplicationsScreen extends StatefulWidget {
  const ApplicationsScreen({Key key}) : super(key: key);

  @override
  _ApplicationsScreenState createState() => _ApplicationsScreenState();
}

class _ApplicationsScreenState extends State<ApplicationsScreen> {
  bool interviews = false;
  Widget applications_iterviews(String text, bool selected) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            interviews = selected;
          });
        },
        child: Container(
          height: 40,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: (interviews == selected)
                    ? Color.fromRGBO(113, 40, 220, 1)
                    : Colors.grey,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: (interviews == selected) ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FB),
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Text(
                  "Applications",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.20),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    applications_iterviews("Applications(0)", false),
                    SizedBox(
                      width: 10,
                    ),
                    applications_iterviews("Interviews(0)", true),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ApplicationsContent(interviews),
            ],
          ),
        ],
      )),
    );
  }
}
