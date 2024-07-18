import 'package:drtest/tools/core.dart';
import 'package:flutter/cupertino.dart';

Widget badge({required Widget child, required Color color}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
    child: child,
  );
}

Widget badgeText(
    {required String text,
    Color color = AppColors.warning,
    Color bgColor = AppColors.yellowBackground}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(15), color: bgColor),
    child: Text(
      text,
      style: AppTextStyles.text2.apply(color: color),
    ),
  );
}
