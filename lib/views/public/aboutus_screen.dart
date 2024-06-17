import 'package:flutter/material.dart';
import '../../tools/core.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

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
            Image.asset(
              imagePath("dn.png"),
              height: 150,
            ),
            Image.asset(
              imagePath("dn2.png"),
              height: 150,
            ),
            // Text(
            //   """""",
            //   textAlign: TextAlign.center,
            //   style: AppTextStyles.headline3,
            // ),
          ],
        ),
      ),
    );
  }
}
