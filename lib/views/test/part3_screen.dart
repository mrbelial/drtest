import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/models/question/question_model.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Part3Screen extends StatelessWidget {
  Part3Screen({super.key});
  final TestController _controller = Get.find();

  final TestPageModel model = Get.arguments;

  void itemClicked(TestPageModel item) async {
    switch (item.type) {
      case TestPageTypeEnum.drug:
      case TestPageTypeEnum.end:
      case TestPageTypeEnum.page:
        Get.toNamed("/part3", arguments: item, preventDuplicates: false);
        break;
      case TestPageTypeEnum.message:
        testMessage(
            item.title,
            () => Get.toNamed("/part3",
                arguments: item, preventDuplicates: false));
        break;
      case TestPageTypeEnum.toPage:
        var page = item.page;
        _controller.initDrugDosing();
        switch (item.page) {
          case "/f4Dosing":
          case "/fPPDosing":
          case "/activatedPCCDosing":
          case "/idarucizumabDosing":
          case "/andexanetAlfa":
            _controller.selectDrugDosing(item.id);
            page = "/drug_dosing";
            Get.toNamed(page, preventDuplicates: false);
          default:
            Get.toNamed(page, arguments: item, preventDuplicates: false);
        }
        break;
      case TestPageTypeEnum.result:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.value.replaceAll("\n", " ")),
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
          if (model.type == TestPageTypeEnum.end)
            testButton("Done", () {
              Get.offNamedUntil(
                  "/home", (route) => route.settings.name != '/part3');
            })
        ],
      ),
    );
  }
}
