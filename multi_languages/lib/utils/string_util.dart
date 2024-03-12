import 'package:flutter/cupertino.dart';

import '../localization/translator.dart';

mixin StringUtil {
  // static String getString(BuildContext context, String key) => Translator.of(context).getString(key);
  static String getString(BuildContext context, String key) {
    final translator = Translator.of(context);
    String translation = translator?.getString(key) ?? 'Translation not found';
    print(translation);
    return translation;
  }
}