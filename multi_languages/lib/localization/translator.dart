import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Translator {
  Translator(this.locale);

  Locale locale;
  static late Map<dynamic, dynamic> _values;

  static Translator? of(BuildContext context) {
    return Localizations.of<Translator>(context, Translator);
  }

  static Future<Translator> load(Locale locale) async {
    final Translator translator = Translator(locale);
    final String jsonContent = await rootBundle
        .loadString('assets/lang/localization_${locale.languageCode}.json');
    _values = json.decode(jsonContent);
    return translator;
  }
  String getString(String key) {
    return _values[key] ?? '$key not found';
  }

}