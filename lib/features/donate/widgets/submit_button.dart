import 'package:blood_donation_management_system/core/widgets/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

SizedBox SubmitButton(BuildContext context,{required VoidCallback onPressed}) {
  final colorScheme = Theme.of(context).colorScheme;

  return SizedBox(
    width: double.infinity,
    height: 50,
    child: ElevatedButtonWidget(
      text: "Submit",
      onPressed: onPressed,
      svg: SvgPicture.asset(
        "assets/images/submit_icon.svg",
        width: 18,
        colorFilter: ColorFilter.mode(colorScheme.secondary, BlendMode.srcIn),
      ),
    ),
  );
  
}
