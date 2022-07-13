import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jt_jobs/firebase/models/user_model.dart';

import '../SearchScreen/job_card.dart';
import '../firebase/models/firebase_job_model.dart';

class ApplicationsContent extends StatefulWidget {
  final bool interviews;
  final UserModel user;
  final List<FirebaseJobModel> allAppliedJobs;
  const ApplicationsContent(this.interviews, this.user, this.allAppliedJobs,
      {Key key})
      : super(key: key);

  @override
  State<ApplicationsContent> createState() => _ApplicationsContentState();
}

class _ApplicationsContentState extends State<ApplicationsContent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: (widget.interviews)
            ? Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/uploadcv.svg',
                      height: 100,
                      width: 100,
                      color: Color.fromRGBO(113, 40, 220, 1),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "No Interviews",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    )
                  ],
                ),
              )
            : Container(
                child: widget.allAppliedJobs.length == 0
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/uploadcv.svg',
                            height: 100,
                            width: 100,
                            color: Color.fromRGBO(113, 40, 220, 1),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "No Applications",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          )
                        ],
                      )
                    : Container(
                        color: Colors.white,
                        child: ListView.builder(
                          itemCount: widget.allAppliedJobs.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 30)
                                  .copyWith(
                                top: index == 0 ? 20 : 0,
                                bottom: 20,
                              ),
                              child: JopCard2(
                                  widget.allAppliedJobs[index], widget.user),
                            );
                          },
                        ),
                      ),
              ));
  }
}
