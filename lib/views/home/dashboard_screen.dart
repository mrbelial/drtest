import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/models/question/part3_data.dart';
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
        appBar: AppBar(title: const Text("ACAFib-APP")),
        body: ListView(
          padding: AppConst.defaultPadding,
          children: [
            Text(
                "Anticoagulant in Atrial Fibrillation Application (ACAFib-APP)",
                textAlign: TextAlign.center,
                style: AppTextStyles.headline3),
            const SizedBox(height: 15),
            appButton(
              title: "About Us",
              onTap: () => Get.toNamed("/aboutus"),
            ),
            appButton(
              title: "Contact Us",
              onTap: () => Get.toNamed("/contactus"),
            ),
            appButton(
              title: "Abbreviations",
              onTap: () => Get.toNamed("/abbreviations"),
            ),
            appButton(
              title: "Part 3",
              onTap: () => Get.toNamed("/part3",
                  arguments: part3Data(_testController.model)),
            ),
            appButton(
              title: "Start",
              onTap: () => Get.toNamed("/test"),
            ),
            // appButton(
            //   title: "Part 8",
            //   onTap: () {
            //     _testController.initDrugDosing();
            //     _testController.selectDrugDosing(5);
            //     Get.toNamed("/drug_dosing");
            //   },
            // ),
            appButton(
              title: "Part 3",
              onTap: () => Get.toNamed("/part3",
                  arguments: part3Data(_testController.model)),
            ),
          ],
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
