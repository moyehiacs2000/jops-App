import 'package:flutter/material.dart';

class JobDescriptionHeader extends StatelessWidget {
  final String companyName;
  const JobDescriptionHeader(this.companyName, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_rounded),
          ),
          Text(
            companyName,
            style: TextStyle(
              color: Color(0xFF211D42),
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 30)
        ],
      ),
    );
  }
}
