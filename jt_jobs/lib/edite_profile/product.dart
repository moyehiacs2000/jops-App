import 'package:jt_jobs/firebase/models/user_model.dart';

class UserData {
  UserModel userExm;
  void fill() {
    userExm = UserModel(
        name: "mohamed", email: "Yehia", jopTitle: "Mobile Developer");
    userExm.skills = [];
    userExm.addSkill("c++");
    userExm.addSkill("python");
    userExm.addSkill("c#");
    userExm.addSkill("Java");
    userExm.addSkill("kotlin");
    userExm.addSkill("Computer Vision");
    userExm.addSkill("OOP");
    userExm.addSkill("Rx Java");
    userExm.addSkill("Sql");
    userExm.addSkill("SQLite");
  }
}
