import 'package:flutter/material.dart';
import '../../tools/core.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        children: [
          const SizedBox(height: 50),
          Image.asset(
            imagePath("tums.png"),
            height: 250,
          ),
          const SizedBox(height: 20),
          Text(
            "",
            style: AppTextStyles.text2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Image.asset(
            imagePath("research_center.png"),
            height: 250,
          ),
          // Text(
          //   """""",
          //   textAlign: TextAlign.center,
          //   style: AppTextStyles.headline3,
          // ),
        ],
      ),
    );
  }
}
