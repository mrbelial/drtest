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
      body: ListView(
        padding: AppConst.defaultPadding,
        children: const [
          Center(
            child: Text(
              """Contact us:\nEmail: acafibapp@gmail.com\nTelegram: @Acafibapp""",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
