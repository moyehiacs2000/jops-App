import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoardHeader extends StatelessWidget {
  const DashBoardHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "Hello, Mohamed",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            Text(
              "Dashboard",
              style: GoogleFonts.lobster(fontSize: 25),
            ),
          ],
        ),
        Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/images/pofilephtot.png",
              height: 50,
              width: 50,
            ),
          ),
        ),
      ],
    );
  }
}
