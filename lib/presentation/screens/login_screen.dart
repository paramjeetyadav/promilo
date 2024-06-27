import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:promilo/core/constant/app_constant.dart';
import 'package:promilo/core/constant/asset_constant.dart';
import 'package:promilo/core/constant/theme_constant.dart';
import 'package:promilo/core/route/route_name.dart';
import 'package:promilo/presentation/component/elevated_button.dart';
import 'package:promilo/presentation/component/text_widget.dart';
import 'package:promilo/view_models/login_view_model.dart';
import 'package:provider/provider.dart';

import '../../core/common_utils/helper_fucntion.dart';
import '../component/login_edit_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LoaderOverlay(
        child: Scaffold(
          backgroundColor: ThemeConstant.whiteColor,
          body: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 180,
                      child: Image.asset(AssetConstant.logo),
                    ),
                    const Gap(50),
                    const TextWidget(
                      text: "Hi, Welcome Back!",
                      fontWeight: FontWeight.bold,
                      color: ThemeConstant.boldBlueColor,
                      size: 22,
                    ),
                    const Gap(40),
                    LoginEditField(
                      title: "Please SignIn to continue",
                      hintText: "Enter Email or Mob No.",
                      controller: userName,
                      blueText: "Sign In with OTP",
                      validator: AppConstant.emailValidation.call,
                      onChange: (value) {
                        checkFieldStatus();
                      },
                    ),
                    const Gap(20),
                    LoginEditField(
                      title: "Password",
                      hintText: "Enter Password",
                      controller: password,
                      blueText: "Forgot Password",
                      validator: AppConstant.passwordValidation.call,
                      onChange: (value) {
                        checkFieldStatus();
                      },
                    ),
                    const Gap(20),
                    Consumer<LoginViewModel>(
                      builder: (ctx, data, child) {
                        return ElevatedButtonWidget(
                          isEnabled: data.isSubmitEnabled,
                          title: "Submit",
                          onPressed: () async {
                            if (!formKey.currentState!.validate()) {
                              return;
                            }
                            context.loaderOverlay.show();

                            String? errorMessage = await context.read<LoginViewModel>().login(context, userName.text, password.text);
                            if (context.mounted) {
                              context.loaderOverlay.hide();
                            }
                            if (errorMessage != null && context.mounted) {
                              HelperFunction.showAwesomeDialog(
                                context,
                                onPrimaryTap: () {
                                  Navigator.pop(context);
                                },
                                dialogType: DialogType.error,
                                title: errorMessage,
                              );
                              return;
                            }

                            if (context.mounted) {
                              HelperFunction.showSnack(context, "!! Successfully Login  !!");
                              context.goNamed(RouteName.meetup);
                            }
                          },
                        );
                      },
                    ),
                    const Gap(20),
                    SizedBox(
                      height: 40,
                      width: double.maxFinite,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: 2,
                              color: ThemeConstant.hintColor.withOpacity(0.5),
                              margin: const EdgeInsets.only(right: 5),
                            ),
                          ),
                          const TextWidget(
                            text: "or",
                            size: 17,
                          ),
                          Expanded(
                            child: Container(
                              height: 2,
                              color: ThemeConstant.hintColor.withOpacity(0.5),
                              margin: const EdgeInsets.only(left: 5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          AppConstant.socialLogo.length,
                          (index) => Image.asset(
                                AppConstant.socialLogo[index],
                                width: 60,
                                height: 60,
                              )),
                    ),
                    const Gap(20),
                    const Row(
                      children: [
                        TextWidget(
                          text: "Business User?",
                          color: ThemeConstant.hintColor,
                          size: 16,
                        ),
                        Spacer(),
                        TextWidget(
                          text: "Don't have an account",
                          color: ThemeConstant.hintColor,
                          size: 16,
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        TextWidget(
                          text: "Login Here",
                          color: ThemeConstant.blueShadeColor,
                          size: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        Spacer(),
                        TextWidget(
                          text: "Sign Up",
                          color: ThemeConstant.blueShadeColor,
                          size: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    const Spacer(),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'By continuing, you agree \n to Promilo\'s ',
                        style: const TextStyle(color: Colors.grey, fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Terms of Use & Privacy Policy',
                            style: const TextStyle(color: Colors.black),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle the 'Terms of use' tap here
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkFieldStatus() {
    debugPrint("validating ${userName.text} and password is ${password.text}");
    if ((userName.text.isNotEmpty && password.text.isNotEmpty) &&
        (EmailValidator(errorText: '').isValid(userName.text)) &&
        (PatternValidator(
          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#^<>=])[A-Za-z\d@$!%*?&#^<>=]{8,}$',
          errorText: 'Password should be between 6-12 characters',
        ).isValid(password.text))) {
      context.read<LoginViewModel>().setSubmitEnabled = true;
    } else {
      context.read<LoginViewModel>().setSubmitEnabled = false;
    }
  }
}
