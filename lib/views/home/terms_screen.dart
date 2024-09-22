import 'package:drtest/controllers/main_controller.dart';
import 'package:drtest/tools/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsScreen extends StatelessWidget {
  TermsScreen({super.key});
  final MainController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms of use"),
      ),
      body: Obx(() {
        return ListView(
          padding: AppConst.defaultPadding,
          children: [
            Text(
              "Before using ACAFiB App please read and confirm the following:",
              style: AppTextStyles.text1.apply(color: AppColors.textColor1),
            ),
            Text(
              """

1-	ACAFiB App is a web-based clinical decision support system just for physicians, pharmacists, and health care professionals. Using ACAFiB App by patients or those not experts in the field is strictly not recommended.

2-	Each patient has a unique clinical scenario with various aspects that might not be covered in this system, hence clinical judgment is the cornerstone for clinical decisions rather than the recommendations by this App.

3-	All the information in this App originates from the latest version of recommendations by the latest valid and reliable clinical guidelines which are referenced after each recommendation. So, we do not take the responsibility for the accuracy of these recommendations.

4-	We suggest using ACAFiB App as an assistant to review the latest clinical recommendations and combine the information with clinical judgment before making clinical decisions.
""",
              style: AppTextStyles.text1.apply(color: AppColors.textColor2),
              textAlign: TextAlign.justify,
            ),
            checkBox(
                id: 0,
                title: "I have read and confirmed the above statements.",
                checked: _controller.termsChecked,
                onChange: (a, b) => _controller.termsChecked = b),
            appButton(
                title: "Continue",
                onTap: !_controller.termsChecked
                    ? null
                    : () async {
                        await _controller.prefs.setBool("termsChecked", true);
                        toMain();
                      }),
          ],
        );
      }),
    );
  }
}
