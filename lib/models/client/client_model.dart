class ClientModel {
  int id = 0;
  String name = "";
  List<ClientProgramModel> programs = [];
  ClientModel({required this.id, required this.name});

  ClientModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class ClientProgramModel {
  int id = 0;
  String title = "";
  int age = 20;
  String goal = "";
  int height = 170;
  int weight = 65;
  List<ProgramDayModel> days = [];
}

class ProgramDayModel {
  int id = 0;
  String title = "";
  String dayName = "";
  int dayOfWeek = 0;
  List<MovementModel> movements = [];
}

class MovementModel {
  int id = 0;
  int movementId = 0;
  int movementTypeId = 0;
  int index = 0;
  String qty = "";
  String title = "";
}
