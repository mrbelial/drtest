import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CockcroftGaultScreen extends StatelessWidget {
  CockcroftGaultScreen({super.key});
  final TestController _controller = Get.find();
  final FocusNode _ageFocusNode = FocusNode();
  final FocusNode _scFocusNode = FocusNode();
  final FocusNode _weightFocusNode = FocusNode();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _ageController.text = _controller.age.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cockcroft-Gault Calculator"),
      ),
      body: ListView(
        padding: AppConst.defaultPadding,
        children: [
          testTitle(
              "Cockcroft-Gault Calculator (AHA/ACC/ACCP/HRS AF 2023) (ESC NOAC 2021)"),
          Obx(() {
            return Row(
              children: [
                Expanded(
                  child: radioButton(
                      title: "Male",
                      value: _controller.isFemale ? 0 : 1,
                      groupValue: 1,
                      onChanged: (i) {
                        _controller.isFemale = false;
                        _controller.calcCG();
                      }),
                ),
                Expanded(
                  child: radioButton(
                      title: "Female",
                      value: _controller.isFemale ? 1 : 0,
                      groupValue: 1,
                      onChanged: (i) {
                        _controller.isFemale = true;
                        _controller.calcCG();
                      }),
                ),
              ],
            );
          }),
          textField(
            autofocus: true,
            maxLength: 3,
            type: TextInputType.number,
            formatter: [NumericalRangeFormatter(min: 0, max: 150)],
            hint: "Year",
            label: "Age",
            focusNode: _ageFocusNode,
            controller: _ageController,
            onChanged: (age) {
              _controller.age = int.tryParse(age) ?? 0;
              _controller.calcCG();
            },
          ),
          textField(
            maxLength: 5,
            type: TextInputType.number,
            formatter: [
              NumericalRangeFormatter(
                min: 0,
                max: 50000,
                decimalDigits: 3,
              )
            ],
            hint: "mg/dL",
            label: "Serum creatinine",
            focusNode: _scFocusNode,
            onChanged: (sc) {
              _controller.serumCreatinine = double.tryParse(sc) ?? 0;
              _controller.calcCG();
            },
          ),
          textField(
            maxLength: 3,
            type: TextInputType.number,
            formatter: [NumericalRangeFormatter(min: 0, max: 250)],
            hint: "kg",
            label: "Weight",
            focusNode: _weightFocusNode,
            onChanged: (weight) {
              _controller.weight = int.tryParse(weight) ?? 0;
              _controller.calcCG();
            },
          ),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: badge(
                color: AppColors.warning,
                child: Text(
                  "Point: ${_controller.model.cgAnswer} (mL/min)",
                  style:
                      AppTextStyles.headline4.copyWith(color: AppColors.black),
                ),
              ),
            );
          }),
          testButton("Done", () {
            _controller.calcCG();

            if (_controller.age == 0) {
              ShowMSG.error("Error", "Please Enter Age.");
              _ageFocusNode.requestFocus();
              return;
            }
            if (_controller.serumCreatinine == 0) {
              ShowMSG.error("Error", "Please Enter Serum Creatinine.");
              _scFocusNode.requestFocus();
              return;
            }
            if (_controller.weight == 0) {
              ShowMSG.error("Error", "Please Enter Weight.");
              _weightFocusNode.requestFocus();
              return;
            }

            testMessage("Point: ${_controller.model.cgAnswer} (mL/min)", () {
              Get.back();
              Get.toNamed("/child_pugh");
            });
          }),
        ],
      ),
    );
  }
}
