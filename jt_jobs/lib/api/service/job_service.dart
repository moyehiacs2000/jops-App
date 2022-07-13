import 'package:dio/dio.dart';
import 'package:jt_jobs/api/models/api_jop.dart';

class JobService {
  String baseUrl =
      "https://serpapi.com/search.json?engine=google_jobs&q=barista+new+york&hl=en&api_key=4d7fa40b2c9496f608a5e5b435f1be584cb2aec7c743fda2e57dd17791ff7adf";
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
