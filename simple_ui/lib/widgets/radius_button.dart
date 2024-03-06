import 'package:flutter/material.dart';
import 'package:simple_ui/widgets/text_semi_bold.dart';

class RadiusButton extends ElevatedButton {
  RadiusButton({Key? key,
    required String text,
    Color? color,
    required Color textColor,
    required VoidCallback? onPressed,
    Widget? child,
    double height = 50
  }) : super(key: key,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          )
      ),
      child: child ?? SizedBox(
        height: height,
        child: Center(
          child: TextSemiBold(
            text: text,
            color: textColor,
          ),
        ),
      )
  );
}