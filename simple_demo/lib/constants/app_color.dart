import 'package:flutter/material.dart';

mixin AppColors {
  static LinearGradient gradientPrimary = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFF142D7D), Color(0xFF0A173F)]);
  static Color primary = const Color(0xFF142D7D);
  static Color secondary = const Color(0xFF31C782);
  static Color primaryDark = const Color(0xFF333333);
  static Color primaryDarkWithAlpha = const Color(0x80333333);
  static Color lightGray = const Color(0xFFEBEBEB);
  static Color shadowColor = const Color(0x33000000);
  static Color brightRed = const Color(0xFFE6011A);
  static Color facebook = const Color(0xFF4267B2);
  static Color green = const Color(0xFF31C782);
  static Color divider = const Color(0xFFE6E6E6);
}
