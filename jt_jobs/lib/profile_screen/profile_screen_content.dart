import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../firebase/models/user_model.dart';

class ProfileScreenContent extends StatefulWidget {
  final UserModel user;
  const ProfileScreenContent(this.user, {Key key}) : super(key: key);
  @override
  _ProfileScreenContentState createState() => _ProfileScreenContentState();
}

class _ProfileScreenContentState extends State<ProfileScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              ExpandableNotifier(
                child: ScrollOnExpand(
                  child: ExpandablePanel(
                      theme: ExpandableThemeData(
                          animationDuration: const Duration(milliseconds: 800),
                          expandIcon: Icons.add,
                          collapseIcon: Icons.minimize_rounded),
                      header: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text("Education",
                            style: GoogleFonts.sriracha(fontSize: 20)),
                      ),
                      collapsed: null,
                      expanded: Container(
                        child: Row(
                          children: [
                            Image.network(
                              "https://th.bing.com/th/id/R.301257298931ca32d333bcde5d523c85?rik=z9n1A0HDB1r8Vw&pid=ImgRaw&r=0",
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ain Shams University",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF211D42),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Student,Computer and infomation Sciences and Support Services",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFB9B8CD)),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "2018 - 2022",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xFFB9B8CD),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                ),
              ),
              ExpandableNotifier(
                child: ScrollOnExpand(
                  child: ExpandablePanel(
                    theme: ExpandableThemeData(
                        animationDuration: const Duration(milliseconds: 800),
                        expandIcon: Icons.add,
                        collapseIcon: Icons.minimize_rounded),
                    header: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text("About Me",
                          style: GoogleFonts.sriracha(fontSize: 20)),
                    ),
                    collapsed: null,
                    expanded: Text(
                      widget.user.about,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              ExpandableNotifier(
                child: ScrollOnExpand(
                  child: ExpandablePanel(
                      theme: ExpandableThemeData(
                          animationDuration: const Duration(milliseconds: 800),
                          expandIcon: Icons.add,
                          collapseIcon: Icons.minimize_rounded),
                      header: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text("Skills",
                            style: GoogleFonts.sriracha(fontSize: 20)),
                      ),
                      collapsed: null,
                      expanded: Container(
                        padding: EdgeInsets.all(16.0),
                        child: Wrap(
                          spacing: 10.0,
                          runSpacing: 10.10,
                          children: [
                            ...List.generate(
                              widget.user.skills.length,
                              (index) => Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.20),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Text(
                                  widget.user.skills[index],
                                  style: GoogleFonts.sriracha(
                                    fontSize: 14,
                                    color: Color.fromRGBO(113, 40, 220, 1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
