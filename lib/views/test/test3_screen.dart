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
      body: Obx(() {
        return ListView(
          padding: AppConst.defaultPadding,
          children: [
            testTitle(_controller.model.q3Title),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _controller.model.q3Answer.length,
                itemBuilder: (c, i) {
                  var item = _controller.model.q3Answer[i];
                  return checkBox(
                    id: 0,
                    title: item.title,
                    checked: item.checked,
                    onChange: (_, b) => _controller.q3Answer(i, b),
                  );
                }),
            Row(
              children: [
                Expanded(
                  child: radioButton(
                      title: "Male",
                      value: _controller.isFemale ? 0 : 1,
                      groupValue: 1,
                      onChanged: (i) => _controller.isFemale = false),
                ),
                Expanded(
                  child: radioButton(
                      title: "Female",
                      value: _controller.isFemale ? 1 : 0,
                      groupValue: 1,
                      onChanged: (i) => _controller.isFemale = true),
                ),
              ],
            ),
            textField(
              maxLength: 3,
              type: TextInputType.number,
              formatter: [NumericalRangeFormatter(min: 0, max: 150)],
              hint: "Age",
              label: "Age",
              onChanged: (age) => _controller.age = int.tryParse(age) ?? 0,
            ),
            Text("Point: ${_controller.model.q3Point}"),
            const SizedBox(height: 15),
            testButton("Done", () {
              var result = _controller.calcq3();
              testMessage(result.title, () {
                if (result.id > 0) {
                  Get.back();
                  Get.toNamed("/test4");
                } else {
                  toMain();
                }
              });
            }),
          ],
        );
      }),
    );
  }
}
