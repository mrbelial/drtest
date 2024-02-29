import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';
import '../../tools/core.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({super.key});
  final MainController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _controller.mainResponse.content?.aboutus ?? "",
              textAlign: TextAlign.center,
              style: AppTextStyles.headline3,
            ),
          ],
        ),
      ),
    );
  }
}
