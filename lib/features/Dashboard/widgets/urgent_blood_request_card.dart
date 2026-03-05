import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/theme_getter.dart';

class UrgentRequestCard extends StatelessWidget {
  const UrgentRequestCard({super.key});

  static const Color primaryRed = Color(0xffFF2D3A);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    return Container(
      padding: const EdgeInsets.all(16),
      height: 274,
      width: 382,
      decoration: boxDecoration(cardColor: themeData.colorScheme.secondary, shadowColor:  themeData.colorScheme.primary),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
             Row(
              children: [
                Icon(Icons.warning, color: customColors.darkPrimary,
                size: 18,
                ),
                const SizedBox(width: 8),
                Text(
                  "Urgent Blood Requests",
                  style: textTheme.tabText.copyWith(
                    color:  customColors.darkPrimary
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  width: 120,
                  height: 159,
                  decoration: boxDecoration(cardColor: themeData.colorScheme.primary, shadowColor:  themeData.colorScheme.primary),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("5",
                          style: textTheme.title.copyWith(color: themeData.colorScheme.secondary)),
                      Text("Units", style: textTheme.bodyRegular.copyWith(
                        color:  themeData.colorScheme.secondary
                      ))
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Requests Information",
                          style: textTheme.tabText.copyWith(
                            color: customColors.darkPrimary
                          ) ),
                      SizedBox(height: 10),
                      Text("🩸 B+"),
                      Text("📍 Sakura Medical Center"),
                      Text("⏰ 11 : 00 AM"),
                      Text("📅 01 Mar 2026"),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }


}