import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/models/question/drug_dosing_data.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LMWHDosingScreen extends StatelessWidget {
  LMWHDosingScreen({super.key, required this.item});
  final DrugDosingParams item;
  final TestController _controller = Get.find();
  DrugDosingModel get model => _controller.selectedDrugDosing;

  @override
  Widget build(BuildContext context) {
    var list = _controller.initLMWHDosing();
    model.drugDose = list.join("\n\n");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var item in list)
          cardBox(
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              item,
              style: AppTextStyles.text1.copyWith(color: AppColors.black),
            ),
          ),
        testButton("Ok", () {
          Get.toNamed("/drug_dosing",
              arguments: item.params.first, preventDuplicates: false);
        }),
      ],
    );
  }
}
