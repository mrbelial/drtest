import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';
import '../../tools/core.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final MainController _controller = Get.find();

  init() async {
    await Future.delayed(
      const Duration(seconds: 1),
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
      // backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Text(
              appName,
              style: AppTextStyles.headline1.apply(color: AppColors.white),
              textAlign: TextAlign.center,
            ),
            // Container(
            //     constraints: const BoxConstraints(maxHeight: 100),
            //     child: Image.asset(imagePath("logo.png"))),
            // Text(
            //   "خدمات مالی و فایننس",
            //   style: AppTextStyles.headline3.apply(color: AppColors.white),
            //   textAlign: TextAlign.center,
            // ),
            const Spacer(),
            Text(
              "تمامی حقوق برای $appName محفوظ است.© 1402",
              style: AppTextStyles.caption,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
