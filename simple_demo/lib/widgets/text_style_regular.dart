import 'package:flutter/material.dart';

import '../constants/dimens.dart';
import '../constants/fonts.dart';

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
