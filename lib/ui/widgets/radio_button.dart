import 'package:flutter/material.dart';

import '../../tools/core.dart';

Widget radioButton({
  required String title,
  required int value,
  // required int groupValue,
  // required Function(int?) onChanged,
}) {
  return RadioListTile(
    value: value,
    // groupValue: groupValue,
    // onChanged: onChanged,
    title: Text(title),
    activeColor: AppColors.primary,
  );
}
