import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test3Screen extends StatelessWidget {
  Test3Screen({super.key});
  final TestController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Step 3"),
      ),
      body: ListView(
        padding: AppConst.defaultPadding,
        children: [
          testTitle(_controller.model.q4Title),
          testButton("Yes", () {
            testMessage(_controller.model.q4Yes, toMain);
          }),
          testButton("No", () {
            testMessage(_controller.model.q4No, () {
              Get.back();
              Get.toNamed("/has_bled");
            });
          }),
        ],
      ),
    );
  }
}
