import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/core/widgets/label_text_widget.dart';
import 'package:blood_donation_management_system/features/record/data/donate_history_data.dart';
import 'package:blood_donation_management_system/features/record/widgets/donate_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DonateHistory extends StatefulWidget {
  const DonateHistory({super.key});

  @override
  State<DonateHistory> createState() => _DonateHistoryState();
}

class _DonateHistoryState extends State<DonateHistory> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;

    return Column(
      children: [
        buildLabel("History of donate", customColors.textPrimary!, textTheme),
        const SizedBox(height: 10),
        Container(
          // padding: const EdgeInsets.all(8),
          width: double.infinity,
          decoration: boxDecoration(
            cardColor: colorScheme.secondary,
            shadowColor: colorScheme.primary,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildLabel("Hospital", customColors.disabled!, textTheme),
                    buildLabel("Units", customColors.disabled!, textTheme),
                    buildLabel("Date", customColors.disabled!, textTheme),
                    buildLabel("Status", customColors.disabled!, textTheme),
                    SvgPicture.asset(
                      "assets/images/settings_icon.svg",
                      width: 18,
                    ),
                  ],
                ),
              ),
              
                ListView.builder(
                    itemCount: dummyDonateData.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    itemBuilder: (context, index){
                      final data = dummyDonateData[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 8),
                        child: DonateHistoryCard(data: data,),
                      );
                    }),
                    const SizedBox(height: 5),
            ],
            
          ),
        ),
      ],
    );
  }
}
