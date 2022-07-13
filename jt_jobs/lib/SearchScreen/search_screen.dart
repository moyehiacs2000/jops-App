import 'package:flutter/material.dart';
import 'package:jt_jobs/SearchScreen/search_content.dart';
import 'package:jt_jobs/SearchScreen/search_screen_header.dart';
import 'package:jt_jobs/firebase/models/user_model.dart';

import '../firebase/models/firebase_job_model.dart';

class SearchScreen extends StatefulWidget {
  final UserModel user;
  const SearchScreen(this.user, {Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<FirebaseJobModel> jobsList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  SearchScreenHeader(widget.user),
                  const SizedBox(height: 20),
                  SearchContent(jobsList, widget.user),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
