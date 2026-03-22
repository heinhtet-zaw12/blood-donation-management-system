import 'package:flutter/material.dart';

import '../../../../core/theme/theme_getter.dart';

class DonationRequestWidget extends StatelessWidget {
  final String title;
  final int value;
const DonationRequestWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    return Column(
      mainAxisAlignment:  MainAxisAlignment.center,
      children: [
        Text(title,textAlign: TextAlign.center, style:  textTheme.tabText.copyWith(
            color: customColors.darkPrimary
        ),),
        Text(value.toString(), style: textTheme.title.copyWith(
            fontSize: 128,
            color: colorScheme.primary,
            height: 1.0
        ),),
      ],
    );
  }
}
