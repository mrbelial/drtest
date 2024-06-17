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

void testMessage(
  String message,
  void Function() ontap, {
  String title = "Message",
  String button2Title = "",
  void Function()? ontap2,
}) {
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
      actions: [
        textButton(title: "Ok", onTap: ontap),
        if (ontap2 != null) textButton(title: button2Title, onTap: ontap2)
      ]);
}

void testdrugMessage(
  List<Widget> messages,
  void Function() ontap, {
  String title = "Message",
  String button2Title = "",
  void Function()? ontap2,
}) {
  Get.defaultDialog(
      title: title,
      content: SizedBox(
        width: Get.size.width - 50,
        height: Get.size.height - 150,
        child: ListView(
          shrinkWrap: true,
          children: messages,
        ),
      ),
      actions: [
        textButton(title: "Ok", onTap: ontap),
        if (ontap2 != null) textButton(title: button2Title, onTap: ontap2)
      ]);
}

Widget testDrug(TestDrugModel item) {
  return listTile(
      title: item.name,
      margin: const EdgeInsets.symmetric(vertical: 10),
      onTap: () => Get.toNamed("/drug_dosing", arguments: item));
}

Widget testBadge({required String text, Color color = AppColors.red}) {
  return Container(
    padding: const EdgeInsets.all(10),
    color: color,
    child: Text(
      text,
      style: AppTextStyles.headline3,
    ),
  );
}
