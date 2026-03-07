import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:flutter/material.dart';

class Donate extends StatelessWidget {
  const Donate({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;

    return Scaffold(
      backgroundColor: customColors.background,
      body:  Center(child: Text("Donate")),
    );
  }
}
