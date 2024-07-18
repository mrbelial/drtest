import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlateletCountScreen extends StatelessWidget {
  PlateletCountScreen({super.key});
  final TestController _controller = Get.find();

  final FocusNode _ulFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Platelet Count"),
        ),
        body: ListView(
          padding: AppConst.defaultPadding,
          children: [
            Obx(() {
              return testTitle(
                  "Platelet Count : ${_controller.model.ulValue} (Cell/ µL) (Normal range: 150000 - 450000 Cell/µL) (ESC NOAC 2021)");
            }),
            textField(
              autofocus: true,
              maxLength: 15,
              type: TextInputType.number,
              hint: "µL",
              label: "µL",
              focusNode: _ulFocusNode,
              onChanged: (v) => _controller.ul = int.tryParse(v),
            ),
            const SizedBox(height: 15),
            testButton("Done", () {
              if (_controller.ul == null) {
                ShowMSG.error("Error", "Please Enter µL.");
                _ulFocusNode.requestFocus();
                return;
              }
              Get.toNamed("/bmi_calculator");
            }),
          ],
        ));
  }
}
