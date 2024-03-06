import 'package:flutter/material.dart';

import '../constants/dimens.dart';
import '../constants/fonts.dart';

class TextSemiBold extends Text {
  TextSemiBold({Key? key,
    required this.text,
    this.fontSize = Dimens.normalFont,
    this.fontFamily = Fonts.sfProTextSemibold,
    this.color = Colors.white,
    this.height,
    TextAlign? textAlign,
    int? maxLines,
    FontWeight? fontWeight
  }) : super(key: key,
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: maxLines == null ? null : TextOverflow.ellipsis,
    style: TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      color: color,
      height: height,
      fontWeight: fontWeight,
    ),
  );

  final String text;
  final double fontSize;
  final double? height;
  final String fontFamily;
  final Color color;
}
