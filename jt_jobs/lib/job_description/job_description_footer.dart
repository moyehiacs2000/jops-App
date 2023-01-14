import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jt_jobs/firebase/models/firebase_job_model.dart';
import 'package:jt_jobs/firebase/models/user_model.dart';
import 'package:jt_jobs/firebase/service/firebase_job_service.dart';

import '../firebase/service/authentication_service.dart';

class JobDescriptionFooter extends StatefulWidget {
  final FirebaseJobModel data;
  final UserModel user;
  const JobDescriptionFooter(this.data, this.user, {Key key}) : super(key: key);

  @override
  _JobDescriptionFooterState createState() => _JobDescriptionFooterState();
}

class _JobDescriptionFooterState extends State<JobDescriptionFooter> {
  Map<String, bool> applied = Map();
  bool appliedLoading = false;
  @override
  Widget build(BuildContext context) {
    String applyText;
    Color color;
    if (!widget.user.appliedJobs.contains(widget.data.jobID)) {
      applyText = 'Apply Now';
      color = Color.fromRGBO(113, 40, 220, 1);
    } else {
      applyText = 'Cancel';
      color = Colors.red;
    }

    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.10),
              blurRadius: 50,
              offset: Offset(0, -10),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 80,
              decoration: BoxDecoration(
                color: Color(0xFFF6F7FB),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/company.svg',
                  height: 20,
                  width: 20,
                  color: Color.fromRGBO(113, 40, 220, 1),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: appliedLoading
                  ? Container(
                      child: Center(
                        child: CircularProgressIndicator(
                            color: Color.fromRGBO(113, 40, 220, 1)),
                      ),
                    )
                  : InkWell(
                      onTap: () async {
                        setState(() {
                          appliedLoading = true;
                        });
                        if (applyText == "Apply Now") {
                          await FirebaseJobService().addApplication(
                              widget.data.jobID, widget.user.id);
                          widget.user.appliedJobs.add(widget.data.jobID);
                          await AuthenticationService().addUser(widget.user);

                          if (mounted) {
                            setState(() {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.SUCCES,
                                animType: AnimType.BOTTOMSLIDE,
                                title: 'You Applied Successfuly',
                                btnOkOnPress: () {},
                              )..show();
                              appliedLoading = false;
                            });
                          }
                        } else if (applyText == "Cancel") {
                          widget.user.appliedJobs.remove(widget.data.jobID);
                          await AuthenticationService().addUser(widget.user);
                          if (mounted) {
                            setState(() {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.SUCCES,
                                animType: AnimType.BOTTOMSLIDE,
                                title: 'You Canceled Successfuly',
                                btnOkOnPress: () {},
                              )..show();
                              appliedLoading = false;
                            });
                          }
                        }
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            applyText,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
