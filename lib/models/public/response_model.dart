abstract class BaseModel<T> {
  bool isSuccess = false;
  String message = "";
  int statusCode = 0;
  bool isLoading = false;
  T? content;

  BaseModel();
}

class ResponseModel extends BaseModel {
  ResponseModel({
    bool isSuccess = false,
    String message = "",
    int statusCode = 0,
    bool isLoading = false,
  }) {
    this.isSuccess = isSuccess;
    this.message = message;
    this.statusCode = statusCode;
    this.isLoading = isLoading;
  }

  ResponseModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json["isSuccess"] ?? false;
    message = json["message"] ?? "";
    statusCode = json["statusCode"] ?? 500;
  }

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "statusCode": statusCode,
      };
}
