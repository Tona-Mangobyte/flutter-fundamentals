import 'package:flutter/cupertino.dart';

import '../localization/translator.dart';

mixin StringUtil {
  static String getString(BuildContext context, String key) => Translator.of(context)?.getString(key) ?? 'Null';
}