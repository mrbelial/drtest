import 'package:flutter/material.dart';

import '../../tools/core.dart';

Widget checkBox2({
  required int id,
  required String title,
  required bool checked,
  required Function(int, bool) onChange,
}) {
  return Transform.scale(
    scale: 1.3,
    child: Checkbox(
      value: checked,
      onChanged: (b) => onChange(id, b!),
      side: AlwaysActiveBorderSide(checked),
      splashRadius: 0,
    ),
  );
}

Widget checkBox({
  required int id,
  required String title,
  required bool checked,
  required Function(int, bool) onChange,
}) {
  return InkWell(
    child: Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Transform.scale(
            scale: 1.3,
            child: Checkbox(
              value: checked,
              onChanged: (b) => onChange(id, b!),
              splashRadius: 0,
            ),
          ),
          Flexible(
            child: Text(
              title,
              style: AppTextStyles.text1.apply(color: AppColors.textColor1),
            ),
          ),
        ],
      ),
    ),
    onTap: () => onChange(id, !checked),
  );
}

class AlwaysActiveBorderSide extends WidgetStateBorderSide {
  const AlwaysActiveBorderSide(this.isChecked);
  final bool isChecked;

  @override
  BorderSide? resolve(states) =>
      BorderSide(color: isChecked ? AppColors.primary : AppColors.gray);
}
