import 'package:flutter/material.dart';
import 'package:multi_languages/localization/translator.dart';

class TranslatorDelegate extends LocalizationsDelegate<Translator> {
  const TranslatorDelegate({this.newLocale});

  final Locale? newLocale;

  @override
  bool isSupported(Locale locale) {
    return ['en', 'kh'].contains(locale.languageCode);
  }

  @override
  Future<Translator> load(Locale locale) {
    return Translator.load(newLocale ?? locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<Translator> old) {
    return true;
  }
}
