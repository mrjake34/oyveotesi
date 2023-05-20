import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oyveotesi/authentication/login/view/login.dart';
import 'package:oyveotesi/base/service/navigation/navigation_route.dart';
import 'package:oyveotesi/base/service/navigation/navigation_service.dart';
import 'package:oyveotesi/base/service/translation/translation_service.dart';
import 'package:oyveotesi/base/service/utils/utils.dart';
import 'package:oyveotesi/screens/genelge_page/service/genelge_provider.dart';
import 'package:oyveotesi/theme/theme_light.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchBarProviderGenelge(),)
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Oy Ve Ötesi',
          theme: lightTheme,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          navigatorKey: NavigationService.instance.navigatorKey,
          onGenerateRoute: NavigationRoute.instance.generateRoute,
          scaffoldMessengerKey: UtilsService.instance.messengerKey,
          home: const LoginPage()),
    );
  }
}
