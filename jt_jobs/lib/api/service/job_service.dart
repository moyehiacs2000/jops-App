import 'package:dio/dio.dart';
import 'package:jt_jobs/api/models/api_jop.dart';

class JobService {
  String baseUrl =
      "https://serpapi.com/search.json?engine=google_jobs&q=barista+new+york&hl=en&api_key=15e0b21572ca4431586ce36d46830a92dd8f1c87170ce7896c62c511823c53be";
  List<JobsResult> jobList = [];
  Future<List<JobsResult>> getJob() async {
    try {
      Response response = await Dio().get(baseUrl);
      var data = response.data;
      jobList = Welcome.fromJson(data).jobsResults;
    } catch (e) {
      print(e);
    }
    return jobList;
  }
}
