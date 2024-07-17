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
            imagePath("TUMS_v02.png"),
            height: 250,
          ),
          const SizedBox(height: 20),
          Text(
            """Welcome to ACAFiB-APP (Anticoagulant in Atrial Fibrillation Application), a clinical decision support system for the selection of chronic anticoagulant drug in patients with atrial fibrillation (AF). Proudly we developed this App with the support of the Tehran University of Medical Sciences (TUMS). ACAFiB-APP is designed to assist healthcare professionals in making clinical decisions regarding anticoagulant therapy for AF and related considerations. With a user-friendly interface and evidence-based recommendations from the latest clinical guidelines, we aim to enhance patient care and streamline clinical workflows.""",
            style: AppTextStyles.text2,
          ),
          const SizedBox(height: 20),
          Image.asset(
            imagePath("Research_Center_v02.png"),
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
