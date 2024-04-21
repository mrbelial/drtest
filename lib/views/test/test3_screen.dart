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
            testTitle(_controller.model.q3Title),
            Obx(() {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _controller.model.q3Answer.length,
                  itemBuilder: (c, i) {
                    var item = _controller.model.q3Answer[i];
                    return checkBox(
                      id: 0,
                      title: "${item.title} (${item.point})",
                      checked: item.checked,
                      onChange: (_, b) {
                        _controller.q3Answer(i, b);
                        _controller.calcq3();
                      },
                    );
                  });
            }),
            Obx(() {
              return Row(
                children: [
                  Expanded(
                    child: radioButton(
                        title: "Male (0)",
                        value: _controller.isFemale ? 0 : 1,
                        groupValue: 1,
                        onChanged: (i) {
                          _controller.isFemale = false;
                          _controller.calcq3();
                        }),
                  ),
                  Expanded(
                    child: radioButton(
                        title: "Female (1)",
                        value: _controller.isFemale ? 1 : 0,
                        groupValue: 1,
                        onChanged: (i) {
                          _controller.isFemale = true;
                          _controller.calcq3();
                        }),
                  ),
                ],
              );
            }),
            textField(
              maxLength: 3,
              type: TextInputType.number,
              formatter: [NumericalRangeFormatter(min: 0, max: 150)],
              hint: "Age",
              label: "Age (>64 : 1) (>74 : 2)",
              onChanged: (age) {
                _controller.age = int.tryParse(age) ?? 0;
                _controller.calcq3();
              },
            ),
            Obx(() {
              return Text("Point: ${_controller.model.q3Point}");
            }),
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
        ));
  }
}
