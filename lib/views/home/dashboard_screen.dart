import 'package:drtest/controllers/main_controller.dart';
import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/tools/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  // ignore: unused_field
  final MainController _controller = Get.find();
  final _testController = Get.put(TestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("داشبورد"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/test");
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: _testController.model.drugs.length,
          itemBuilder: (c, i) {
            var item = _testController.model.drugs[i];
            return listTile(
              title: item.name,
              onTap: () {
                _testController.age = 35;
                _testController.weight = 90;
                _testController.initDrugDosing();
                _testController.selectDrugDosing(item.id);
                Get.toNamed("/drug_dosing");
              },
            );
          }),
    );
  }
}
