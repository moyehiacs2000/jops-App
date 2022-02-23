import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jt_jobs/api/models/api_jop.dart';

class JobDescriptionFooter extends StatefulWidget {
  final JobsResult data;
  const JobDescriptionFooter(this.data, {Key key}) : super(key: key);

  @override
  _JobDescriptionFooterState createState() => _JobDescriptionFooterState();
}

class _JobDescriptionFooterState extends State<JobDescriptionFooter> {
  @override
  Widget build(BuildContext context) {
    String applyText;
    Color color;
    if (1 == 1) {
      applyText = 'Apply Now';
      color = Color.fromRGBO(113, 40, 220, 1);
    } else {
      applyText = 'Applied';
      color = Colors.grey;
    }

    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.10),
              blurRadius: 50,
              offset: Offset(0, -10),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 80,
              decoration: BoxDecoration(
                color: Color(0xFFF6F7FB),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/company.svg',
                  height: 20,
                  width: 20,
                  color: Color.fromRGBO(113, 40, 220, 1),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
                child: InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    applyText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
