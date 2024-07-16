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
        title: const Text("Terms"),
      ),
      body: Obx(() {
        return ListView(
          padding: AppConst.defaultPadding,
          children: [
            const Text("""Terms of use
Before using ACAFIB-App please read and confirm the following:
1-	ACAFIB-App is a web-based clinical decision support system just for physicians, pharmacists, and health care professionals. Using ACAFIB-App by patients or those not experts in the field is strictly not recommended.
2-	 Each patient has a unique clinical scenario with various aspects that might not be covered in this system, hence clinical judgment is the cornerstone for clinical decisions rather than the recommendations by this App.
3-	All the information in this App originates from the latest version of recommendations by the latest valid and reliable clinical guidelines which are referenced after each recommendation. So, we do not take the responsibility for the accuracy of these recommendations.
4-	We suggest using ACAFIB-App as an assistant to review the latest clinical recommendations and combine the information with clinical judgment before making clinical decisions.
"""),
            checkBox(
                id: 0,
                title: "I have read and confirmed the above statements.",
                checked: _controller.termsChecked,
                onChange: (a, b) {
                  print(b);
                  _controller.termsChecked = b;
                  print(_controller.termsChecked);
                }),
            appButton(
                title: "Start",
                onTap: !_controller.termsChecked
                    ? null
                    : () {
                        _controller.prefs.setBool(
                            "termsChecked", _controller.termsChecked);
                        Get.toNamed("/home");
                      }),
          ],
        );
      }),
    );
  }
}