import 'package:flutter/material.dart';
import 'package:jt_jobs/api/models/api_jop.dart';
import 'package:jt_jobs/job_description/job_description__content.dart';
import 'package:jt_jobs/job_description/job_description_footer.dart';
import 'package:jt_jobs/job_description/job_description_header.dart';

class JopDescriptionScreen extends StatelessWidget {
  final JobsResult data;
  const JopDescriptionScreen(this.data, {Key key}) : super(key: key);

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
          JobDescriptionFooter(data)
        ],
      )),
    );
  }
}
