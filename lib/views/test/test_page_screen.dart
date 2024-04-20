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

  Future<bool> itemClicked(TestPageModel item) async {
    print(item.type);
    switch (item.type) {
      case TestPageTypeEnum.drug:
        _controller.addToDrugs(item);
        _controller.selectedStackIndex += 1;
        //await Get.toNamed("/drugs", arguments: item.drugs);

        await Get.toNamed("/test_page", arguments: _controller.selectedStack);
        _controller.selectedStackIndex -= 1;

        return true;
      case TestPageTypeEnum.link:
        launchURL(item.title);
        return false;
      case TestPageTypeEnum.message:
        testMessage(item.title, toMain);
        return false;
      case TestPageTypeEnum.page:
        print("${item.value}: ${item.type.toString()}");
        await Get.toNamed("/test_page",
            arguments: item, preventDuplicates: false);
        return false;
      case TestPageTypeEnum.toPage:
        await Get.toNamed(item.page, arguments: item);
        return true;
      default:
        return false;
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
                return testButton(
                  item.value,
                  () async {
                    var isDrug = await itemClicked(item);
                    print(isDrug);

                    if (isDrug) {
                      _controller.removeFromDrugs(item);
                    }
                  },
                );
              }),
        ],
      ),
    );
  }
}
