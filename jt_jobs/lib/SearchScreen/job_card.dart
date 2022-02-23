import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jt_jobs/api/models/api_jop.dart';
import 'package:jt_jobs/job_description/job_description_screen.dart';

class JopCard2 extends StatelessWidget {
  final JobsResult data;
  const JopCard2(this.data, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 50,
            offset: Offset(0, -10),
          )
        ],
      ),
      child: OpenContainer(
        transitionType: ContainerTransitionType.fade,
        transitionDuration: const Duration(milliseconds: 500),
        openColor: Color(0xFFF6F7FB),
        openElevation: 0,
        openBuilder: (context, action) {
          return JopDescriptionScreen(data);
        },
        closedColor: Colors.transparent,
        closedElevation: 0,
        closedBuilder: (context, action) {
          return Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(30)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.network(
                      data.thumbnail ??
                          "https://th.bing.com/th/id/R.301257298931ca32d333bcde5d523c85?rik=z9n1A0HDB1r8Vw&pid=ImgRaw&r=0",
                      height: 40,
                      width: 40,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        data.companyName ?? "Company Name",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFB9B8CD)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  data.title ?? "Title",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF211D42),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  data.location ?? "Location",
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFFB9B8CD),
                  ),
                ),
                Text(
                  data.detectedExtensions.postedAt ?? "2 days ago",
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFFB9B8CD),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
