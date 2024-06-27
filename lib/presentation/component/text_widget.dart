import 'package:flutter/material.dart';
import 'package:promilo/core/constant/theme_constant.dart';

class TextWidget extends StatelessWidget {
  final String? text;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;

  const TextWidget({
    super.key,
    this.text,
    this.size,
    this.color,
    this.fontWeight,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: TextStyle(
        fontSize: size ?? 15,
        color: color ?? ThemeConstant.textColor,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontStyle: fontStyle ?? FontStyle.normal,
      ),
    );
  }
}
