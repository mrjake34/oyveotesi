import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oyveotesi/authentication/login/view/login.dart';
import 'package:oyveotesi/base/service/translation/translation_service.dart';
import 'package:oyveotesi/theme/theme_light.dart';

void main() {
  runApp(EasyLocalization(
      path: "assets/translation",
      supportedLocales: TranslationManager.instance!.supportedLocales,
      startLocale: TranslationManager.instance!.trLocale,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Oy Ve Ötesi',
        theme: lightTheme,
        home: const LoginPage());
  }
}
