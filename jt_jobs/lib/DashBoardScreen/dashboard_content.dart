import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:jt_jobs/firebase/models/user_model.dart';
import 'package:jt_jobs/job_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../SearchScreen/job_card.dart';
import '../firebase/models/firebase_job_model.dart';

class DashbordContent extends StatefulWidget {
  final UserModel user;
  const DashbordContent(this.user, {Key key}) : super(key: key);

  @override
  State<DashbordContent> createState() => _DashbordContentState();
}

class _DashbordContentState extends State<DashbordContent> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<FirebaseJobModel> Data = [];
  bool recomendedLoading = true;
  Future<void> getJobs() async {
    await _firestore.collection("job")
      ..where(
        "title",
        isGreaterThanOrEqualTo: widget.user.jopTitle,
      ).limit(4).get().then((value) {
        value.docs.forEach((element) {
          Data.add(FirebaseJobModel.fromMap(element.data(), element.id));
          if (mounted) {
            setState(() {
              recomendedLoading = false;
            });
          }
        });
      });
  }

  @override
  void initState() {
    super.initState();
    getJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                        style:
                            GoogleFonts.acme(fontSize: 16, color: Colors.white),
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
                        style:
                            GoogleFonts.acme(fontSize: 16, color: Colors.white),
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
            recomendedLoading
                ? Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Center(
                      child: CircularProgressIndicator(
                          color: Color.fromRGBO(113, 40, 220, 1)),
                    ),
                  )
                : recomendedExpendableNotifier()
          ],
        ),
      ),
    );
  }

  Widget recomendedExpendableNotifier() {
    return Container(
      color: Color(0xFFF6F7FB),
      child: Column(
        children: [
          ...List.generate(
            Data.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 5).copyWith(
                top: index == 0 ? 20 : 0,
                bottom: 20,
              ),
              child: JopCard2(Data[index], widget.user),
            ),
          )
        ],
      ),
    );
  }
}
