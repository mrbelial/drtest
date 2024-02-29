import '../../models/public/main_model.dart';
import '../../models/public/response_model.dart';

class MainResponse extends BaseModel<MainModel> {
  MainResponse();

  MainResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json["isSuccess"] ?? false;
    message = json["message"] ?? "";
    statusCode = json["statusCode"] ?? 500;
    // if (json["data"] != null) content = MainModel.fromJson(json["data"]);
  }
}
