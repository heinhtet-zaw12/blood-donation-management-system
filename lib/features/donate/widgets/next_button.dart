import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


ElevatedButton NextButton({
  required BuildContext context,
  required VoidCallback onPressed,
}) {
  ColorScheme colorScheme = Theme.of(context).colorScheme;
  final customColors = context.colors;
  final textTheme = context.bdmsText;

  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: colorScheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Next",
            style: textTheme.tabText.copyWith(color: colorScheme.secondary),
          ),
          const SizedBox(width: 10),
          SvgPicture.asset("assets/images/forward_icon.svg", width: 18),
        ],
      ),
    ),
  );
}