import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/models/models.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestScreen extends StatelessWidget {
  TestScreen({super.key});
  final _controller = Get.put(TestController());
  final TestModel selectedTest = Get.arguments ?? TestModel();

  @override
  Widget build(BuildContext context) {
    _controller.newTest(selectedTest);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirm Diagnosis"),
        actions: [
          IconButton(
              onPressed: () {
                testMessage(_controller.model.q1Desc, Get.back);
              },
              icon: const Icon(Icons.help_outline))
        ],
      ),
      body: Container(
        padding: AppConst.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            testTitle(_controller.model.q1Title),
            testButton("Yes", () {
              _controller.qa1 = true;
              Get.toNamed("/test2");
            }),
            testButton("No", () {
              _controller.qa1 = false;
              testMessage('The End.', () {
                Get.back();
                toMain();
              }, title: "Test Finished");
            }),
          ],
        ),
      ),
    );
  }
}
