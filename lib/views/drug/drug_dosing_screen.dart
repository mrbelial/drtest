import 'package:drtest/controllers/drug_dosing_controller.dart';
import 'package:drtest/models/question/question_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrugDosingScreen extends StatelessWidget {
  DrugDosingScreen({super.key});
  final _controller = Get.put(DurgDosingController());
  final TestDrugModel item = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
    );
  }
}
