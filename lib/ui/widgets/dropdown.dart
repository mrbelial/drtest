import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../tools/core.dart';

Widget dropDown({
  required String title,
  required String dialogTitle,
  required int listCount,
  required Widget Function(int) child,
}) {
  return cardBox(
    padding: EdgeInsets.zero,
    margin: EdgeInsets.zero,
    child: listTile(
      title: title,
      trailing: const Icon(
        CupertinoIcons.chevron_down,
      ),
      onTap: () {
        Get.defaultDialog(
          titleStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          title: dialogTitle,
          content: Column(
            children: List.generate(listCount, (index) => child(index)),
          ),
        );
      },
    ),
  );
}

Widget dropDownField({
  required String title,
  required String dialogTitle,
  required int listCount,
  required Widget Function(int) child,
}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.gray, width: 1),
      borderRadius: BorderRadius.circular(16),
    ),
    child: ListTile(
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        Get.defaultDialog(
          title: dialogTitle,
          content: SizedBox(
            height: Get.size.height - 300,
            width: Get.size.width - 50,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: listCount,
              itemBuilder: (context, index) {
                return child(index);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  height: 1,
                  color: AppColors.gray,
                );
              },
            ),
          ),
        );
      },
    ),
  );
}
