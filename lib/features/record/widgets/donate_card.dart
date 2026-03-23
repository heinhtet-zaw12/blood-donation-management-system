import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/core/widgets/label_text_widget.dart';
import 'package:blood_donation_management_system/features/record/model/donate_history_model.dart';
import 'package:blood_donation_management_system/features/record/widgets/ellipsis_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class DonateHistoryCard extends StatelessWidget {
  const DonateHistoryCard({required this.data,super.key});
  final DonateHistoryModel data;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    final cardColor = data.donateStatus=="Completed" ? customColors.darkPrimary : colorScheme.secondary;
    final textColor = data.donateStatus=="Completed" ? colorScheme.secondary : customColors.textPrimary;
    final date = DateFormat("d/M/yyyy").format(data.dateTime);
    final svgPic = data.donateStatus=="Completed" ? "assets/images/complete_icon.svg" : data.donateStatus=="Rejected" ? "assets/images/reject_icon.svg" : "assets/images/cancel_icon.svg";

    return Container(
      width: double.infinity,
          decoration: boxDecoration(
            cardColor: cardColor,
            shadowColor: colorScheme.primary,
          ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: SizedBox(
                width: 75,
                child: EllipsisLabel(data.hospital, textColor!, textTheme)),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: SizedBox(
                width: 55,
                child: buildLabel("${data.units} Units", textColor, textTheme)),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: SizedBox(
                width: 72,
                child: buildLabel(date, textColor, textTheme)),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: SizedBox(
                width: 50,
                child: EllipsisLabel(data.donateStatus, textColor, textTheme)),
            ),
            
            SvgPicture.asset(
                      svgPic,
                      width: 20,
                    ),
          ],
        ),
      ),
    );
  }
}