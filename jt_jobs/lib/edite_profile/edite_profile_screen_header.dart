import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jt_jobs/firebase/models/user_model.dart';
import 'package:jt_jobs/firebase/service/authentication_service.dart';

class EditeProfileScreenHeader extends StatelessWidget {
  final UserModel user;
  const EditeProfileScreenHeader(this.user, {Key key}) : super(key: key);

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
            child: Text(
              "Cancel",
              style:
                  GoogleFonts.sriracha(color: Color.fromRGBO(113, 40, 220, 1)),
            ),
          ),
          Text(
            "Edite Profile",
            style: TextStyle(
              color: Color(0xFF211D42),
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          InkWell(
            onTap: () async {
              await AuthenticationService().addUser(user);
              Fluttertoast.showToast(
                  msg: "Your Information Updated Successfuly",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1);
            },
            child: Text(
              "Save",
              style:
                  GoogleFonts.sriracha(color: Color.fromRGBO(113, 40, 220, 1)),
            ),
          )
        ],
      ),
    );
  }
}
