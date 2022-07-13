import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jt_jobs/applications/applications_content.dart';
import 'package:jt_jobs/firebase/models/user_model.dart';

import '../firebase/models/firebase_job_model.dart';

class ApplicationsScreen extends StatefulWidget {
  final UserModel user;
  const ApplicationsScreen(this.user, {Key key}) : super(key: key);

  @override
  _ApplicationsScreenState createState() => _ApplicationsScreenState();
}

class _ApplicationsScreenState extends State<ApplicationsScreen> {
  bool interviews = false;
  Widget applicationsInterviews(String text, bool selected) {
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

  List<FirebaseJobModel> allAppliedJobs = [];
  bool appliedJobLoading = true;
  void getAppliedJobs(List<dynamic> ids) {
    CollectionReference appliedJobs =
        FirebaseFirestore.instance.collection('job');
    ids.forEach((element) async {
      var doc = await appliedJobs.doc(element.toString()).get();
      FirebaseJobModel job = FirebaseJobModel.fromMap(doc.data(), doc.id);
      allAppliedJobs.add(job);
      if (mounted) {
        setState(() {
          appliedJobLoading = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (!interviews) {
      getAppliedJobs(widget.user.appliedJobs);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FB),
      body: RefreshIndicator(
        onRefresh: () async {
          if (!interviews) {
            setState(() {
              appliedJobLoading = true;
              allAppliedJobs = [];
            });
            getAppliedJobs(widget.user.appliedJobs);
          }
        },
        child: SafeArea(
            child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Applications",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
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
                      applicationsInterviews(
                          "Applications(${widget.user.appliedJobs.length})",
                          false),
                      SizedBox(
                        width: 10,
                      ),
                      applicationsInterviews("Interviews(0)", true),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                appliedJobLoading
                    ? Expanded(
                        child: Center(
                        child: CircularProgressIndicator(
                            color: Color.fromRGBO(113, 40, 220, 1)),
                      ))
                    : ApplicationsContent(
                        interviews, widget.user, allAppliedJobs),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
