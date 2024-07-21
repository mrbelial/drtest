import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';
import '../../tools/core.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final MainController _controller = Get.find();

  init() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        _controller.updateToken("ss");
        toMain();
      },
    );
    return;
    // var response = await _controller.getSplash();
    // if ((response.statusCode == 401 || response.isSuccess)) {
    //   toMain();
    // } else {
    //   ShowMSG.errorWithButton(
    //       msg: response.message,
    //       onClose: init,
    //       title: "بروز خطا",
    //       btn:
    //           IconButton(onPressed: Get.back, icon: const Icon(Icons.refresh)));
    // }

    // await Future.delayed(const Duration(seconds: 3));
    // toMain();
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Image.asset(imagePath("logo.png"), height: 150),
            Text(
              appName,
              style: AppTextStyles.title1,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Text(
              "© 2024, Tehran University of Medical Science",
              style: AppTextStyles.title4,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
