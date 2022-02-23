import 'package:cloud_firestore/cloud_firestore.dart';
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
      allData.add(FirebaseJobModel.fromMap(element.data()));
    }
    return allData;
  }

  void upLoad(FirebaseJobModel model) {
    FirebaseFirestore.instance.collection("job").add(model.toMap());
  }
}
