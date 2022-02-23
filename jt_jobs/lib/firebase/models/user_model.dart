import 'package:flutter/cupertino.dart';

class UserModel {
  String name;
  String email;
  String jopTitle;
  String about;
  List<String> skills;
  UserModel({
    @required this.name,
    @required this.email,
    @required this.jopTitle,
  });
  UserModel.fromMap(Map<dynamic, dynamic> data)
      : name = data['name'] ?? '',
        email = data['email'] ?? '',
        jopTitle = data['jopTitle'] ?? '',
        about = data['about'] ?? '',
        skills = data['skills'] ?? '';

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "jopTitle": jopTitle,
      "about": about,
      "skills": skills,
    };
  }
}
