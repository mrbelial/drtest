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
      body: const Padding(
        padding: AppConst.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(""),
            SizedBox(height: 20),
            Text(
              """Contact us:\nEmail: acafibapp@gmail.com\nTelegram: @Acafibapp""",
            ),
          ],
        ),
      ),
    );
  }
}
