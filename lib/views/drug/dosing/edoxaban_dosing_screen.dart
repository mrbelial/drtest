import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EdoxabanDosingScreen extends StatelessWidget {
  EdoxabanDosingScreen({super.key});
  final TestController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var dosing = _controller.edoxabanDosing();
    return Column(
      children: [
        Text(dosing),
        const SizedBox(height: 15),
        testButton("Ok", Get.back),
      ],
    );
  }
}
