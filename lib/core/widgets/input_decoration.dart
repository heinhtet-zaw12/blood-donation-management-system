import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

InputDecoration buildInputDecoration({required BuildContext context, required String hintText, TextStyle? hintStyle, SvgPicture? svg}) {
  
  final customColors = context.colors;
  final textTheme = context.bdmsText;
  final color = customColors.disabled!;

  return InputDecoration(
    hintText: hintText,
    hintStyle: hintStyle ?? textTheme.tabText.copyWith(color: customColors.disabled), 
    filled: true,
    fillColor: Color(0xFFFEF0EF),
    suffixIcon: Padding(
      padding: const EdgeInsets.all(12),
      child: svg,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1.5),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:  BorderSide(color: color, width: 1.5),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}