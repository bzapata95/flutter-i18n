import 'package:flutter/material.dart';
import 'package:i18n/app/my_app.dart';
import 'package:i18n/number_format_ext.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:intl/number_symbols.dart';
import 'package:intl/number_symbols_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final languageCode =
      WidgetsBinding.instance.platformDispatcher.locale.languageCode;
  final countryCode =
      WidgetsBinding.instance.platformDispatcher.locale.countryCode;

  String defaultLocale = languageCode;

  if (countryCode != null) {
    defaultLocale = '_$countryCode';
  }
  print(defaultLocale);
  Intl.defaultLocale = defaultLocale;
  initializeDateFormatting('es_PE', null);
  final esES = numberFormatSymbols['es_ES'] as NumberSymbols;
  final esUS = numberFormatSymbols['en_US'] as NumberSymbols;

  numberFormatSymbols['es_ES'] = esES.copyWith(currencySymbol: '€');
  numberFormatSymbols['en_US'] = esUS.copyWith(currencySymbol: r'$');
  numberFormatSymbols['en'] = esUS.copyWith(currencySymbol: r'$');
  numberFormatSymbols['es_PE'] = esUS.copyWith(currencySymbol: 'S/ ');

  runApp(MyApp(
    defaultLanguageCode: languageCode,
    defaultCountryCode: countryCode ?? '',
  ));
}
