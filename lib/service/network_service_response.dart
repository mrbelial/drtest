class NetworkServiceResponse<T> {
  T content;
  bool success;
  String message;
  int statusCode;
  NetworkServiceResponse(
      {required this.content,required this.success,required this.message,required this.statusCode});
}

class MappedNetworkServiceResponse<T> {
  dynamic mappedResult;
  NetworkServiceResponse<T> networkServiceResponse;
  MappedNetworkServiceResponse(
      {this.mappedResult, required this.networkServiceResponse});
}
