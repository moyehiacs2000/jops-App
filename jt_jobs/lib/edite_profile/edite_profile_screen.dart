import 'package:flutter/material.dart';
import 'package:jt_jobs/firebase/models/user_model.dart';
import 'edite_profile_screen_content.dart';
import 'edite_profile_screen_header.dart';

class EditeProfileScreen extends StatelessWidget {
  final UserModel user;
  const EditeProfileScreen(this.user, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FB),
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            children: [
              EditeProfileScreenHeader(user),
              EditeProfileScreenContent(user),
            ],
          ),
        ],
      )),
    );
  }
}
