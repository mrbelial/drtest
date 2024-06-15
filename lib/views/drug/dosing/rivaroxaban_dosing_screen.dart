import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/models/dosing/rivaroxaban_dosing_model.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RivaroxabanDosingScreen extends StatelessWidget {
  RivaroxabanDosingScreen({super.key});

  final TestController _controller = Get.find();

  RivaroxabanDosingModel get model => _controller.rivaroxabanDosingModel;

  @override
  Widget build(BuildContext context) {
    _controller.rivaroxabanDosingInit();
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
                      _controller.rivaroxabanLoading = false;
                    },
                  );
                });
              }),
          testBadge(text: _controller.rivaroxabanDosing()),
          const SizedBox(height: 15),
          testButton("Ok", Get.back),
        ],
      );
    });
  }
}
