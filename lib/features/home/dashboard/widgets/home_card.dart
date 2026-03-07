import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/features/home/data/home_card_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: homeCardData.length,
      itemBuilder: (context, index) {
        final card = homeCardData[index];
        return Container(
          padding: const EdgeInsets.all(8),
          height: 168,
          width: 168,
          decoration: boxDecoration(
            cardColor: colorScheme.secondary,
            shadowColor: colorScheme.primary,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                SvgPicture.asset(width: 16, height: 23, card.svgPicture),
            
                Text(
                  card.title,
                  textAlign: TextAlign.center,
                  style: textTheme.title.copyWith(color: colorScheme.primary),
                ),
            
                Text(
                  card.description,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyRegular.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
