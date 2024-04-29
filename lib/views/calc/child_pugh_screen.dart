import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChildPughScreen extends StatelessWidget {
  ChildPughScreen({super.key});
  final TestController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Child Pugh Calculator"),
      ),
      body: ListView(
        padding: AppConst.defaultPadding,
        children: [
          testTitle("Child Pugh Calculator (ESC NOAC 2021)"),
          Obx(() {
            return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _controller.model.cpQuestions.length,
                itemBuilder: (c, i) {
                  var item = _controller.model.cpQuestions[i];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        color: AppColors.blue,
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          item.title,
                          style: AppTextStyles.headline2,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      for (var r in item.radios)
                        radioButton(
                            title: r.title,
                            value: r.id,
                            groupValue: item.selectedID,
                            onChanged: (v) =>
                                _controller.cpAnswer(i, r.id, r.point)),
                    ],
                  );
                });
          }),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: badge(
                color: AppColors.warning,
                child: Text(
                  _controller.calcCP().title,
                  style:
                      AppTextStyles.headline4.copyWith(color: AppColors.black),
                ),
              ),
            );
          }),
          testButton("Done", () {
            var result = _controller.calcCP();

            testMessage(result.title, () {
              Get.back();
              Get.toNamed("/platelet_count");
            });
          }),
        ],
      ),
    );
  }
}
