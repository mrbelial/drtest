import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/models/public/idtitle_model.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test2Screen extends StatelessWidget {
  Test2Screen({super.key});
  final TestController _controller = Get.find();

  void answer(IDTitleModel item) {
    _controller.qa2 = item.id;
    if (item.id == 9) {
      Get.toNamed("/cha2ds2");
    } else {
      testMessage("Consider Anticoagulation", () {
        Get.back();
        Get.toNamed("/test3");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Evaluate Indications"),
      ),
      body: ListView(
        padding: AppConst.defaultPadding,
        children: [
          testTitle(_controller.model.q2Title),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _controller.model.qa2.length,
              itemBuilder: (c, i) {
                var item = _controller.model.qa2[i];
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: testButton(
                        item.title,
                        () => answer(item),
                        textAlign: Alignment.centerLeft,
                        color: item.id == 9 ? AppColors.red : AppColors.primary,
                      ),
                    ),
                    if (item.desc.isNotEmpty) ...[
                      const SizedBox(width: 10),
                      IconButton(
                        icon: const Icon(Icons.question_mark_rounded),
                        style: IconButton.styleFrom(
                            backgroundColor: AppColors.primary),
                        onPressed: () => testMessage(item.desc, Get.back),
                      ),
                    ]
                  ],
                );
              }),
        ],
      ),
    );
  }
}
