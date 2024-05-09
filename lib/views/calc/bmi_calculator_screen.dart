import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BMICalculatorScreen extends StatelessWidget {
  BMICalculatorScreen({super.key});
  final TestController _controller = Get.find();

  final FocusNode _heightFocusNode = FocusNode();
  final FocusNode _weightFocusNode = FocusNode();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _heightController.text = _controller.height.toString();
    _weightController.text = _controller.weight.toString();

    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI calculator"),
        ),
        body: ListView(
          padding: AppConst.defaultPadding,
          children: [
            testTitle(
                "BMI calculator (ESC NOAC 2021) (AHA/ACC/ACCP/HRS AF 2023)"),
            textField(
              autofocus: true,
              maxLength: 15,
              type: TextInputType.number,
              hint: "Height (cm)",
              label: "Height (cm)",
              focusNode: _heightFocusNode,
              controller: _heightController,
              onChanged: (v) {
                _controller.height = int.tryParse(v) ?? 0;
              },
            ),
            textField(
              maxLength: 15,
              type: TextInputType.number,
              hint: "Weight (kg)",
              label: "Weight (kg)",
              focusNode: _weightFocusNode,
              controller: _weightController,
              onChanged: (v) {
                _controller.weight = int.tryParse(v) ?? 0;
              },
            ),
            Obx(() {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: badge(
                  color: AppColors.warning,
                  child: Text(
                    "${_controller.bmi} kg/m2",
                    style: AppTextStyles.headline4
                        .copyWith(color: AppColors.black),
                  ),
                ),
              );
            }),
            const SizedBox(height: 15),
            testButton("Done", () {
              if (_controller.height == 0) {
                ShowMSG.error("Error", "Please Enter Height.");
                _heightFocusNode.requestFocus();
                return;
              }
              if (_controller.weight == 0) {
                ShowMSG.error("Error", "Please Enter Weight.");
                _weightFocusNode.requestFocus();
                return;
              }

              Get.toNamed("/test_situations_page");
            }),
          ],
        ));
  }
}
