import 'package:drtest/models/question/question_model.dart';
import 'package:drtest/tools/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget testTitle(String title) {
  return Container(
      padding: AppConst.widgetPadding,
      child: Text(title, textAlign: TextAlign.left));
}

Widget testButton(String title, void Function() onTap,
    {Alignment textAlign = Alignment.center, Color color = AppColors.primary}) {
  return Container(
    padding: const EdgeInsets.only(bottom: 10),
    child: MaterialButton(
      color: color,
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
      content: SizedBox(
        width: Get.size.width - 50,
        height: Get.size.height - 150,
        child: ListView(
          shrinkWrap: true,
          children: [Text(message, textAlign: TextAlign.left)],
        ),
      ),
      actions: [textButton(title: "Ok", onTap: ontap)]);
}

Widget testDrug(TestDrugModel item) {
  return listTile(
      title: item.name,
      margin: const EdgeInsets.symmetric(vertical: 10),
      onTap: () => Get.toNamed("/drug_dosing", arguments: item));
}
