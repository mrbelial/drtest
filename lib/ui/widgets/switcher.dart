import 'package:flutter/cupertino.dart';

Widget switcher({
  required bool value,
  required void Function(bool)? onChanged,
}) {
  return CupertinoSwitch(value: value, onChanged: onChanged);
}
