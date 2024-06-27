import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:promilo/core/constant/asset_constant.dart';

import '../../core/route/route_name.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      context.goNamed(RouteName.login);
    });
    return SafeArea(
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(AssetConstant.logo),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1758A1),
                ),
                child: AnimatedTextKit(
                  repeatForever: false,
                  isRepeatingAnimation: false,
                  displayFullTextOnTap: false,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "Keep your Business Growing",
                      textAlign: TextAlign.center,
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
