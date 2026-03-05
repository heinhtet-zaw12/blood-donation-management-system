import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/theme_getter.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  static const Color primaryRed = Color(0xffFF2D3A);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    return Container(
      padding: const EdgeInsets.all(16),
      width: 399,
      height: 250,
      decoration: boxDecoration(cardColor: themeData.colorScheme.secondary, shadowColor: themeData.colorScheme.primary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Text("Upcoming Appointments",
              style: textTheme.tabText.copyWith(
                color: customColors.darkPrimary
              )),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 120,
                height: 159,
                decoration: boxDecoration(cardColor: themeData.colorScheme.primary, shadowColor: themeData.colorScheme.primary),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("2",
                        style: textTheme.title.copyWith(
                          color: themeData.colorScheme.secondary
                        )),
                    Text("MAR", style: textTheme.bodyRegular.copyWith(
                      color: themeData.colorScheme.secondary
                    ))
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Blood-donation",
                        style: textTheme.bodyRegular.copyWith(
                          color: customColors.darkPrimary
                        )),
                    SizedBox(height: 8),
                    Text("⏰ 11 : 00 AM"),
                    Text("📍 Sakura Medical Center"),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}