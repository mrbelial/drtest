import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/login_controller.dart';
import '../../tools/core.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                const SizedBox(height: 50),
                Text(
                  "Login To $appName",
                  style: AppTextStyles.title1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  "Please Enter Username And Password",
                  style: AppTextStyles.text1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                textField(
                  onChanged: (x) => _controller.username = x,
                  maxLength: 50,
                  hint: "Username",
                  label: "Username",
                  textDirection: TextDirection.ltr,
                ),
                textField(
                  onChanged: (x) => _controller.password = x,
                  maxLength: 50,
                  hint: "Password",
                  label: "Password",
                  pass: true,
                  textDirection: TextDirection.ltr,
                ),
              ],
            )),
            Obx(() {
              if (_controller.isloading) return appButtonLoading();
              return appButton(
                title: "Login",
                onTap: () async {
                  if (_controller.username.length < 2) {
                    ShowMSG.error("Error", "Enter Username");
                    return;
                  }
                  if (_controller.password.length < 2) {
                    ShowMSG.error("Error", "Enter Password");
                    return;
                  }
                  var response = await _controller.authenticate();
                  if (response.isSuccess) {
                    toMain();
                    ShowMSG.info("Success", response.message);
                  } else {
                    ShowMSG.error("Error", response.message);
                  }
                },
                margin: const EdgeInsets.symmetric(vertical: 15),
              );
            }),
          ],
        ),
      ),
    );
  }
}
