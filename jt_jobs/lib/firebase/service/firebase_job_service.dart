import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jt_jobs/firebase/models/applications_model.dart';
import 'package:jt_jobs/firebase/models/firebase_job_model.dart';

class FirebaseJobService {
  List<String> fireListIds = [];
  Map<String, bool> fireApi;
  FirebaseJobService({this.fireApi});
  Future<List<FirebaseJobModel>> getData() async {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('job');
    QuerySnapshot querySnapshot = await _collectionRef.get();
    List<FirebaseJobModel> allData = [];
    for (var element in querySnapshot.docs) {
      allData.add(FirebaseJobModel.fromMap(element.data(), element.id));
    }
    return allData;
  }

  void upLoad(FirebaseJobModel model) {
    FirebaseFirestore.instance.collection("job").add(model.toMap());
  }

  Future<void> addApplication(String jobID, String userID) async {
    ApplicationsModel model = ApplicationsModel(jobID: jobID, userID: userID);
    await FirebaseFirestore.instance
        .collection("/Applications")
        .doc(jobID)
        .set(model.toMap());
  }
}
