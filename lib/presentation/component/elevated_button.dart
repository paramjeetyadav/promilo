import 'package:flutter/material.dart';
import 'package:promilo/presentation/component/text_widget.dart';

import '../../core/constant/theme_constant.dart';

class ElevatedButtonWidget extends StatefulWidget {
  final String? title;
  final bool isEnabled;
  final double width;
  final double height;
  final Color bgColor;
  final FontWeight? fontWeight;
  final Function()? onPressed;

  const ElevatedButtonWidget({
    super.key,
    this.title,
    this.fontWeight,
    this.onPressed,
    this.isEnabled = true,
    this.width = double.maxFinite,
    this.height = 45,
    this.bgColor = ThemeConstant.primaryColor,
  });

  @override
  State<ElevatedButtonWidget> createState() => _ElevatedButtonWidgetState();
}

class _ElevatedButtonWidgetState extends State<ElevatedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.isEnabled ? widget.bgColor : ThemeConstant.hintColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: Colors.transparent,
              width: 50,
            ),
          ),
        ),
        onPressed: widget.onPressed,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: TextWidget(
              text: widget.title,
              color: Colors.white,
              size: 17,
            ),
          ),
        ),
      ),
    );
  }
}
