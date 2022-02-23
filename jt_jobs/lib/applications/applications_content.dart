import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ApplicationsContent extends StatelessWidget {
  final bool interviews;
  const ApplicationsContent(this.interviews, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/uploadcv.svg',
              height: 100,
              width: 100,
              color: Color.fromRGBO(113, 40, 220, 1),
            ),
            SizedBox(
              height: 10,
            ),
            (interviews)
                ? Text(
                    "No Interviews",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  )
                : Text(
                    "No Applications",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
