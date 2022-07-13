import 'dart:io';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jt_jobs/firebase/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jt_jobs/firebase/service/authentication_service.dart';

class EditeProfileScreenContent extends StatefulWidget {
  final UserModel user;
  const EditeProfileScreenContent(this.user, {Key key}) : super(key: key);

  @override
  _EditeProfileScreenContentState createState() =>
      _EditeProfileScreenContentState();
}

class _EditeProfileScreenContentState extends State<EditeProfileScreenContent> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _jobTitlecontroller = TextEditingController();
  final TextEditingController _aboutYouController = TextEditingController();
  List<TextEditingController> _skills = [];
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  File imageFile;
  bool imgLoading = false;
  @override
  Widget build(BuildContext context) {
    _emailcontroller.text = widget.user.email;
    _namecontroller.text = widget.user.name;
    _jobTitlecontroller.text = widget.user.jopTitle;
    _aboutYouController.text = widget.user.about;
    for (int i = 0; i < widget.user.skills.length; i++) {
      TextEditingController item = TextEditingController();
      _skills.add(item);
      _skills[i].text = widget.user.skills[i];
    }
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
          key: _formkey,
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20,
                ),
                imageProfile(),
                SizedBox(
                  height: 20,
                ),
                nameTextFieldForm(),
                jobtitleTextFieldForm(),
                emailTextFieldForm(),
                aboutyouExpendableNotifier(),
                skillsExpendableNotifier()
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getImage(ImageSource source) async {
    final file = await ImagePicker().pickImage(source: source);
    if (file != null) {
      setState(() {
        imageFile = File(file.path);
        imgLoading = true;
      });
      uploadImage(imageFile);
    }
  }

  void uploadImage(File file) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child("usersimages")
        .child(_namecontroller.text.toString() + ".jpg");
    await ref.putFile(file);
    widget.user.imageProfileUrl = await ref.getDownloadURL();
    setState(() {
      imgLoading = false;
    });
    await AuthenticationService().addUser(widget.user);
    Fluttertoast.showToast(
        msg: "image Uploaded",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
              radius: 80,
              backgroundColor: Colors.white,
              child: imgLoading == true
                  ? Center(child: CircularProgressIndicator())
                  : widget.user.imageProfileUrl.isEmpty
                      ? Image.asset(
                          "assets/images/person.png",
                          height: 150,
                          width: 150,
                        )
                      : SizedBox(
                          height: 150,
                          width: 150,
                          child: ClipOval(
                            child: Image.network(
                              widget.user.imageProfileUrl,
                              fit: BoxFit.cover,
                              frameBuilder: (context, child, frame,
                                  wasSynchronouslyLoaded) {
                                return child;
                              },
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null &&
                                    imgLoading == false) {
                                  return child;
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ),
                        )),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: RawMaterialButton(
              elevation: 10,
              fillColor: Color.fromRGBO(113, 40, 220, 1),
              padding: EdgeInsets.all(10.0),
              shape: CircleBorder(),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet()),
                );
              },
              child: Icon(
                Icons.add_a_photo_rounded,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Choose Option",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(113, 40, 220, 1)),
          ),
          InkWell(
            onTap: () {
              getImage(ImageSource.camera);
            },
            splashColor: Color.fromRGBO(113, 40, 220, 1),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.camera,
                    color: Color.fromRGBO(113, 40, 220, 1),
                  ),
                ),
                Text(
                  "Camera",
                  style: GoogleFonts.sriracha(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              getImage(ImageSource.gallery);
            },
            splashColor: Color.fromRGBO(113, 40, 220, 1),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.image,
                    color: Color.fromRGBO(113, 40, 220, 1),
                  ),
                ),
                Text("Gallery",
                    style: GoogleFonts.sriracha(
                      fontSize: 20,
                    ))
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            splashColor: Color.fromRGBO(113, 40, 220, 1),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.remove_circle,
                    color: Color.fromRGBO(113, 40, 220, 1),
                  ),
                ),
                Text("Remove",
                    style: GoogleFonts.sriracha(
                      fontSize: 20,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget nameTextFieldForm() {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      child: TextFormField(
        controller: _namecontroller,
        onChanged: (value) {
          widget.user.name = value.toString();
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(
              color: Color.fromRGBO(113, 40, 220, 1),
              width: 1.5,
            ),
          ),
          hintText: "Enater Name",
          labelText: "Your Name",
          labelStyle: TextStyle(fontSize: 20),
          hintStyle: TextStyle(fontSize: 20),
          prefixIcon: Icon(
            Icons.person,
            color: Color.fromRGBO(113, 40, 220, 1),
          ),
        ),
        keyboardType: TextInputType.text,
        validator: (String value) {
          if (value.isEmpty) {
            return "Please Enter Name";
          }
          return null;
        },
      ),
    );
  }

  Widget jobtitleTextFieldForm() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: _jobTitlecontroller,
        onChanged: (value) {
          widget.user.email = value.toString();
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(
              color: Color.fromRGBO(113, 40, 220, 1),
              width: 1.5,
            ),
          ),
          hintText: "Enter Jobtitle",
          labelText: "Your Jobtitle",
          hintStyle: TextStyle(fontSize: 20),
          labelStyle: TextStyle(fontSize: 20),
          prefixIcon: Icon(
            Icons.person,
            color: Color.fromRGBO(113, 40, 220, 1),
          ),
        ),
        keyboardType: TextInputType.text,
        validator: (String value) {
          if (value.isEmpty) {
            return "Please Enter JobTitle";
          }
          return null;
        },
      ),
    );
  }

  Widget emailTextFieldForm() {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      child: TextFormField(
        controller: _emailcontroller,
        onChanged: (value) {
          widget.user.email = value.toString();
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Color.fromRGBO(113, 40, 220, 1),
              width: 1.5,
            ),
          ),
          hintText: "Enater Email",
          labelText: "Your Email",
          labelStyle: TextStyle(fontSize: 20),
          hintStyle: TextStyle(fontSize: 20),
          prefixIcon: Icon(
            Icons.email,
            color: Color.fromRGBO(113, 40, 220, 1),
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (String value) {
          if (value.isEmpty) {
            return "Please Enter Email";
          }
          return null;
        },
      ),
    );
  }

  Widget aboutyouExpendableNotifier() {
    return ExpandableNotifier(
      child: ScrollOnExpand(
        child: ExpandablePanel(
            theme: ExpandableThemeData(
                animationDuration: const Duration(milliseconds: 800),
                expandIcon: Icons.add,
                collapseIcon: Icons.minimize_rounded),
            header: Padding(
              padding: EdgeInsets.all(12),
              child:
                  Text("About Me", style: GoogleFonts.sriracha(fontSize: 20)),
            ),
            collapsed: null,
            expanded: Container(
              child: TextFormField(
                controller: _aboutYouController,
                minLines: 2,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                onChanged: (value) {
                  widget.user.about = value.toString();
                },
                decoration: InputDecoration(
                  hintText: "Enter Intro About You Here",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }

  Widget skillsExpendableNotifier() {
    return ExpandableNotifier(
      child: ScrollOnExpand(
        child: ExpandablePanel(
            theme: ExpandableThemeData(
                animationDuration: const Duration(milliseconds: 800),
                expandIcon: Icons.add,
                collapseIcon: Icons.minimize_rounded),
            header: Padding(
              padding: EdgeInsets.all(12),
              child: Text("Skills", style: GoogleFonts.sriracha(fontSize: 20)),
            ),
            collapsed: null,
            expanded: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ...List.generate(
                    widget.user.skills.length,
                    (index) => Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.20),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              controller: _skills[index],
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 1.5),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.5,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.5,
                                  ),
                                ),
                              ),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.text,
                              onChanged: (value) {
                                widget.user.skills[index] = value.toString();
                              },
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "Please Enter Skill";
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 3),
                            child: InkWell(
                                onTap: () {
                                  widget.user.skills
                                      .remove(widget.user.skills[index]);
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      widget.user.skills.add(" ");
                      setState(() {});
                    },
                    child: ElevatedButton(child: Text("Del")),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
