import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'divider.dart';

import '../../tools/core.dart';

var screenSize = Get.size;
Widget circle(double size, Color color, Widget widget) => Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Center(child: widget),
    );

Widget cardBox({
  required Widget child,
  EdgeInsetsGeometry margin = const EdgeInsets.all(10),
  EdgeInsetsGeometry padding = const EdgeInsets.all(10),
  BorderRadiusGeometry? borderRadius,
  BoxBorder? border,
  Gradient? gradient,
  Color? shadowColor,
}) {
  return Container(
    margin: margin,
    padding: padding,
    decoration: BoxDecoration(
        color: Colors.white,
        gradient: gradient,
        border: border,
        borderRadius: borderRadius ?? BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? AppColors.lightGray.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ]),
    child: child,
  );
}

Widget square(double size, Color color, Widget widget) => Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: Center(child: widget),
    );

Widget title(String title) => Text(
      title,
      style: AppTextStyles.text1,
    );

// Widget box(
//         {required Color color,
//         required double radius,
//         required Widget widget,
//         EdgeInsetsGeometry margin = const EdgeInsets.all(0),
//         EdgeInsetsGeometry padding = const EdgeInsets.all(0)}) =>
//     Container(
//       padding: padding,
//       margin: margin,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(radius),
//         color: color,
//         boxShadow: [
//           BoxShadow(
//               color: color == AppColors.white
//                   ? AppColors.shadow
//                   : color.withOpacity(0.3),
//               offset: const Offset(0, 0),
//               blurRadius: 10)
//         ],
//       ),
//       child: Center(child: widget),
//     );

exitDialog() => Container(
      height: screenSize.height * 0.3,
      padding: const EdgeInsets.all(24),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'آیا می خواهید از برنامه خارج شوید؟',
              style: AppTextStyles.text1,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              appButton(
                  title: 'بله',
                  onTap: () {
                    exit(0);
                  }),
              borderButton(title: 'خیر', onTap: Get.back)
            ])
          ]),
    );

Widget rowField(String title, Widget value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(title, style: AppTextStyles.text1), value],
    ),
  );
}

Widget rowTextField(String title, String value, [int maxLines = 2]) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.text1),
        Text(value,
            style: AppTextStyles.text1,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis),
      ],
    ),
  );
}

Widget sepratedDiv(double space) {
  return Container(
    margin: EdgeInsets.only(top: space, bottom: space),
    width: 100,
    height: .5,
    color: AppColors.gray,
  );
}

listTile({
  required String title,
  Widget? leading,
  Widget? trailing,
  String? subtitle,
  void Function()? onTap,
  bool hasLine = false,
  Color titleColor = AppColors.black,
  Color lineColor = AppColors.gray,
  Color backgroundColor = Colors.transparent,
  EdgeInsetsGeometry padding = const EdgeInsets.all(20),
  EdgeInsetsGeometry margin = const EdgeInsets.all(10),
  TextStyle? textStyle,
}) {
  return cardBox(
    padding: EdgeInsets.zero,
    margin: margin,
    child: MaterialButton(
      onPressed: onTap,
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (leading != null)
            Container(
              padding: const EdgeInsets.only(left: 10),
              alignment: Alignment.centerRight,
              child: leading,
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: textStyle ??
                            AppTextStyles.bodyTextLargeDark
                                .copyWith(color: titleColor),
                      ),
                    ),
                  ],
                ),
                if (subtitle != null)
                  Text(subtitle,
                      style:
                          AppTextStyles.text3.apply(color: AppColors.gray)),
                if (hasLine)
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: CustomDivider(
                      height: 1,
                      color: lineColor,
                    ),
                  ),
              ],
            ),
          ),
          if (trailing != null)
            Container(
              alignment: Alignment.center,
              child: trailing,
            ),
        ],
      ),
    ),
  );
}
