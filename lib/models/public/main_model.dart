import '../user/user_model.dart';

class MainModel {
  MainModel({
    required this.user,
  });

  UserModel user = UserModel();

  bool termsChecked = false;
}
