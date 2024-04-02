import 'package:drtest/tools/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EndTestScreen extends StatelessWidget {
  EndTestScreen({super.key});
  final String arg = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test End"),
      ),
      body: Padding(
        padding: AppConst.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(arg),
            const SizedBox(height: 15),
            appButton(title: "Back", onTap: toMain),
          ],
        ),
      ),
    );
  }
}
