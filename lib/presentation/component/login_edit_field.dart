import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:promilo/core/constant/theme_constant.dart';
import 'package:promilo/presentation/component/edit_text_widget.dart';
import 'package:promilo/presentation/component/text_widget.dart';

class LoginEditField extends StatelessWidget {
  final String title;
  final String hintText;
  final String blueText;
  final bool isRequired;
  final bool isPassword;
  final String? Function(String?)? validator;
  final void Function(String)? onChange;
  final TextEditingController controller;
  const LoginEditField(
      {super.key,
      required this.title,
      required this.hintText,
      this.isRequired = true,
      this.isPassword = false,
      required this.controller,
      required this.blueText,
      this.validator,
      this.onChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: title,
          size: 17,
        ),
        const Gap(5),
        EditTextWidget(
          controller: controller,
          isRequired: isRequired,
          hintText: hintText,
          validator: validator,
          onChange: onChange,
        ),
        const Gap(5),
        Row(
          children: [
            isPassword
                ? Checkbox(
                    value: true,
                    onChanged: (bool? value) {},
                  )
                : const SizedBox(),
            isPassword
                ? const TextWidget(
                    text: "Remember Me",
                    color: ThemeConstant.hintColor,
                  )
                : const SizedBox(),
            const Spacer(),
            TextWidget(
              text: blueText,
              color: ThemeConstant.blueShadeColor,
              fontWeight: FontWeight.bold,
              size: 16,
            )
          ],
        )
      ],
    );
  }
}
