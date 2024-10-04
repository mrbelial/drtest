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
                if (item.id == 9) {
                  return testListTile(
                    ontap: () => answer(item),
                    title: item.title,
                    bgColor: AppColors.yellowBackground,
                    textColor: AppColors.warning,
                    trailing: const Icon(Icons.arrow_forward_ios,
                        color: AppColors.warning),
                  );
                }
                return testListTile(
                    ontap: () => answer(item),
                    title: item.title,
                    bgColor: item.id == _controller.model.q2Answer
                        ? AppColors.green
                        : AppColors.buttonBackground2,
                    trailing: IconButton(
                        onPressed: () => testMessage(item.desc, Get.back),
                        icon: const Icon(
                          Icons.help_outline,
                          color: AppColors.green,
                          size: 35,
                        )));
                // return Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Expanded(
                //       flex: 3,
                //       child: testButton(
                //         item.title,
                //         () => answer(item),
                //         textAlign: TextAlign.left,
                //         color: AppColors.primary,
                //       ),
                //     ),
                //     if (item.desc.isNotEmpty) ...[
                //       const SizedBox(width: 10),
                //       IconButton(
                //         icon: const Icon(Icons.help_outline),
                //         iconSize: 50,
                //         color: AppColors.primary,
                //         onPressed: () => testMessage(item.desc, Get.back),
                //       ),
                //     ]
                //   ],
                // );
              }),
        ],
      ),
    );
  }
}
