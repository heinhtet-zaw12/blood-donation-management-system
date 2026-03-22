import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/theme_getter.dart';

class DrawerItem extends StatelessWidget {
  final SvgPicture svg;
  final String text;

  const DrawerItem({super.key, required this.svg, required this.text});
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    return  Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
            child: Row(
              children: [svg,
              const SizedBox(width: 16),
                    Text(text,
                    style: textTheme.subTitle.copyWith(
                      color: customColors.darkPrimary
                    )),],
            ),
    );
  }
}
