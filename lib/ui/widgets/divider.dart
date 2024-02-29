import 'package:flutter/material.dart';

import '../../tools/core.dart';

class CustomDivider extends StatelessWidget {
  final bool isHorizontal;
  final Color? color;
  final double height;
  final EdgeInsetsGeometry? margin;

  const CustomDivider({
    super.key,
    this.isHorizontal = true,
    this.color,
    this.height = 1,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 10),
      color: color ?? AppColors.gray.withOpacity(.2),
      height: height,
    );
  }
}
