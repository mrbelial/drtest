import 'package:drtest/tools/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final TextEditingController x = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            Text("Initiate Evaluation Here...",
                textAlign: TextAlign.center, style: AppTextStyles.text1),
            const SizedBox(height: 15),
            appButton(
              title: "Start",
              onTap: () => Get.toNamed("/test"),
            ),
            appButton(title: "Intro", onTap: () => Get.toNamed("/intro")),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
