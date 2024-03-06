import 'package:flutter/material.dart';

import '../common/dimens.dart';
import '../common/fonts.dart';

class TextStyleRegular extends TextStyle {
  const TextStyleRegular({
    fontFamily = Fonts.sfProTextRegular,
    fontSize = Dimens.normalFont,
    color = Colors.white,
  }) : super(
    fontFamily: fontFamily,
    fontSize: fontSize,
    color: color,
  );
}
