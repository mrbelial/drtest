import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HasBledScreen extends StatelessWidget {
  HasBledScreen({super.key});
  final TestController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HAS-BLED Calculator"),
        actions: [
          IconButton(
              onPressed: () {
                testMessage(_controller.model.hbDesc, Get.back);
              },
              icon: const Icon(Icons.help_outline))
        ],
      ),
      body: Obx(() {
        return ListView(
          padding: AppConst.defaultPadding,
          children: [
            testTitle("HAS-BLED Calculator (ESC 2020 AF IIa B)"),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _controller.model.hbAnswer.length,
                itemBuilder: (c, i) {
                  var item = _controller.model.hbAnswer[i];
                  return checkBox(
                    id: 0,
                    title: "${item.title} (${item.point})",
                    checked: item.checked,
                    onChange: (_, b) {
                      _controller.hbAnswer(i, b);
                      _controller.calcHB();
                    },
                  );
                }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: badge(
                color: AppColors.warning,
                child: Text(
                  "Point: ${_controller.calcHB().title}",
                  style:
                      AppTextStyles.headline4.copyWith(color: AppColors.black),
                ),
              ),
            ),
            testButton("Done", () {
              var result = _controller.calcHB();
              testMessage(result.desc, () {
                Get.back();
                Get.toNamed("/cockcroft_gault");
              });
            }),
          ],
        );
      }),
    );
  }
}
