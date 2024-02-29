import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';
import '../../tools/core.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final MainController _controller = Get.find();

  Widget _fieldBox(String label, String value,
      [bool isLTR = false, String extra = ""]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.label),
        const SizedBox(height: 7),
        isLTR
            ? Row(
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(value, style: AppTextStyles.headline5),
                  ),
                  Text(extra, style: AppTextStyles.headline5)
                ],
              )
            : Text(value, style: AppTextStyles.headline5),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("پروفایل"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shrinkWrap: true,
        children: [
          cardBox(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons/profile.png",
                        height: 50,
                      ),
                      const SizedBox(width: 20),
                      _fieldBox("نام کاربر", _controller.user.name),
                    ],
                  ),
                ),
                const Divider(color: AppColors.gray),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
