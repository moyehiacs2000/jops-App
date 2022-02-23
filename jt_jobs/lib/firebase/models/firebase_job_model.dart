import 'package:flutter/cupertino.dart';

class FirebaseJobModel {
  String address;
  String department;
  String description;
  String disability;
  String organization;
  String title;

  FirebaseJobModel({
    @required this.address,
    @required this.department,
    @required this.description,
    @required this.disability,
    @required this.organization,
    @required this.title,
  });

  FirebaseJobModel.fromMap(Map<dynamic, dynamic> data)
      : address = data['address'] ?? '',
        department = data['department'] ?? '',
        description = data['description'] ?? '',
        disability = data['disability'] ?? '',
        organization = data['organization'] ?? '',
        title = data['title'] ?? '';

  Map<String, dynamic> toMap() {
    return {
      "address": address,
      "department": department,
      "description": description,
      "disability": disability,
      "organization": organization,
      "title": title,
    };
  }
}
