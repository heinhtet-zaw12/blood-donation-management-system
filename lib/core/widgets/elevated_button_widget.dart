import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/theme_getter.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final SvgPicture? svg;
  const ElevatedButtonWidget({super.key, required this.text,
    this.svg,
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    return   Container(
      decoration:  BoxDecoration(
        boxShadow:  [
      BoxShadow(
      color: colorScheme.primary.withAlpha(40),
          blurRadius: 5,
          offset: const Offset(4, 6)
      )
        ]
      ),
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 10,
         ).copyWith(
            backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                if (states.contains(WidgetState.hovered)) {
                  return Color(0xFFB9575E);
                }
                return colorScheme.primary;
              },
            ),
          ),
          onPressed: onPressed,
           label: Text(text, style: textTheme.tabText.copyWith(
          color: colorScheme.secondary
        )),
          icon: svg ?? const SizedBox.shrink(),
        ),
    );

  }
}
