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
  final TextEditingController _scController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _ageController.text = _controller.age.toString();
    _weightController.text = _controller.weight.toString();
    _scController.text = _controller.serumCreatinine.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cockcroft-Gault Calculator"),
        actions: [
          IconButton(
              onPressed: () {
                testMessage(_controller.model.cgDesc, Get.back);
              },
              icon: const Icon(Icons.help_outline))
        ],
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
            onChanged: (v) {
              _controller.age = int.tryParse(v) ?? 0;
              _controller.calcCG();
            },
          ),
          textField(
            maxLength: 50,
            type: TextInputType.numberWithOptions(decimal: true),
            formatter: [DecimalTextInputFormatter(decimalRange: 5)],
            hint: "mg/dL",
            label: "Serum creatinine",
            focusNode: _scFocusNode,
            controller: _scController,
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
            controller: _weightController,
            onChanged: (weight) {
              _controller.weight = int.tryParse(weight) ?? 0;
              _controller.calcCG();
            },
          ),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: testBadge(text: _controller.cgDesc()),
            );
          }),
          testButton("Done", () {
            _controller.calcCG();

            if (_controller.age < 18) {
              ShowMSG.error("Error", "Please Valid Enter Age.");
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

            testMessage(
                "Creatinine Clearance: ${_controller.model.cgAnswer} (mL/min)",
                () {
              Get.back();
              Get.toNamed("/child_pugh");
            });
          }),
        ],
      ),
    );
  }
}
