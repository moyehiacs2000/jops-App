import 'package:flutter/material.dart';
import 'package:jt_jobs/firebase/models/user_model.dart';
import 'package:jt_jobs/job_description/job_description__content.dart';
import 'package:jt_jobs/job_description/job_description_footer.dart';
import 'package:jt_jobs/job_description/job_description_header.dart';

import '../firebase/models/firebase_job_model.dart';

class JopDescriptionScreen extends StatelessWidget {
  final FirebaseJobModel data;
  final UserModel user;
  const JopDescriptionScreen(this.data, this.user, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FB),
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            children: [
              JobDescriptionHeader(data.companyName),
              JobDescriptionContent(data)
            ],
          ),
          JobDescriptionFooter(data, user)
        ],
      )),
    );
  }
}
