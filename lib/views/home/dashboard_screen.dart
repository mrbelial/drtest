import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/tools/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  final _testController = Get.put(TestController());

  @override
  Widget build(BuildContext context) {
    _testController.initDrugDosing();
    return Scaffold(
        appBar: AppBar(title: const Text("ACAFiB APP")),
        body: Padding(
          padding: AppConst.defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Image.asset(
                  imagePath("tf.png"),
                  height: 150,
                ),
              ),
              const SizedBox(height: 15),
              Text("Begin Diagnostic Assessment Here",
                  textAlign: TextAlign.center, style: AppTextStyles.text1),
              const SizedBox(height: 15),
              // appButton(
              //   title: "Part 3",
              //   onTap: () => Get.toNamed("/part3",
              //       arguments: part3Data(_testController.model)),
              // ),
              appButton(
                title: "Start",
                onTap: () => Get.toNamed("/test"),
              ),
              // appButton(
              //     title: "title",
              //     onTap: () => Get.toNamed("/drug_interaction_description")),
              const SizedBox(height: 100),
              // appButton(
              //   title: "Part 8",
              //   onTap: () {
              //     _testController.initDrugDosing();
              //     _testController.selectDrugDosing(5);
              //     Get.toNamed("/drug_dosing");
              //   },
              // ),
              // appButton(
              //   title: "Part 3",
              //   onTap: () => Get.toNamed("/part3",
              //       arguments: part3Data(_testController.model)),
              // ),
            ],
          ),
        )
        //  ListView.builder(
        //     itemCount: _testController.model.drugs.length,
        //     itemBuilder: (c, i) {
        //       var item = _testController.model.drugs[i];
        //       return listTile(
        //         title: item.name,
        //         onTap: () {
        //           _testController.age = 35;
        //           _testController.weight = 90;
        //           _testController.initDrugDosing();
        //           _testController.selectDrugDosing(item.id);
        //           Get.toNamed("/drug_dosing");
        //         },
        //       );
        //     }),
        );
  }
}
