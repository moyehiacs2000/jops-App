import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jt_jobs/edite_profile/edite_profile_screen.dart';
import 'package:jt_jobs/firebase/models/user_model.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jt_jobs/profile_screen/Pdf_Viewer.dart';

import '../firebase/service/authentication_service.dart';

class ProfileScreenHeader extends StatefulWidget {
  final UserModel user;
  const ProfileScreenHeader(this.user, {Key key}) : super(key: key);

  @override
  State<ProfileScreenHeader> createState() => _ProfileScreenHeaderState();
}

class _ProfileScreenHeaderState extends State<ProfileScreenHeader> {
  File cvFile;
  bool cvLoading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Profile",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: Text('Preview'),
                    ),
                    PopupMenuItem(
                      child: Text('Share'),
                    ),
                    PopupMenuItem(
                      child: Text('Get Link'),
                    ),
                    PopupMenuItem(
                      child: Text('Remove'),
                    ),
                  ];
                },
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mohamed Yehia",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Mobile Developer",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: widget.user.imageProfileUrl == ''
                        ? Image.asset(
                            "assets/images/person.png",
                            height: 60,
                            width: 60,
                          )
                        : Image.network(
                            widget.user.imageProfileUrl,
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          )),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditeProfileScreen(widget.user)),
                  );
                },
                child: Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(113, 40, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Edite",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: cvLoading
                    ? Center(
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                            color: Color.fromRGBO(113, 40, 220, 1),
                          ),
                        ),
                      )
                    : widget.user.cvUrl == ''
                        ? InkWell(
                            onTap: () {
                              getCvFile();
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.50),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/uploadcv.svg',
                                      height: 20,
                                      width: 20,
                                      color: Color.fromRGBO(113, 40, 220, 1),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Upload CV",
                                      style: TextStyle(
                                        color: Color.fromRGBO(113, 40, 220, 1),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PdfViewer(widget.user)),
                              );
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(113, 40, 220, 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "Open CV",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void getCvFile() async {
    final file = await FlutterDocumentPicker.openDocument();
    if (file != null) {
      setState(() {
        cvFile = File(file);
        cvLoading = true;
      });
      upLoadCv(cvFile);
    }
  }

  void upLoadCv(File file) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child("usersCvs")
        .child(widget.user.name.toString() + ".pdf");
    await ref.putFile(file);
    widget.user.cvUrl = await ref.getDownloadURL();
    setState(() {
      cvLoading = false;
    });
    await AuthenticationService().addUser(widget.user);
    Fluttertoast.showToast(
        msg: "CV Uploaded Successfuly",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }
}
