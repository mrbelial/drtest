import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WafarinExtraScreen extends StatelessWidget {
  WafarinExtraScreen({super.key});
  final TestController _controller = Get.find();

  void toDosingPage(int id) {
    _controller.closeDosing();

    _controller.selectDrugDosing(id);
    Get.toNamed("/drug_dosing");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        testButton("UFH dosing", () => toDosingPage(2)),
        testButton("LMWH dosing", () => toDosingPage(3)),
      ],
    );
  }
}
