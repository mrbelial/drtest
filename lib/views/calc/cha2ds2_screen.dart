import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CHA2DS2Screen extends StatelessWidget {
  CHA2DS2Screen({super.key});
  final TestController _controller = Get.find();
  final FocusNode _ageFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("CHA2DS2-VASc Calculator"),
          actions: [
            IconButton(
                onPressed: () =>
                    testMessage(_controller.model.q3Desc, Get.back),
                icon: const Icon(Icons.help_outline))
          ],
        ),
        body: ListView(
          padding: AppConst.defaultPadding,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: testTitle(_controller.model.q3Title),
            ),
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
              focusNode: _ageFocusNode,
              onChanged: (age) {
                _controller.age = int.tryParse(age) ?? 0;
                _controller.calcq3();
              },
            ),
            Obx(() {
              return testBadge(text: "Point: ${_controller.model.q3Point}");
            }),
            testButton("Done", () {
              if (_controller.age == 0) {
                ShowMSG.error("Error", "Please Enter Age.");
                _ageFocusNode.requestFocus();
                return;
              }
              var result = _controller.calcq3();
              testMessage(result.title, () {
                if (result.id > 0) {
                  Get.back();
                  Get.toNamed("/test3");
                } else {
                  toMain();
                }
              });
            }),
          ],
        ));
  }
}
