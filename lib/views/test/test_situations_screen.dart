import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/models/question/question_model.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestSituationsScreen extends StatelessWidget {
  TestSituationsScreen({super.key});
  final TestController _controller = Get.find();
  TestPageModel get model => _controller.model.pages;

  @override
  Widget build(BuildContext context) {
    _controller.initStack();
    return Scaffold(
      appBar: AppBar(
        title: Text(model.value),
        actions: [
          Obx(() {
            if (_controller.stackCount > 0) {
              return textButton(
                  title: "Next",
                  onTap: () {
                    _controller.fillStack();
                    
                    if (_controller.stacks.isEmpty) {
                      ShowMSG.error("Error", "Select Situations");
                      return;
                    }

                    Get.toNamed("/test_page",
                        arguments: _controller.stacks.first);
                  });
            }
            return Container();
          })
        ],
      ),
      body: ListView(
        padding: AppConst.defaultPadding,
        children: [
          if (model.title.isNotEmpty) testTitle(model.title),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: model.pages.length,
              itemBuilder: (c, i) {
                return Obx(() {
                  var item = model.pages[i];
                  return checkBox(
                    id: 0,
                    title: item.value,
                    checked: item.isMarked,
                    //_controller.isItemStacked(item)
                    onChange: (i, b) {
                      item.isMarked = b;
                      _controller.isloading = false;
                      // _controller.removeFromStack(tempResult);
                      // if (b) {
                      //   _controller.addToStack(item);
                      // } else {
                      //   _controller.removeFromStack(item);
                      // }
                    },
                  );
                });
              }),
        ],
      ),
    );
  }
}
