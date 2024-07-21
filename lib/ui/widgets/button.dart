import 'package:flutter/material.dart';

import '../../tools/core.dart';

Widget appButton({
  required String title,
  VoidCallback? onTap,
  Widget? trailing,
  Widget? leading,
  Color color = AppColors.buttonBackground,
  Color? textColor,
  EdgeInsets margin = const EdgeInsets.symmetric(vertical: 7),
  EdgeInsets padding = const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
  TextAlign textAlign = TextAlign.center,
}) =>
    Container(
      padding: margin,
      child: ElevatedButton(
        onPressed: onTap,
        style:
            ElevatedButton.styleFrom(padding: padding, backgroundColor: color),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leading != null) ...[leading, const SizedBox(width: 10)],
            Expanded(
              child: Text(
                title,
                style: textColor == null
                    ? AppTextStyles.title3
                    : AppTextStyles.title3.apply(color: textColor),
                maxLines: 10,
                softWrap: true,
                textAlign: textAlign,
              ),
            ),
            if (trailing != null) trailing,
          ],
        ),
      ),
    );

Widget appButtonSmallText({
  required String title,
  VoidCallback? onTap,
  Widget? trailing,
  Widget? leading,
  Color color = AppColors.white,
  Color? bgColor = AppColors.primary,
  EdgeInsets margin = const EdgeInsets.symmetric(vertical: 7),
  EdgeInsets padding = const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
}) =>
    Container(
      padding: margin,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            padding: padding, backgroundColor: bgColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leading != null) ...[leading, const SizedBox(width: 10)],
            Text(
              title,
              style: AppTextStyles.text2.copyWith(color: color, fontSize: 11),
            ),
            if (trailing != null) trailing,
          ],
        ),
      ),
    );

Widget appButtonLoading({
  EdgeInsets margin = const EdgeInsets.symmetric(vertical: 7),
  EdgeInsets padding = const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
}) =>
    Container(
      padding: margin,
      child: ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(padding: padding),
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );

Widget smallAppButton({
  required String title,
  VoidCallback? onTap,
  Widget? trailing,
  Widget? leading,
  Color? color,
  EdgeInsets margin = const EdgeInsets.symmetric(vertical: 2),
  EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
}) =>
    Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leading != null) leading,
            Text(
              title.isEmpty ? "خالی" : title,
              style: AppTextStyles.text1.apply(color: AppColors.white),
            ),
            if (trailing != null) trailing,
          ],
        ),
      ),
    );

Widget borderButton({
  required String title,
  VoidCallback? onTap,
  Color? color,
  Color borderColor = AppColors.primary,
}) =>
    OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 1, color: borderColor),
      ),
      child: Text(
        title,
        style: AppTextStyles.text1.apply(color: color ?? AppColors.primary),
      ),
    );

Widget textButton({
  required String title,
  VoidCallback? onTap,
  Color? color = AppColors.primary,
  TextStyle? textStyle,
  EdgeInsetsGeometry? padding,
}) =>
    TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(padding: padding),
      child: Text(
        "\t$title\t",
        style: textStyle ?? AppTextStyles.text1.apply(color: color),
      ),
    );

Widget linkButton({
  required String title,
  VoidCallback? onTap,
  Color? color = AppColors.primary,
  TextStyle? textStyle,
}) =>
    TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      child: Text(
        "\t$title\t",
        style: textStyle ??
            AppTextStyles.text1
                .apply(color: color, decoration: TextDecoration.underline),
      ),
    );

Widget appButton2({
  required String title,
  VoidCallback? onTap,
  Widget? trailing,
  Widget? leading,
  Color color = AppColors.blue,
  EdgeInsets margin = const EdgeInsets.symmetric(vertical: 10),
  EdgeInsets padding = const EdgeInsets.symmetric(vertical: 17, horizontal: 8),
  TextStyle? textStyle,
}) =>
    Container(
      margin: margin,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          padding: padding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leading != null) ...[leading, const SizedBox(width: 10)],
            Text(
              title,
              style: textStyle ??
                  AppTextStyles.text1.apply(color: AppColors.white),
            ),
            if (trailing != null) trailing,
          ],
        ),
      ),
    );

Widget borderButton2({
  required String title,
  VoidCallback? onTap,
  Color? color,
  Color borderColor = AppColors.blue,
  EdgeInsets margin = const EdgeInsets.symmetric(vertical: 10),
  EdgeInsets padding = const EdgeInsets.symmetric(vertical: 17, horizontal: 8),
}) =>
    Container(
      margin: margin,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1, color: borderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          padding: padding,
        ),
        child: Text(
          title,
          style: AppTextStyles.text1.apply(color: color ?? AppColors.blue),
        ),
      ),
    );

Widget borderButtonLarge({
  required String title,
  VoidCallback? onTap,
  Color? color,
  Color borderColor = AppColors.primary,
  EdgeInsets margin = const EdgeInsets.symmetric(vertical: 10),
  EdgeInsets padding = const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
}) =>
    Container(
      margin: margin,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 1,
            color: borderColor,
          ),
          padding: padding,
        ),
        child: Text(
          title,
          style: AppTextStyles.text1
              .copyWith(color: color ?? AppColors.primary, fontSize: 25),
        ),
      ),
    );
