import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:jt_jobs/login_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff8743e2),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 350,
              width: 350,
              child: Lottie.asset('assets/images/splashimage.json'),
            ),
            SizedBox(
              height: 30,
            ),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lobster',
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('JT JOBs'),
                ],
                isRepeatingAnimation: true,
                onTap: () {
                  print("Tap Event");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
