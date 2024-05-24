import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/models/question/drug_dosing_data.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UFHDosingScreen extends StatelessWidget {
  UFHDosingScreen({super.key, required this.item});
  final DrugDosingParams item;
  final TestController _controller = Get.find();
  DrugDosingModel get model => _controller.selectedDrugDosing;

  String _getDosing() {
    var w = _controller.model.weight;

    var dosing = """
● IV administration: 
Start 70 Unit/kg (${70 * w}) (maximum 10000 unit) as bolus and then 15 unit/kg/hour (${15 * w}) (maximum 2000 unit/hour.). (American College of Cardiology)
Check aPTT (seconds) or Anti factor Xa activity (IU/ml) after 6 hour.
● SC administration with monitoring:
17500 unit (250 unit/kg (${250 * w})) given every 12 hours (as initial 5000 unit IV bolus dose is recommended to obtain rapid anticoagulation)
Adjust subsequent doses to attain a goal aPTT based on the institution- specific therapeutic range. 
● SC administration without monitoring:
333 unit/kg (${333 * w}) followed by 250 unit/kg (${250 * w}) given every 12 hours. (fixed dose unmonitored dosing regimen)

(ACC AHA VHD 2020)
""";

    model.drugDose = dosing;

    return dosing;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_getDosing()),
        testButton("Ok", () {
          Get.toNamed("/drug_dosing",
              arguments: item, preventDuplicates: false);
        }),
      ],
    );
  }
}
