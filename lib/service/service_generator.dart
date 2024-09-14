import 'package:dio/dio.dart';
import 'package:drtest/models/public/login_model.dart';
import 'package:drtest/models/public/response_model.dart';
import 'package:drtest/response/public/login_response.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/tools/logger.dart';

import '../tools/config.dart';
import 'error.dart';
import 'logging_interceptor.dart';

class ServiceGenerator {
  late Dio _dio;
  var msg = "بروز خطا";

  updateDio(Map<String, String> header) {
    BaseOptions options = BaseOptions(
      headers: header,
      baseUrl: urlBaseApi,
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
      // contentType: ContentType.json.toString(),
    );
    _dio = Dio(options);
    _dio.interceptors.add(LoggingInterceptor());
  }

  BaseModel<T> _getError<T>(dynamic error, BaseModel<T> response) {
    if (error is DioException) {
      DioException e = error;
      response.content = null;
      response.isSuccess = false;
      response.statusCode = e.response?.statusCode ?? 0;
      response.message = handleError(error);
    } else {
      response.content = null;
      response.isSuccess = false;
      response.statusCode = 0;
      response.message = msg;
    }
    return response;
  }

  ResponseModel _getErrorFromResponse(dynamic error) {
    ResponseModel response = ResponseModel();
    if (error is DioException) {
      DioException e = error;
      response.content = null;
      response.isSuccess = false;
      response.statusCode = e.response?.statusCode ?? 0;
      response.message = handleError(error);
    } else {
      response.content = null;
      response.isSuccess = false;
      response.statusCode = 0;
      response.message = msg;
    }
    return response;
  }

  Future<BaseModel<LoginModel>> splash() async {
    try {
      Response response = await _dio.get(ServerConfig.urlSplash);
      return LoginResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
      return _getError<LoginModel>(error, LoginResponse());
    }
  }

  Future<BaseModel<LoginModel>> authenticate(params) async {
    try {
      Response response =
          await _dio.post(ServerConfig.urlAuthenticate, data: params);
      return LoginResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      loggerNoStack.e("Exception occured: $error stackTrace: $stacktrace");
      return _getError<LoginModel>(error, LoginResponse());
    }
  }
}
