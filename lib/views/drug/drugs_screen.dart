import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/models/question/question_model.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrugsScreen extends StatelessWidget {
  DrugsScreen({super.key});
  final TestController _controller = Get.find();
   List<TestDrugPageModel> get drugs => _controller.selectedDrugs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drugs"),
      ),
      body: ListView.builder(
        padding: AppConst.defaultPadding,
        itemCount: drugs.length,
        itemBuilder: (context, index) {
          var item = drugs[index];
          item.drugs = _controller.getDrugsByIDs(item.drugIds);
          return Column(
            children: [
              testTitle(item.title),
              ...item.drugs.map((e) => testDrug(e)),
            ],
          );
        },
      ),
    );
  }
}
