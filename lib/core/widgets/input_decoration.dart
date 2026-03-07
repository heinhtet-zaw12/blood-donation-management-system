import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

InputDecoration buildInputDecoration({required String hintText,required TextStyle hintStyle, required Color color, SvgPicture? svg}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: hintStyle,
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
