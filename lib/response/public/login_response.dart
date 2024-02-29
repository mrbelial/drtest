
import '../../models/public/login_model.dart';
import '../../models/public/response_model.dart';

class LoginResponse extends BaseModel<LoginModel> {
  Duration timer = const Duration(seconds: 0);
  String username = "", password = "";

  LoginResponse();

  LoginResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    statusCode = json['statusCode'];
    if (json['data'] != null) {
      content = LoginModel.fromJson(json['data']);
    }
  }
}
