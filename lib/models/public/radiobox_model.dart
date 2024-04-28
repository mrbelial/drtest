class RadioBoxModel {
  RadioBoxModel(this.id, this.title, [this.point = 0]);
  int id;
  String title;
  int point;
}

class RadioGroupModel {
  RadioGroupModel({
    required this.id,
    required this.title,
    required this.selectedID,
    required this.point,
    required this.radios,
  });
  int id;
  String title;
  int selectedID;
  int point;
  List<RadioBoxModel> radios;
}
