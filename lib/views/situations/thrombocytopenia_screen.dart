
import 'package:drtest/controllers/test_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThrombocytopeniaScreen extends StatelessWidget {
  ThrombocytopeniaScreen({super.key});
  final TestController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thrombocytopenia"),
      ),
    );
  }
}
