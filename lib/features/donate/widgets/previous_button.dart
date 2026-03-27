import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


ElevatedButton PreviousButton({
  required BuildContext context,
  required VoidCallback onPressed
}) {
  ColorScheme colorScheme = Theme.of(context).colorScheme;
  final customColors = context.colors;
  final textTheme = context.bdmsText;

  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: colorScheme.secondary,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: customColors.disabled!,
          width: 2
        ),
        borderRadius: BorderRadius.circular(10)),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/images/backward_icon.svg", width: 18),
          const SizedBox(width: 10),
          Text(
            "Previous",
            style: textTheme.tabText.copyWith(color: customColors.disabled),
          ),
          
        ],
      ),
    ),
  );
}