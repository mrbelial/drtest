import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/models/question/question_model.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrugsScreen extends StatelessWidget {
  DrugsScreen({super.key});
  final TestController _controller = Get.find();
  TestFilteredDrugModel get model => _controller.model.testFilteredDrug;

  @override
  Widget build(BuildContext context) {
    _controller.initTestFilteredDrugs();
    _controller.initDrugDosing();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drugs"),
      ),
      body: Obx(() {
        return ListView(
          padding: AppConst.defaultPadding,
          children: [
            ...model.titles.map((e) => cardBox(
                    child: Text(
                  e,
                  style: AppTextStyles.bodyTextLargeDark,
                ))),
            ...model.drugs.map(
              (e) {
                var status = _controller.getDrugInteractions(e.id);

                return testButton(e.name, () {
                  if (status.isAllowed) {
                    Get.toNamed("/drug_dosing", arguments: e);
                  } else {
                    testMessage(status.message, Get.back);
                  }
                }, color: status.color);
              },
            ),
            appButton(
                title: "Drug Interaction",
                onTap: () {
                  Get.toNamed("/drug_interaction");
                }),
          ],
        );
      }),
    );
  }
}
