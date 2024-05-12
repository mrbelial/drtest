// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../controllers/login_controller.dart';
// import '../../tools/core.dart';

// class LoginScreen extends StatelessWidget {
//   LoginScreen({super.key});
//   final _controller = Get.put(LoginController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//         child: Column(
//           children: [
//             Expanded(
//                 child: ListView(
//               children: [
//                 const SizedBox(height: 50),
//                 Text(
//                   "ورود به $appName",
//                   style: AppTextStyles.headline1,
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   "نام کاربری و رمز عبور را وارد کنید",
//                   style: AppTextStyles.bodyText1,
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 50),
//                 textField(
//                   onChanged: (x) => _controller.username = x,
//                   maxLength: 50,
//                   hint: "نام کاربری",
//                   label: "نام کاربری",
//                   textDirection: TextDirection.ltr,
//                 ),
//                 textField(
//                   onChanged: (x) => _controller.password = x,
//                   maxLength: 50,
//                   hint: "رمز عبور",
//                   label: "رمز عبور",
//                   pass: true,
//                   textDirection: TextDirection.ltr,
//                 ),
//               ],
//             )),
//             Obx(() {
//               if (_controller.isloading) return appButtonLoading();
//               return appButton(
//                 title: "ورود",
//                 onTap: () async {
//                   if (_controller.username.length < 2) {
//                     ShowMSG.error("خطا", "نام کاربری را صحیح وارد کنید");
//                     return;
//                   }
//                   if (_controller.password.length < 2) {
//                     ShowMSG.error("خطا", "رمز عبور را صحیح وارد کنید");
//                     return;
//                   }
//                   var response = await _controller.authenticate();
//                   if (response.isSuccess) {
//                     toMain();
//                     ShowMSG.info("موفق", response.message);
//                   } else {
//                     ShowMSG.error("خطا", response.message);
//                   }
//                 },
//                 margin: const EdgeInsets.symmetric(vertical: 15),
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }
