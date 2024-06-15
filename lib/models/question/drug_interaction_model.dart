import 'package:drtest/tools/core.dart';
import 'package:flutter/material.dart';

enum DrugInteractionEnum { red, darkBlue, yellow, lightBlue, purple, none }

DrugInteractionEnum drugInteractionEnumGet(int v) {
  switch (v) {
    case 0:
      return DrugInteractionEnum.red;
    case 1:
      return DrugInteractionEnum.darkBlue;
    case 2:
      return DrugInteractionEnum.yellow;
    case 3:
      return DrugInteractionEnum.lightBlue;
    default:
      return DrugInteractionEnum.purple;
  }
}

extension DrugInteractionColor on DrugInteractionEnum {
  Color toColor() {
    switch (this) {
      case DrugInteractionEnum.red:
        return AppColors.red;

      case DrugInteractionEnum.darkBlue:
        return AppColors.blue;
      case DrugInteractionEnum.yellow:
        return AppColors.yellow;
      case DrugInteractionEnum.lightBlue:
        return AppColors.blue2;
      case DrugInteractionEnum.purple:
        return AppColors.purple;
      default:
        return AppColors.black;
    }
  }
}

enum DrugInteractionCalcType {
  check,
  ageMore,
  ageLess,
  weightMore,
  weightLess,
  crcfMore,
  crcfLess,
  singleRed
}

DrugInteractionCalcType drugInteractionCalcTypeGet(String v) {
  switch (v) {
    case "ageMore":
      return DrugInteractionCalcType.ageMore;
    case "ageLess":
      return DrugInteractionCalcType.ageLess;
    case "weightMore":
      return DrugInteractionCalcType.weightMore;
    case "weightLess":
      return DrugInteractionCalcType.weightLess;
    case "crcfMore":
      return DrugInteractionCalcType.crcfMore;
    case "crcfLess":
      return DrugInteractionCalcType.crcfLess;
    default:
      return DrugInteractionCalcType.check;
  }
}

class DrugInteractionRowModel {
  DrugInteractionRowModel(
    this.drugName,
    this.drugInteractions, {
    this.calcType = DrugInteractionCalcType.check,
    this.value = 0,
    this.id = 0,
  });

  String drugName;
  List<DrugInteractionWithType> drugInteractions = [];
  bool isChecked = false;
  DrugInteractionCalcType calcType;
  double value;
  int id;

  factory DrugInteractionRowModel.fromJson(Map<String, dynamic> json) {
    return DrugInteractionRowModel(
      json['drugName'],
      (json['interactionDrugs'] as List)
          .map((drugInteractionIdJson) =>
              DrugInteractionWithType.fromJson(drugInteractionIdJson))
          .toList(),
      calcType: drugInteractionCalcTypeGet(json['calcType'] ?? ""),
      value: double.parse(json['value']?.toString() ?? "0"),
    );
  }
}

class DrugInteractionWithType {
  DrugInteractionWithType(this.drugId, this.type,
      {this.desc = "",
      this.calcType = DrugInteractionCalcType.check,
      this.value = 0});

  int drugId;
  DrugInteractionEnum type;
  String desc;
  DrugInteractionCalcType calcType;
  double value;

  factory DrugInteractionWithType.fromJson(Map<String, dynamic> json) {
    return DrugInteractionWithType(
        json['drugId'], drugInteractionEnumGet(json['type']),
        desc: json['desc'] ?? "");
  }
}

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
  factory DrugInteractionModel.fromList(List<DrugInteractionRowModel> d) {
    return DrugInteractionModel(
        redMessage:
            "Contraindicated / not advisable due to increased plasma levels or increase in the risk of bleeding",
        darkBlueMessage:
            "Contraindicated due to reduced NOAC plasma levels or an increase in the risk of thromboembolic events.",
        yellowMessage:
            "Caution required, especially in case of polypharmacy or in the presence of ≥2 yellow / bleeding risk factors",
        lightBlueMessage:
            "Caution required, especially in case of polypharmacy or in the presence of ≥2 light blue interactions due to reduced NOAC plasma levels.)",
        purpleMessage: "Lower dose recommended",
        drugs: d);
  }

  // factory DrugInteractionModel.fromJson(List<dynamic> drugsJson) {
  //   return DrugInteractionModel(
  //       redMessage:
  //           "Contraindicated / not advisable due to increased plasma levels",
  //       darkBlueMessage: "Contraindicated due to reduced NOAC plasma levels",
  //       yellowMessage:
  //           "Caution required, especially in case of polypharmacy or in the presence of ≥2 yellow / bleeding risk factors",
  //       lightBlueMessage:
  //           "Caution required, especially in case of polypharmacy or in the presence of ≥2 light blue interactions due to reduced NOAC plasma levels.)",
  //       purpleMessage: "Lower dose recommended",
  //       drugs:
  //           drugsJson.map((e) => DrugInteractionRowModel.fromJson(e)).toList());
  // }
}
