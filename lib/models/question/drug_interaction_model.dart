enum DrugInteractionEnum { red, darkBlue, yellow, lightBlue, purple }

class DrugInteractionRowModel {
  DrugInteractionRowModel(
    this.drugName,
    this.drugInteractionIds, {
    this.calcType = DrugInteractionCalcType.check,
    this.value = 0,
  });

  String drugName;
  List<DrugInteractionWithType> drugInteractionIds = [];
  bool isChecked = false;
  DrugInteractionCalcType calcType;
  double value;

  factory DrugInteractionRowModel.fromJson(Map<String, dynamic> json) {
    List<DrugInteractionWithType> drugInteractionIds =
        (json['drugInteractionIds'] as List)
            .map((drugInteractionIdJson) =>
                DrugInteractionWithType.fromJson(drugInteractionIdJson))
            .toList();

    DrugInteractionCalcType calcType =
        DrugInteractionCalcType.values[json['calcType']];

    double value = json['value'];
    return DrugInteractionRowModel(
      json['drugName'],
      drugInteractionIds,
      calcType: calcType,
      value: value,
    );
  }
}

class DrugInteractionWithType {
  DrugInteractionWithType(this.drugId, this.type, [this.desc = ""]);

  int drugId;
  DrugInteractionEnum type;
  String desc;

  factory DrugInteractionWithType.fromJson(Map<String, dynamic> json) {
    int drugId = json['drugId'];
    DrugInteractionEnum type = DrugInteractionEnum.values[json['type']];
    String desc = json['desc'];
    return DrugInteractionWithType(drugId, type, desc);
  }
}

enum DrugInteractionCalcType { check, ageMore, ageLess, weightMore, weightLess }

class DrugInteractionModel {
  DrugInteractionModel({
    required this.redMessage,
    required this.darkBlueMessage,
    required this.yellowMessage,
    required this.lightBlueMessage,
    required this.purpleMessage,
    required this.drugs,
  });

  String redMessage;
  String darkBlueMessage;
  String yellowMessage;
  String lightBlueMessage;
  String purpleMessage;
  List<DrugInteractionRowModel> drugs = [];

  // List<dynamic> drugsJson = jsonDecode(await DefaultAssetBundle.of(context)
  //     .loadString('assets/data/drug_interaction.json'));
  factory DrugInteractionModel.fromJson(List<dynamic> drugsJson)  {
    return DrugInteractionModel(
        redMessage:
            "Contraindicated / not advisable due to increased plasma levels",
        darkBlueMessage: "Contraindicated due to reduced NOAC plasma levels",
        yellowMessage:
            "Caution required, especially in case of polypharmacy or in the presence of ≥2 yellow / bleeding risk factors",
        lightBlueMessage:
            "Caution required, especially in case of polypharmacy or in the presence of ≥2 light blue interactions due to reduced NOAC plasma levels.)",
        purpleMessage: "Lower dose recommended",
        drugs: drugsJson
            .map((drugJson) => DrugInteractionRowModel.fromJson(drugJson))
            .toList());
  }
}
