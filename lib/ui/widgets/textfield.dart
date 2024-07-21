import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../tools/core.dart';

Widget headerField({
  required String label,
  AlignmentGeometry align = Alignment.centerRight,
  Color color = AppColors.white,
  EdgeInsetsGeometry padding =
      const EdgeInsets.only(right: 16, bottom: 8, top: 15),
}) {
  return Container(
    alignment: align,
    padding: padding,
    child: Text(
      label,
      style: AppTextStyles.text1.copyWith(color: color),
    ),
  );
}

Widget textField({
  int? maxLength,
  String hint = "",
  String? label,
  bool pass = false,
  EdgeInsetsGeometry? margin = const EdgeInsets.only(top: 5),
  EdgeInsetsGeometry? contentPadding =
      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  int maxLines = 1,
  TextInputType type = TextInputType.text,
  TextEditingController? controller,
  Widget? icon,
  TextInputAction textInputAction = TextInputAction.next,
  Function(String)? onChanged,
  Function(String)? onSubmitted,
  Function()? onTap,
  bool readOnly = false,
  bool showClearButton = false,
  FocusNode? focusNode,
  TextDirection? hintTextDirection,
  TextAlign textAlign = TextAlign.start,
  List<TextInputFormatter>? formatter,
  Color bgColor = AppColors.white,
  TextDirection? textDirection,
  bool autofocus = false,
}) {
  focusNode ??= FocusNode();
  controller ??= TextEditingController();

  focusNode.addListener(() {
    if (focusNode!.hasFocus) {
      controller!.selection = TextSelection(
        baseOffset: 0,
        extentOffset: controller.text.length,
      );
    }
  });

  textDirection ??= [TextInputType.number, TextInputType.phone].contains(type)
      ? TextDirection.ltr
      : TextDirection.ltr;

  var child = TextField(
    autofocus: autofocus,
    keyboardType: type,
    maxLines: maxLines,
    focusNode: focusNode,
    cursorColor: AppColors.black,
    obscureText: pass,
    controller: controller,
    textAlign: textAlign,
    onTap: onTap,
    inputFormatters: formatter,
    // textAlign:
    //     [TextInputType.number, TextInputType.phone].contains(type)
    //         ? TextAlign.left
    //         : TextAlign.right,
    readOnly: readOnly,
    maxLength: maxLength,
    style: AppTextStyles.text1.apply(color: AppColors.black),
    textInputAction: textInputAction,
    onChanged: onChanged,
    onSubmitted: onSubmitted,
    textDirection: textDirection,
    decoration: InputDecoration(
      filled: true,
      counterText: '',
      fillColor: bgColor,
      hoverColor: bgColor,
      focusColor: AppColors.black,
      focusedBorder: AppThemes.inputBorder,
      hintText: hint,
      hintTextDirection: hintTextDirection ?? TextDirection.ltr,
      suffixIcon: icon,
      hintStyle: const TextStyle(color: AppColors.gray),
      contentPadding: contentPadding,
    ),
  );
  return Container(
    margin: margin,
    child: (!showClearButton && label == null)
        ? child
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: showClearButton
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.start,
                children: [
                  if (label != null) headerField(label: label),
                  if (showClearButton)
                    textButton(
                      title: "پاک کردن",
                      textStyle: AppTextStyles.title4
                          .copyWith(color: AppColors.primary),
                      onTap: () {
                        controller?.text = "";
                        focusNode?.requestFocus();
                      },
                    ),
                ],
              ),
              child,
            ],
          ),
  );
}

Widget textField2({
  required int maxLength,
  required String hint,
  String? label,
  bool pass = false,
  EdgeInsetsGeometry? margin,
  int maxLines = 1,
  TextInputType type = TextInputType.text,
  TextEditingController? controller,
  IconData? icon,
  TextInputAction? textInputAction,
  Function(String)? onChanged,
  Function()? onTap,
  bool readOnly = false,
  bool showClearButton = false,
  FocusNode? focusNode,
  TextDirection? hintTextDirection,
}) {
  focusNode ??= FocusNode();
  return Container(
    padding: margin,
    child: TextField(
      keyboardType: type,
      maxLines: maxLines,
      minLines: 1,
      focusNode: focusNode,
      cursorColor: AppColors.primary,
      obscureText: pass,
      controller: controller,
      onTap: onTap,
      // textAlign:
      //     [TextInputType.number, TextInputType.phone].contains(type)
      //         ? TextAlign.left
      //         : TextAlign.right,
      readOnly: readOnly,
      maxLength: maxLength,
      style: AppTextStyles.text2,
      textInputAction: textInputAction,
      onChanged: onChanged,
      textDirection: [TextInputType.number, TextInputType.phone].contains(type)
          ? TextDirection.ltr
          : TextDirection.ltr,
      decoration: InputDecoration(
        counterText: '',
        fillColor: Colors.transparent,
        hintText: hint,
        hintTextDirection: hintTextDirection ?? TextDirection.ltr,
        suffixIcon: icon == null ? null : Icon(icon, color: AppColors.primary),
        hintStyle: const TextStyle(color: AppColors.gray),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
      ),
    ),
  );
}

Widget textField3({
  required int maxLength,
  required String hint,
  String? label,
  Color labelColor = AppColors.darkGray,
  bool pass = false,
  EdgeInsetsGeometry? margin = const EdgeInsets.only(top: 5),
  int maxLines = 1,
  TextInputType type = TextInputType.text,
  TextEditingController? controller,
  Widget? icon,
  TextInputAction textInputAction = TextInputAction.next,
  Function(String)? onChanged,
  Function()? onTap,
  bool readOnly = false,
  bool showClearButton = false,
  FocusNode? focusNode,
  TextDirection? hintTextDirection,
  TextAlign textAlign = TextAlign.start,
}) {
  focusNode ??= FocusNode();
  return Container(
    padding: margin,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showClearButton || label != null)
          Row(
            mainAxisAlignment: showClearButton
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.start,
            children: [
              headerField(
                  label: label ?? "",
                  color: labelColor,
                  padding: const EdgeInsets.only(right: 20)),
              if (showClearButton)
                textButton(
                  title: "پاک کردن",
                  textStyle:
                      AppTextStyles.title4.copyWith(color: AppColors.blue),
                  onTap: () {
                    controller?.text = "";
                    focusNode?.requestFocus();
                  },
                ),
            ],
          ),
        TextField(
          keyboardType: type,
          maxLines: maxLines,
          focusNode: focusNode,
          cursorColor: AppColors.primary,

          obscureText: pass,
          controller: controller,
          onTap: onTap,
          // textAlign:
          //     [TextInputType.number, TextInputType.phone].contains(type)
          //         ? TextAlign.left
          //         : TextAlign.right,
          readOnly: readOnly,
          maxLength: maxLength,
          style: AppTextStyles.text1
              .copyWith(color: readOnly ? AppColors.gray : AppColors.black),
          textInputAction: textInputAction,
          onChanged: onChanged,
          textDirection:
              [TextInputType.number, TextInputType.phone].contains(type)
                  ? TextDirection.ltr
                  : TextDirection.ltr,
          textAlign: textAlign,
          decoration: InputDecoration(
            filled: true,
            counterText: '',
            fillColor: Colors.transparent,
            hintText: hint,
            hintTextDirection: hintTextDirection ?? TextDirection.ltr,
            suffixIcon: icon,
            hintStyle: const TextStyle(color: AppColors.gray),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            border: AppThemes.inputBorder2,
          ),
        ),
      ],
    ),
  );
}

class NumericalRangeFormatter extends TextInputFormatter {
  NumericalRangeFormatter({
    required this.min,
    this.max = 0,
    this.decimalDigits = 0,
    this.separator = ",",
  });

  final double min;
  final double max;
  final int decimalDigits;
  final String separator;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == '') {
      return newValue;
    }

    var val = _checkMinMax(
        oldValue.text.replaceAll(",", ""), newValue.text.replaceAll(",", ""));
    var newVal = decimalDigits > 0
        ? toCurrency(double.parse(val))
        : toCurrency(int.parse(val));
    var selectionIndexFromTheRight =
        newValue.text.length - newValue.selection.end;
    return TextEditingValue(
      text: newVal,
      selection: TextSelection.collapsed(
        offset: newVal.length - selectionIndexFromTheRight,
      ),
    );
  }

  String _checkMinMax(
    String oldValue,
    String newValue,
  ) {
    if (double.parse(newValue) < min) {
      return min.toStringAsFixed(decimalDigits);
    } else {
      var nv = decimalDigits > 0 ? double.parse(newValue) : int.parse(newValue);
      return max > 0 && nv > max ? oldValue : newValue;
    }
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({this.decimalRange = 2}) : assert(decimalRange > 0);
  final int decimalRange;
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;
    String value = newValue.text;
    if (value.contains(".") &&
        value.substring(value.indexOf(".") + 1).length > decimalRange) {
      truncated = oldValue.text;
      newSelection = oldValue.selection;
    } else if (value == ".") {
      truncated = "0.";
      newSelection = newValue.selection.copyWith(
        baseOffset: min(truncated.length, truncated.length + 1),
        extentOffset: min(truncated.length, truncated.length + 1),
      );
    }
    return TextEditingValue(
      text: truncated,
      selection: newSelection,
      composing: TextRange.empty,
    );
  }
}
