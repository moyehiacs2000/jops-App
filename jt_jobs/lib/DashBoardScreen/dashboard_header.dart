import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jt_jobs/firebase/models/user_model.dart';

class DashBoardHeader extends StatelessWidget {
  final UserModel user;
  const DashBoardHeader(this.user, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "Hello, ${user.name}",
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
              child: user.imageProfileUrl == ''
                  ? Image.asset(
                      "assets/images/person.png",
                      height: 50,
                      width: 50,
                    )
                  : Image.network(
                      user.imageProfileUrl,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    )),
        ),
      ],
    );
  }
}
