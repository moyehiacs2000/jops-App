import 'package:flutter/cupertino.dart';

class UserModel {
  String id;
  String imageProfileUrl;
  String name;
  String email;
  String jopTitle;
  String about;
  String cvUrl;
  List<dynamic> skills;
  List<dynamic> appliedJobs;
  UserModel(
      {this.imageProfileUrl,
      @required this.name,
      @required this.email,
      @required this.jopTitle,
      this.about,
      this.cvUrl});

  UserModel.fromMap(Map<String, dynamic> data)
      : imageProfileUrl = data["imageurl"] ?? '',
        name = data['name'] ?? '',
        email = data['email'] ?? '',
        jopTitle = data['jopTitle'] ?? '',
        about = data['about'] ?? '',
        skills = data['skills'] ?? [],
        appliedJobs = data['appliedJobs'] ?? [],
        cvUrl = data['cvurl'] ?? '';

  Map<String, dynamic> toMap() {
    return {
      "imageurl": imageProfileUrl,
      "name": name,
      "email": email,
      "jopTitle": jopTitle,
      "about": about,
      "skills": skills,
      "appliedJobs": appliedJobs,
      "cvurl": cvUrl
    };
  }

  void addSkill(String skill) {
    this.skills.add(skill);
  }

  void addJobs(String job) {
    this.appliedJobs.add(job);
  }

  void removeSkill(String skill) {
    this.skills.remove(skill);
  }
}
