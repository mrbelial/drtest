import 'package:flutter/cupertino.dart';

Widget badge({required Widget child, required Color color}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
    child: child,
  );
}
