import 'package:drtest/tools/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget testTitle(String title) {
  return Container(padding: AppConst.defaultPadding, child: Text(title));
}

Widget testButton(String title, void Function() onTap,
    [Alignment textAlign = Alignment.center]) {
  return Container(
    padding: const EdgeInsets.only(bottom: 10),
    child: MaterialButton(
      color: AppColors.primary,
      onPressed: onTap,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Container(
        alignment: textAlign,
        child: Text(
          title,
          style: AppTextStyles.bodyText1.apply(color: AppColors.white),
        ),
      ),
    ),
  );
  // return appButton(
  //     title: title, onTap: onTap, margin: const EdgeInsets.only(bottom: 10));
}

void testMessage(String title, String message, void Function() ontap) {
  Get.defaultDialog(
      title: title,
      middleText: message,
      actions: [textButton(title: "Ok", onTap: ontap)]);
}
