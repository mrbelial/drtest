import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/models/question/question_model.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestPageScreen extends StatelessWidget {
  TestPageScreen({super.key});
  final TestController _controller = Get.find();
  final TestPageModel model = Get.arguments;

  void itemClicked(TestPageModel item) async {
    switch (item.type) {
      case TestPageTypeEnum.drug:
        _controller.addToDrugs(item, _controller.selectedStack.value);
        _controller.selectedStackIndex += 1;
        itemClicked(_controller.selectedStack);

        //await Get.toNamed("/drugs", arguments: item.drugs);
        // await Get.offAndToNamed("/test_page",
        //     arguments: _controller.selectedStack);
        // _controller.selectedStackIndex -= 1;

        break;
      // case TestPageTypeEnum.link:
      //   launchURL(item.title);
      //   break;
      case TestPageTypeEnum.message:
        testMessage(item.title, () {});
        _controller.selectedStackIndex += 1;
        itemClicked(_controller.selectedStack);
        break;
      case TestPageTypeEnum.page:
        // print("${item.value}: ${item.type.toString()}");
        await Get.offAndToNamed("/test_page", arguments: item);
        break;
      case TestPageTypeEnum.result:
        await Get.offAndToNamed("/drugs");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.value),
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
                var item = model.pages[i];
                return testButton(item.value, () => itemClicked(item),
                    color:
                        item.isMarked ? AppColors.primary : AppColors.darkGray);
              }),
        ],
      ),
    );
  }
}
