import 'package:drtest/tools/core.dart';
import 'package:flutter/material.dart';

class ContactusScreen extends StatelessWidget {
  const ContactusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Us"),
      ),
      body: Padding(
        padding: AppConst.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Text(
              "We value your feedback and inquiries. If you have any questions, suggestions, or need assistance with ACAFib-APP, please do not hesitate to reach out to us.",
              style: AppTextStyles.text2,
            ),
            const SizedBox(height: 20),
            Text(
              """You can contact our support team at:""",
              style: AppTextStyles.text3,
            ),
            Row(
              children: [
                Text(
                  "Email: ",
                  style: AppTextStyles.text3,
                ),
                textButton(
                    title: "acafibapp@gmail.com",
                    onTap: () => launchURL("mailto:acafibapp@gmail.com")),
              ],
            ),
            Row(
              children: [
                Text(
                  "Telegram: ",
                  style: AppTextStyles.text3,
                ),
                textButton(
                    title: "@Acafibapp",
                    onTap: () => launchURL("https://t.me/Acafibapp")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
