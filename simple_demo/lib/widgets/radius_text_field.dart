import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_demo/widgets/text_style_regular.dart';

import '../constants/dimens.dart';

class RadiusTextField extends TextFormField {
  RadiusTextField({Key? key,
    TextAlign textAlign = TextAlign.center,
    TextStyle style = const TextStyleRegular(),
    TextInputType keyboardType = TextInputType.text,
    String hintText = '',
    bool obscureText = false,
    required TextEditingController controller,
    FocusNode? focusNode,
    String? errorText,
    TextInputAction? textInputAction,
    VoidCallback? onEditingComplete,
    bool? enabled,
    int? maxLength,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onChanged,
    List<TextInputFormatter>? inputFormatters,
    GestureTapCallback? onTap,
  }) : super(key: key,
    maxLength: maxLength,
    textAlign: textAlign,
    enabled: enabled,
    style: style,
    onTap: onTap,
    validator: validator,
    keyboardType: keyboardType,
    focusNode: focusNode,
    textInputAction: textInputAction,
    onEditingComplete: onEditingComplete,
    onChanged: onChanged,
    inputFormatters: inputFormatters,
    decoration: InputDecoration(
      errorText: errorText,
      errorStyle: const TextStyleRegular(
        color: Colors.red,
        fontSize: Dimens.smallFont,
      ),
      hintText: hintText,
      hintStyle: const TextStyleRegular(color: Colors.white54),
      alignLabelWithHint: true,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
      contentPadding: const EdgeInsets.all(16.0),
      fillColor: Colors.black,
      counterText: '',
    ),
    obscureText: obscureText,
    controller: controller,
  );
}
