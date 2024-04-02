import 'package:drtest/models/question/question_model.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestPageScreen extends StatelessWidget {
  TestPageScreen({super.key});
  // final TestController _controller = Get.find();
  final TestPageModel model = Get.arguments;

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
                  () {
                    switch (item.type) {
                      case TestPageTyoeEnum.drug:
                        Get.toNamed("/drugs", arguments: item.drugs);
                        break;
                      case TestPageTyoeEnum.link:
                        launchURL(item.title);
                        break;
                      case TestPageTyoeEnum.message:
                        testMessage(item.title, toMain);
                        break;
                      case TestPageTyoeEnum.page:
                        print("${item.value}: ${item.type.toString()}");
                        Get.toNamed("test_page",
                            arguments: item, preventDuplicates: false);
                        break;
                      case TestPageTyoeEnum.toPage:
                        Get.toNamed(item.page, arguments: item);
                        break;
                      default:
                        break;
                    }
                  },
                );
              }),
        ],
      ),
    );
  }
}
