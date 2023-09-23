import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n/app/pages/home/home_view.dart';
import 'package:intl/intl.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.defaultLanguageCode,
    required this.defaultCountryCode,
  });

  final String defaultLanguageCode;
  final String defaultCountryCode;

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late Locale _locale;
  Locale get local => _locale;

  final _supportedLocales = const [
    Locale('en'),
    Locale('es'),
    Locale('es', 'PE'),
  ];

  @override
  void initState() {
    super.initState();
    _locale = Locale(
      widget.defaultLanguageCode,
      widget.defaultCountryCode,
    );

    _locale = _supportedLocales.firstWhere(
      (element) =>
          element.languageCode == _locale.languageCode &&
          element.countryCode == _locale.countryCode,
      orElse: () => _supportedLocales.first,
    );
  }

  void changeLanguage(Locale locale) {
    setState(() {
      if (locale.countryCode != null && locale.countryCode!.isNotEmpty) {
        Intl.defaultLocale = '${locale.languageCode}_${locale.countryCode}';
      } else {
        Intl.defaultLocale = locale.languageCode;
      }
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeView(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: _supportedLocales,
      locale:
          _locale, // If not defined 'locale', so using configuration language from phone
    );
  }
}
