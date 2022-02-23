import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jt_jobs/SearchScreen/job_card.dart';
import 'package:jt_jobs/SearchScreen/search_content.dart';
import 'package:jt_jobs/SearchScreen/search_screen_header.dart';
import 'package:jt_jobs/api/models/api_jop.dart';
import 'package:jt_jobs/api/service/job_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<JobsResult> jobsList = [];
  bool isLoading = true;
  getjobList() async {
    jobsList = await JobService().getJob();
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getjobList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SearchScreenHeader(),
                        const SizedBox(height: 20),
                        SearchContent(jobsList),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
