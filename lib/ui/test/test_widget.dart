import 'package:drtest/models/question/question_model.dart';
import 'package:drtest/tools/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget testTitle(String title) {
  return Container(padding: AppConst.widgetPadding, child: Text(title));
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
}

void testMessage(String message, void Function() ontap,
    [String title = "Message"]) {
  Get.defaultDialog(
      title: title,
      middleText: message,
      actions: [textButton(title: "Ok", onTap: ontap)]);
}

Widget testDrug(TestDrugModel item) {
  return listTile(
      title: item.name, margin: const EdgeInsets.symmetric(vertical: 10));
}