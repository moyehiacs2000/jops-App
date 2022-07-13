import 'package:flutter/material.dart';

import '../firebase/models/firebase_job_model.dart';

class JobDescriptionContent extends StatelessWidget {
  final FirebaseJobModel data;
  const JobDescriptionContent(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 50),
              Center(
                child: Column(
                  children: [
                    Image.network(
                      data.companyLogoUrl ??
                          "https://th.bing.com/th/id/R.301257298931ca32d333bcde5d523c85?rik=z9n1A0HDB1r8Vw&pid=ImgRaw&r=0",
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      data.title,
                      style: TextStyle(
                        color: Color(0xFF211D42),
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      data.location,
                      style: TextStyle(
                        color: Color(0xFFB9B8CD),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                'Job Description',
                style: TextStyle(
                  color: Color(0xFF211D42),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  data.description,
                  style: TextStyle(
                      color: Color(0xFF211D42),
                      fontWeight: FontWeight.w400,
                      fontSize: 10),
                ),
              ),
              SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }
}
