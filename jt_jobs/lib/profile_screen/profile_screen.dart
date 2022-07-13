import 'package:flutter/material.dart';
import 'package:jt_jobs/firebase/models/user_model.dart';
import 'package:jt_jobs/profile_screen/profile_screen_content.dart';
import 'package:jt_jobs/profile_screen/profile_screen_header.dart';

class ProfileScreen extends StatefulWidget {
  final UserModel user;
  const ProfileScreen(this.user, {Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FB),
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            children: [
              ProfileScreenHeader(widget.user),
              ProfileScreenContent()
            ],
          ),
        ],
      )),
    );
  }
}
