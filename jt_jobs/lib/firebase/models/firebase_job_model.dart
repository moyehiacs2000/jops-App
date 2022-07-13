import 'package:flutter/cupertino.dart';

class FirebaseJobModel {
  String jobID;
  String companyLogoUrl;
  String companyName;
  String title;
  String location;
  String description;
  String postedAt;
  String scheduleType;

  FirebaseJobModel({
    @required this.companyLogoUrl,
    @required this.companyName,
    @required this.title,
    @required this.location,
    @required this.description,
    @required this.postedAt,
    @required this.scheduleType,
  });

  FirebaseJobModel.fromMap(Map<dynamic, dynamic> data, String id)
      : jobID = id ?? '',
        companyLogoUrl = data['company_logo_url'] ?? '',
        companyName = data['company_name'] ?? '',
        title = data['title'] ?? '',
        location = data['location'] ?? '',
        description = data['description'] ?? '',
        postedAt = data['posted_at'] ?? '',
        scheduleType = data['schedule_type'] ?? '';

  Map<String, dynamic> toMap() {
    return {
      "company_logo_url": companyLogoUrl,
      "company_name": companyName,
      "title": title,
      "location": location,
      "description": description,
      "posted_at": postedAt,
      "schedule_type": scheduleType
    };
  }
}
