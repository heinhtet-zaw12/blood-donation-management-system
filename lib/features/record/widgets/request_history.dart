import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/core/widgets/label_text_widget.dart';
import 'package:blood_donation_management_system/features/record/data/request_history_data.dart';
import 'package:blood_donation_management_system/features/record/widgets/request_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RequestHistory extends StatefulWidget {
  const RequestHistory({super.key});

  @override
  State<RequestHistory> createState() => _RequestHistoryState();
}

class _RequestHistoryState extends State<RequestHistory> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;

    return Column(
      children: [
        buildLabel("History of request", customColors.textPrimary!, textTheme),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          decoration: boxDecoration(
            cardColor: colorScheme.secondary,
            shadowColor: colorScheme.primary,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildLabel("Type", customColors.disabled!, textTheme),
                    buildLabel("Units", customColors.disabled!, textTheme),
                    buildLabel("Status", customColors.disabled!, textTheme),
                    SvgPicture.asset(
                      "assets/images/settings_icon.svg",
                      width: 18,
                    ),
                  ],
                ),
              ),
              ListView.builder(
                    itemCount: dummyRequestData.length,
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                      final data = dummyRequestData[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 8),
                        child: RequestHistoryCard(data: data,),
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