import 'package:flutter/material.dart';

class RoundedContainerWidget extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final Color? borderColor;
  final Color? color;
  final double? radius;
  const RoundedContainerWidget({super.key, this.color, this.height, required this.child, this.radius, this.width, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 40,
      height: height ?? 40,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        border: borderColor != null ? Border.all(color: borderColor ?? Colors.grey) : null,
        borderRadius: BorderRadius.circular(radius ?? 80),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 80),
        child: child,
      ),
    );
  }
}
