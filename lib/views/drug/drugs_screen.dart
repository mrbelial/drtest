import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/models/question/question_model.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrugsScreen extends StatelessWidget {
  DrugsScreen({super.key});
  final TestController _controller = Get.find();

  TestFilteredDrugModel filteredDrugs() {
    TestFilteredDrugModel model = TestFilteredDrugModel();

    for (var item in _controller.selectedDrugs) {
      model.titles.add(item.title);

      for (var drug in item.drugIds) {
        if (!model.drugIds.contains(drug)) {
          model.drugIds.add(drug);
        }
      }
    }

    model.drugs = _controller.getDrugsByIDs(model.drugIds.toList());

    return model;
  }

  @override
  Widget build(BuildContext context) {
    var model = filteredDrugs();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drugs"),
      ),
      body: ListView(
        padding: AppConst.defaultPadding,
        children: [
          ...model.titles.map((e) => cardBox(
                  child: Text(
                e,
                style: AppTextStyles.bodyTextLargeDark,
              ))),
          ...model.drugs.map((e) => testButton(e.name, () {
                Get.toNamed("/drug_dosing", arguments: e);
              })),
        ],
      ),
    );
  }
}
