import 'package:drtest/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  final MainController _controller = Get.find();

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
      body: ListView(),
    );
  }
}
