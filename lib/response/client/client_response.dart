import '../../models/client/client_model.dart';
import '../../models/public/response_model.dart';

class ClientResponse extends BaseModel<List<ClientModel>> {
  ClientResponse();
  int selectedClient = 0;
  int selectedProgram = 0;
  int selectedDay = 0;

  ClientResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    statusCode = json['statusCode'];
    if (json['data'] != null) {
      content =
          List.from(json['data']).map((e) => ClientModel.fromJson(e)).toList();
    }
  }
}
