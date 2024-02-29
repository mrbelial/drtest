import 'dart:async';

import 'package:get/get.dart';

import '../models/public/login_model.dart';
import '../models/public/response_model.dart';
import '../response/public/login_response.dart';
import 'main_controller.dart';

class LoginController extends GetxController {
  final MainController mainController = Get.find();

  final _response = LoginResponse().obs;
  LoginResponse get loginResponse => _response.value;

  final _isloading = false.obs;
  bool get isloading => _isloading.value;
  set isloading(bool val) => _isloading.value = val;

  set username(String v) => _response.update((val) => val!.username = v);
  String get username => loginResponse.username;

  set password(String v) => _response.update((val) => val!.password = v);
  String get password => loginResponse.password;

  Future<BaseModel<LoginModel>> authenticate() async {
    var params = {
      "UserName": loginResponse.username,
      "Password": loginResponse.password
    };

    isloading = true;
    var response = await mainController.apiService.authenticate(params);
    if (response.isSuccess && response.content != null) {
      mainController.fillData(response.content!);
    }
    isloading = false;
    return response;
  }
}
