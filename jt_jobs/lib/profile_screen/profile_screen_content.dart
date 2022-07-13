import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreenContent extends StatefulWidget {
  const ProfileScreenContent({Key key}) : super(key: key);

  @override
  _ProfileScreenContentState createState() => _ProfileScreenContentState();
}

class _ProfileScreenContentState extends State<ProfileScreenContent> {
  List<String> arr = [
    "Java",
    "C++",
    "Python",
    "C#",
    "Computer Vision",
    "Android",
    "Flutter",
    "ML",
    "Design Pattern",
  ];
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
                      child: Text("About Me",
                          style: GoogleFonts.sriracha(fontSize: 20)),
                    ),
                    collapsed: null,
                    expanded: Text(
                      "Hi I'm Mohamed unior Android developer and Student at faculty of computer and information science, Ain-Shams University I Have experience with software engineering fundamentals including object-oriented design, data structures, and algorithms. I Can Design and build advanced applications for the Android platform. I Can Design beautiful and user-friendly Mobile interfaces. I Have Good Knowledge in android retrofit so I Can Interface with data sources such as REST API's .I Have Good Knowledge in Architecture patterns (Mvc, Mvp, Mvvm). I have Good knowledge in Rx java. I Have Experience with SQllite , Room and firebase . I’m currently learning more about flutter.",
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
                              arr.length,
                              (index) => Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.20),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Text(
                                  arr[index],
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
