import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';
import '../../tools/core.dart';

class MoreScreen extends StatelessWidget {
  MoreScreen({super.key});
  final MainController _controller = Get.find();

  Widget _tile({
    required IconData icon,
    required String title,
    required void Function()? onTap,
    Widget? trailing,
  }) {
    trailing ??= const Icon(
      CupertinoIcons.chevron_back,
      color: AppColors.lightGray,
      size: 16,
    );
    return listTile(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      margin: const EdgeInsets.all(10),
      leading: Icon(
        icon,
        color: AppColors.lightGray,
        size: 25,
      ),
      title: title,
      textStyle: AppTextStyles.label,
      trailing: trailing,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Column(
          children: [
            _tile(
              icon: CupertinoIcons.exclamationmark_circle,
              title: "درباره $appName",
              onTap: () => Get.toNamed("/aboutus"),
            ),
            _tile(
              icon: CupertinoIcons.star_circle,
              title: "درباره تبدیل",
              onTap: () => Get.toNamed("/aboutapp"),
            ),
            _tile(
              icon: CupertinoIcons.person,
              title: "پروفایل",
              onTap: () => Get.toNamed("/profile"),
            ),
            // _tile(
            //   icon: FontAwesomeIcons.dollarSign,
            //   title: "خرید ارز",
            //   onTap: () => Get.toNamed("/currencySellHistoryScreen"),
            // ),
            _tile(
              icon: CupertinoIcons.collections,
              title: "نسخه برنامه",
              onTap: null,
              trailing: Text(_controller.appVersion),
            ),
            _tile(
              icon: CupertinoIcons.phone,
              title: "خروج از برنامه",
              onTap: () => Get.offAndToNamed("/login"),
            ),
          ],
        ),
      ],
    );
  }
}
