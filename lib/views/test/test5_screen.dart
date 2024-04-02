import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test5Screen extends StatelessWidget {
  Test5Screen({super.key});
  final TestController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Step 4"),
      ),
      body: ListView(
        padding: AppConst.defaultPadding,
        children: [
          // testTitle(_controller.model.q5Title),
          // ListView.builder(
          //     shrinkWrap: true,
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemCount: _controller.model.q5List.length,
          //     itemBuilder: (c, i) {
          //       var item = _controller.model.q5List[i];
          //       return testButton(
          //         item.title,
          //         () {
          //           if (item.ispage) {
          //             Get.toNamed(item.value, arguments: item);
          //           } else {
          //             testMessage(item.value, () {
          //               Get.back();
          //               Get.toNamed("/drugs",
          //                   arguments: _controller.getDrugsByIDs(item.drugs));
          //             });
          //           }
          //         },
          //       );
          //     }),
        ],
      ),
    );
  }
}
