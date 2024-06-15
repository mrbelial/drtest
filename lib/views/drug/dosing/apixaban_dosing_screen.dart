import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/models/dosing/apixaban_dosing_model.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApixabanDosingScreen extends StatelessWidget {
  ApixabanDosingScreen({super.key});
  final TestController _controller = Get.find();

  ApixabanDosingModel get model => _controller.apixabanDosingModel;

  @override
  Widget build(BuildContext context) {
    _controller.apixabanDosingInit();
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          testTitle("Any of the following present?"),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: model.list.length,
              itemBuilder: (c, i) {
                return Obx(() {
                  var item = model.list[i];
                  return checkBox(
                    id: item.id,
                    title: item.title,
                    checked: item.checked,
                    onChange: (i, b) {
                      item.checked = b;
                      _controller.apixabanLoading = false;
                    },
                  );
                });
              }),
          testBadge(text: _controller.apixabanDosing()),
          const SizedBox(height: 15),
          testButton("Ok", Get.back),
        ],
      );
    });
  }
}
