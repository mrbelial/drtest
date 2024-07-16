import '../user/user_model.dart';

class MainModel {
  MainModel({
    required this.user,
    required this.aboutus,
  });

  UserModel user = UserModel();
  String aboutus = "";

  bool termsChecked = false;
}
