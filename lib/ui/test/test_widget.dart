import 'package:drtest/models/question/question_model.dart';
import 'package:drtest/tools/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget testTitle(String title) {
  return Container(
      padding: AppConst.widgetPadding,
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: AppTextStyles.text1,
      ));
}

Widget testButton(String title, void Function() onTap,
    {TextAlign textAlign = TextAlign.center,
    Color color = AppColors.primary,
    Color? textColor}) {
  return appButton(
    title: title,
    onTap: onTap,
    color: color,
    textAlign: textAlign,
    textColor: textColor,
  );
}

Widget testListTile({
  required void Function()? ontap,
  Color bgColor = AppColors.buttonBackground2,
  required String title,
  Color textColor = AppColors.textColor2,
  Widget? trailing,
}) {
  return Container(
    color: bgColor,
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: MaterialButton(
      onPressed: ontap,
      child: Padding(
        padding: AppConst.buttonPadding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Text(
              title,
              style: AppTextStyles.text2.apply(color: textColor),
            )),
            const SizedBox(width: 10),
            trailing ?? Container()
          ],
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
  String icon = "info.png",
}) {
  Get.bottomSheet(
    isScrollControlled: true,
    BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Container(
          padding: AppConst.defaultPadding,
          height: MediaQuery.of(context).size.height * .8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: Get.back,
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.textColor2,
                    )),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Image.asset(iconPath(icon), height: 200),
                    Text(
                      title,
                      style: AppTextStyles.text1,
                      textAlign: TextAlign.center,
                    ),
                    Text(message,
                        style: AppTextStyles.text2, textAlign: TextAlign.left),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              appButton(title: "Ok", onTap: ontap),
              if (ontap2 != null) appButton(title: button2Title, onTap: ontap2),
            ],
          ),
        );
      },
    ),
  );
  // return;
  // Get.defaultDialog(
  //     title: title,
  //     content: SizedBox(
  //       width: Get.size.width - 50,
  //       height: Get.size.height - 200,
  //       child: ListView(
  //         shrinkWrap: true,
  //         children: [Text(message, textAlign: TextAlign.left)],
  //       ),
  //     ),
  //     actions: [
  //       textButton(title: "Ok", onTap: ontap),
  //       if (ontap2 != null) textButton(title: button2Title, onTap: ontap2)
  //     ]);
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

Widget testBadge(
    {required String text,
    Color color = AppColors.warning,
    Color bgColor = AppColors.yellowBackground}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    margin: const EdgeInsets.symmetric(vertical: 10),
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(15), color: bgColor),
    child: Text(
      text,
      style: AppTextStyles.text2.apply(color: color),
    ),
  );
}
