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
                child: Text(e, style: AppTextStyles.bodyTextLargeDark))),
            ...model.drugs.map(
              (e) {
                var status = _controller.getDrugInteractions(e.id);

                return testButton(e.name, () {
                  _controller.selectDrugDosing(e.id);
                  if (status.isAllowed) {
                    Get.toNamed("/drug_dosing");
                  } else {
                    print(_controller.model.cgAnswer);
                    print(e.id);
                    testdrugMessage(
                      status.interactions
                          .map((x) => Text(
                                "${x.drugName}\n${x.desc}\n",
                                style: AppTextStyles.bodyText1
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
          ],
        );
      }),
    );
  }
}
