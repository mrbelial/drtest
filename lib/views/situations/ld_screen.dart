import 'package:drtest/controllers/test_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LDScreen extends StatelessWidget {
  LDScreen({super.key});
  final TestController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liver disease"),
      ),
    );
  }
}