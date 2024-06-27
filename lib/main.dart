import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promilo/core/constant/theme_constant.dart';
import 'package:promilo/core/route/route_generator.dart';
import 'package:promilo/view_models/login_view_model.dart';
import 'package:provider/provider.dart';

import 'core/common_utils/shared_pref_utils.dart';

void main() async {
  // Ensure that plugin services are initialized so that `SystemChrome.setPreferredOrientations` works.
  WidgetsFlutterBinding.ensureInitialized();

  /// Initializing shared preference
  await SharedPrefUtils.init();

  // Lock the screen orientation to portrait mode.
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => LoginViewModel())],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: myTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
      ),
    );
  }

  final ThemeData myTheme = ThemeData(
      colorSchemeSeed: ThemeConstant.primaryColor,
      scaffoldBackgroundColor: Colors.grey,
      appBarTheme: const AppBarTheme(
        color: ThemeConstant.primaryColor,
        elevation: 5,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: ThemeConstant.primaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(ThemeConstant.primaryColor),
          textStyle: WidgetStateProperty.all(const TextStyle(color: Colors.white)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Adjust button shape
            ),
          ),
        ),
      ),
      cardTheme: CardTheme(
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ));
}
