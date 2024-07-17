import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/public/sort_model.dart';
import '../../tools/core.dart';

Widget filterBox({
  required String textFieldHint,
  required TextEditingController textController,
  required List<SortModel> sort,
  required Function(int) onSortSelected,
  Widget? leading,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: Row(
      children: [
        leading ?? Container(),
        Expanded(
          child: textField(
            maxLength: 40,
            hint: textFieldHint,
            controller: textController,
          ),
        ),
        IconButton(
          onPressed: () {
            Get.defaultDialog(
                title: "مرتب سازی",
                actions: [
                  borderButton(title: "بستن", onTap: () => Get.back()),
                ],
                content: SizedBox(
                  width: Get.size.width / .2,
                  child: Column(
                    children: sort
                        .map((item) => ListTile(
                              title: Text(item.title),
                              leading: item.selected
                                  ? const Icon(
                                      CupertinoIcons.largecircle_fill_circle,
                                      color: AppColors.primary,
                                    )
                                  : const Icon(CupertinoIcons.circle),
                              onTap: () {
                                onSortSelected(item.id);
                                Get.back();
                              },
                            ))
                        .toList(),
                  ),
                ));
          },
          icon: const Icon(CupertinoIcons.sort_down),
        ),
      ],
    ),
  );
}

Widget headerText(String title) {
  return Container(
    padding: const EdgeInsets.only(top: 10, right: 10),
    child: Text("$title:", style: AppTextStyles.text1),
  );
}
