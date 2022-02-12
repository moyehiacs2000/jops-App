import 'package:flutter/material.dart';
import 'package:jt_jobs/DashBoardScreen/dashboard_content.dart';
import 'package:jt_jobs/DashBoardScreen/dashboard_header.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF6F7FB),
        body: SafeArea(
            child: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [DashBoardHeader(), DashbordContent()],
              ),
            ),
          ],
        )),
      ),
    );
  }
}