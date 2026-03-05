import 'package:flutter/material.dart';

BoxDecoration boxDecoration({required Color? cardColor,required  Color? shadowColor }) {
  return BoxDecoration(
     color: cardColor,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
         color: shadowColor!.withValues(alpha: 0.45),
        blurRadius: 5,
        offset: const Offset(4, 6),
      )
    ],
  );
}