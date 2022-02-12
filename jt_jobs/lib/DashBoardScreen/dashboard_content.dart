import 'package:flutter/material.dart';
import 'package:jt_jobs/job_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DashbordContent extends StatelessWidget {
  const DashbordContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(30),
                  color: Color.fromRGBO(113, 40, 220, 0.1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: CircularPercentIndicator(
                        radius: 60,
                        lineWidth: 3.0,
                        percent: 0.4,
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: Color.fromRGBO(113, 40, 220, 1),
                        backgroundColor: Colors.grey[350],
                        center: Text(
                          "40" + "%",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(113, 40, 220, 1)),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text("Complete Your\nProfile",
                          style: GoogleFonts.rokkitt(
                              color: Color.fromRGBO(113, 40, 220, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      child: Icon(
                        Icons.keyboard_arrow_right_rounded,
                        size: 40,
                        color: Colors.grey[350],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 160,
                    height: 100,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadiusDirectional.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "36",
                          style: GoogleFonts.lobster(
                              fontSize: 25, color: Colors.white),
                        ),
                        Text(
                          "Jop Applied",
                          style: GoogleFonts.acme(
                              fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: 160,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadiusDirectional.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "5",
                          style: GoogleFonts.lobster(
                              fontSize: 25, color: Colors.white),
                        ),
                        Text(
                          "InterViews",
                          style: GoogleFonts.acme(
                              fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  "Recomended For You",
                  style: GoogleFonts.rokkitt(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              JopCard(),
              SizedBox(
                height: 10,
              ),
              JopCard(),
              SizedBox(
                height: 10,
              ),
              JopCard(),
              SizedBox(
                height: 10,
              ),
              JopCard(),
              SizedBox(
                height: 10,
              ),
              JopCard(),
            ],
          ),
        ),
      ),
    );
  }
}
