import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/models/dosing/edoxaban_dosing_model.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EdoxabanDosingScreen extends StatelessWidget {
  EdoxabanDosingScreen({super.key});
  final TestController _controller = Get.find();

  EdoxabanDosingModel get model => _controller.edoxabanDosingModel;

  @override
  Widget build(BuildContext context) {
    _controller.edoxabanDosingInit();
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
                    id: 0,
                    title: item.title,
                    checked: item.checked,
                    onChange: (i, b) {
                      item.checked = b;
                      _controller.edoxabanLoading = false;
                    },
                  );
                });
              }),
          testBadge(text: _controller.edoxabanDosing()),
          const SizedBox(height: 15),
          testButton("Ok", Get.back),
        ],
      );
    });
  }
}
