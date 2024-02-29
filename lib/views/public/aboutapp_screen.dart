import 'package:flutter/material.dart';

import '../../tools/core.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("درباره تبدیل")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '''سامانه هوشمند صرافی تبدیل با هدف برطرف کردن نیاز صراف های ایرانی و تسهیل خرید و فروش ارز ساخته شده،\nجهت کسب اطلاعات بیشتر به وب سایت tabdil.com مراجعه نمایید.''',
              textAlign: TextAlign.justify,
              style: AppTextStyles.headline3,
            ),
          ],
        ),
      ),
    );
  }
}
