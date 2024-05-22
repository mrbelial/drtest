import 'package:drtest/models/question/question_model.dart';
import 'package:flutter/widgets.dart';

class DrugDosingModel {
  DrugDosingModel(this.drugId, this.drugDose, this.params);
  int drugId;
  String drugDose;
  List<DrugDosingParams> params;
}

class DrugDosingParams {
  DrugDosingParams({
    required this.title,
    this.desc = "",
    this.footer = "",
    this.calc,
    this.hasDoneButton = true,
  });

  String title;
  String desc;
  String footer;
  Widget? calc;
  bool hasDoneButton;
}

List<DrugDosingModel> drugDosing(TestModel model) => [
      DrugDosingModel(
        2,
        "",
        [
          DrugDosingParams(title: """
● IV administration: 
Start 70 Unit/kg (${70 * model.weight}) (maximum 10000 unit) as bolus and then 15 unit/kg/hour (${15 * model.weight}) (maximum 2000 unit/hour.). (American College of Cardiology)
Check aPTT (seconds) or Anti factor Xa activity (IU/ml) after 6 hour.
● SC administration with monitoring:
17500 unit (250 unit/kg (${250 * model.weight})) given every 12 hours (as initial 5000 unit IV bolus dose is recommended to obtain rapid anticoagulation)
Adjust subsequent doses to attain a goal aPTT based on the institution- specific therapeutic range. 
● SC administration without monitoring:
333 unit/kg (${333 * model.weight}) followed by 250 unit/kg (${250 * model.weight}) given every 12 hours. (fixed dose unmonitored dosing regimen)

(ACC AHA VHD 2020)
"""),
        ],
      )
    ];
