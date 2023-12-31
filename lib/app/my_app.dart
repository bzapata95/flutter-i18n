import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n/app/pages/home/home_view.dart';
import 'package:i18n/generated/translations.g.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeView(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocaleUtils.supportedLocales,
      // locale:
      //     _locale, // If not defined 'locale', so using configuration language from phone
      locale: TranslationProvider.of(context).flutterLocale,
    );
  }
}
