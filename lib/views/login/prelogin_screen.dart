import 'package:drtest/tools/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreloginScreen extends StatelessWidget {
  const PreloginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppConst.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Prelogin Screen"),
            SizedBox(height: 20),
            appButton(
              onTap: () {
                Get.offAndToNamed("/login");
              },
              title: "Go to Login",
            ),
          ],
        ),
      ),
    );
  }
}
