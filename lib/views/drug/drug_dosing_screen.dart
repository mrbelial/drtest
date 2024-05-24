import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/models/question/drug_dosing_data.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrugDosingScreen extends StatelessWidget {
  DrugDosingScreen({super.key});
  final TestController _testController = Get.find();
  // DrugDosingModel get model => _testController.selectedDrugDosing;

  void ontap(DrugDosingParams item) {
    if (item.params.isEmpty) {
      Get.offAllNamed("/home");
    } else {
      Get.toNamed("/drug_dosing", arguments: item, preventDuplicates: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    DrugDosingParams model =
        Get.arguments ?? _testController.selectedDrugDosing.param;

    var title = model.title.isEmpty
        ? _testController.selectedDrugDosing.drugName
        : model.title;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        padding: AppConst.defaultPadding,
        children: [
          Text(model.desc),
          ListView.builder(
            itemCount: model.params.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var item = model.params[index];
              if (item.page.isNotEmpty) {
                return _testController.getDrugDosingWidget(item);
              }
              if (item.type == DrugParamTypeEnum.button) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: testButton(item.buttonTitle, () {
                    if (item.msg.isNotEmpty) {
                      testMessage(item.msg, () => ontap(item));
                    } else {
                      ontap(item);
                    }
                  }),
                );
              }
              return Container();
            },
          ),
          Text(model.footer),
        ],
      ),
    );
  }
}
