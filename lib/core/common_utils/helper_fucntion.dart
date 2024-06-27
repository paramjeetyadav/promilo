import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:promilo/core/constant/theme_constant.dart';
import 'package:promilo/presentation/component/text_widget.dart';

import '../../presentation/component/elevated_button.dart';

class HelperFunction {
  static showSnack(BuildContext context, String message, {bool isInteractive = false, String? buttonText, Function()? onTap}) {
    SnackBar snackBar = SnackBar(
      backgroundColor: ThemeConstant.primaryColor,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(
            text: message,
            color: ThemeConstant.whiteColor,
          ),
          if (isInteractive) TextButton(onPressed: onTap, child: Text(buttonText!)),
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<void> showAwesomeDialog(BuildContext context,
      {DialogType? dialogType,
      required Function() onPrimaryTap,
      String? title,
      Function()? onSecondaryTap,
      String? secondaryText,
      String? primaryText,
      String? description,
      bool? dismissOnBackKeyPress}) async {
    AwesomeDialog(
      context: context,
      title: title,
      desc: description,
      dialogType: dialogType ?? DialogType.info,
      dismissOnTouchOutside: false,
      btnCancel: onSecondaryTap == null
          ? null
          : GestureDetector(
              onTap: onSecondaryTap,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: ThemeConstant.primaryColor),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Text(
                  secondaryText ?? "Cancel",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ThemeConstant.primaryColor,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
      width: 500,
      btnOk: ElevatedButtonWidget(
        height: 50,
        onPressed: onPrimaryTap,
        title: primaryText ?? "OK",
      ),
      dismissOnBackKeyPress: dismissOnBackKeyPress ?? true,
    ).show();
  }
}
