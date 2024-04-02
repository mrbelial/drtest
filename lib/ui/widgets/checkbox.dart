import 'package:flutter/material.dart';

import '../../tools/core.dart';

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
              side: AlwaysActiveBorderSide(checked),
              splashRadius: 0,
            ),
          ),
          Flexible(child: Text(title))
        ],
      ),
    ),
    onTap: () => onChange(id, !checked),
  );
  // return Padding(
  //   padding: const EdgeInsets.only(top: 10),
  //   child: CheckboxListTile(
  //     controlAffinity: ListTileControlAffinity.leading,
  //     value: checked,
  //     title: Text(title),
  //     onChanged: (b) => onChange(id, b!),
  //     side: AlwaysActiveBorderSide(checked),
  //   ),
  // );
}

class AlwaysActiveBorderSide extends MaterialStateBorderSide {
  const AlwaysActiveBorderSide(this.isChecked);
  final bool isChecked;

  @override
  BorderSide? resolve(states) =>
      BorderSide(color: isChecked ? AppColors.primary : AppColors.gray);
}
