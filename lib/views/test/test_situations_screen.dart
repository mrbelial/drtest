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
    // _controller.isloading = true;
    _controller.initStack();
    // _controller.updateTestModel();
    return Scaffold(
      appBar: AppBar(
        title: Text(model.value),
        actions: [
          Obx(() {
            if (_controller.isloading) {
              return Container();
            }
            // if (_controller.stackCount > 0) {
            return textButton(
                title: "Next",
                onTap: () {
                  _controller.fillStack();

                  if (_controller.stacks.isEmpty) {
                    _controller.stacks.add(TestPageModel(
                        title: "",
                        value: "",
                        type: TestPageTypeEnum.drug,
                        drugs: [
                          TestDrugPageModel("", [1, 2, 3, 4, 5, 6, 7]),
                        ]));

                    _controller.model.testFilteredDrug.drugs =
                        _controller.model.drugs;
                    Get.toNamed("/drugs");
                    return;
                  }

                  Get.toNamed("/test_page",
                      arguments: _controller.stacks.first);
                });
            // }
            // return Container();
          })
        ],
      ),
      body: Obx(() {
        if (_controller.isloading) {
          return Container();
        }
        return ListView(
          padding: AppConst.defaultPadding,
          children: [
            if (model.title.isNotEmpty) testTitle(model.title),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: model.pages.length,
                itemBuilder: (c, i) {
                  var item = model.pages[i];
                  return Row(
                    children: [
                      Expanded(
                        child: checkBox(
                          id: 0,
                          title: item.value,
                          checked: item.isMarked,
                          onChange: (i, b) {
                            item.isMarked = b;
                            _controller.isloading = false;
                          },
                        ),
                      ),
                      if (item.helpDesc != null)
                        IconButton(
                          onPressed: () =>
                              testMessage(item.helpDesc!, Get.back),
                          icon: const Icon(
                            Icons.help,
                            color: AppColors.green,
                          ),
                        )
                    ],
                  );
                }),
          ],
        );
      }),
    );
  }
}
