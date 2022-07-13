import 'package:flutter/cupertino.dart';

class ApplicationsModel {
  String userID;
  String jobID;
  ApplicationsModel({@required this.jobID, @required this.userID});
  ApplicationsModel.fromMap(Map<dynamic, dynamic> data)
      : jobID = data['jobID'] ?? '',
        userID = data['userID'] ?? '';
  Map<String, dynamic> toMap() {
    return {"jobID": jobID, "userID": userID};
  }
}
