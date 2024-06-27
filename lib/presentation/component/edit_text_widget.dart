import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promilo/core/constant/theme_constant.dart';

class EditTextWidget extends StatelessWidget {
  final bool isRequired;
  final String? hintText;
  final TextEditingController controller;
  final RegExp? inputFormatterRegex;
  final String? Function(String?)? validator;
  final void Function(String)? onChange;
  const EditTextWidget(
      {super.key, required this.controller, required this.isRequired, this.hintText, this.inputFormatterRegex, this.validator, this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: controller,
      inputFormatters: inputFormatterRegex != null ? [FilteringTextInputFormatter.allow(inputFormatterRegex!)] : null,
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hintText ?? "Enter Detail",
        hintStyle: const TextStyle(
          color: ThemeConstant.hintColor,
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: ThemeConstant.hintColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
