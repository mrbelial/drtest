import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/models/question/part3_data.dart';
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
        actions: [
          IconButton(
              onPressed: () => Get.toNamed("/drug_interaction_description2"),
              icon: const Icon(Icons.help))
        ],
      ),
      body: Obx(() {
        return ListView(
          padding: AppConst.defaultPadding,
          children: _controller.model.ulValue < 25000
              ? [
                  cardBox(child: Text("""Thrombocytopenia
•	Avoid anticoagulation therapy due to the high risk of spontaneous Bleeding. (EHRA/NOAC/AF 2021)
•	Absolute contraindications to OACs. (AF ESC 2020)
•	Temporarily hold anticoagulant until platelet count increases above 25000 / µl. (UpToDate)
""", style: AppTextStyles.title3.apply(color: AppColors.black)))
                ]
              : [
                  ...model.titles.map((e) => cardBox(
                      child: Text(e,
                          style: AppTextStyles.title3
                              .apply(color: AppColors.black)))),
                  ...model.drugs.map(
                    (e) {
                      var status = _controller.getDrugInteractions(e.id);

                      return testButton(e.name, () {
                        _controller.selectDrugDosing(e.id);
                        if (status.isAllowed) {
                          Get.toNamed("/drug_dosing");
                        } else {
                          testdrugMessage(
                            status.interactions
                                .map((x) => Text(
                                      "${x.drugName}\n${x.desc}\n",
                                      style: AppTextStyles.text1
                                          .copyWith(color: x.color),
                                    ))
                                .toList(),
                            Get.back,
                            button2Title: "No Problem",
                            ontap2: _controller.isDrugAllowedToContinue(e.id)
                                ? () {
                                    Get.back();
                                    Get.toNamed("/drug_dosing");
                                  }
                                : null,
                          );
                        }
                      }, color: status.color);
                    },
                  ),
                  testButton("Consider DOACs Drug Interaction", () {
                    Get.toNamed("/drug_interaction");
                  }, color: AppColors.red),
                  testButton(
                    "Continue",
                    () => Get.toNamed(
                      "/part3",
                      arguments: part3Data(_controller.model),
                    ),
                    color: AppColors.orange,
                  ),
                ],
        );
      }),
    );
  }
}
