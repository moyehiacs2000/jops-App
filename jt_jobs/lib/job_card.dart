import 'package:flutter/material.dart';

class JopCard extends StatelessWidget {
  const JopCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                /*Image.network(
                  "https://th.bing.com/th/id/R.301257298931ca32d333bcde5d523c85?rik=z9n1A0HDB1r8Vw&pid=ImgRaw&r=0",
                  height: 40,
                  width: 40,
                ),*/
                const SizedBox(width: 10),
                Text("Manthul Inc",
                    style: TextStyle(
                      color: Color(0xFFB9B8CD),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Graphic Designer",
              style: TextStyle(
                color: Color(0xFF211D42),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "London",
              style: TextStyle(
                color: Color(0xFFB9B8CD),
                fontSize: 10,
              ),
            ),
            Text(
              "19 hours ago",
              style: TextStyle(
                color: Color(0xFFB9B8CD),
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
