import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/core/widgets/label_text_widget.dart';
import 'package:blood_donation_management_system/features/record/model/request_history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RequestHistoryCard extends StatelessWidget {
  const RequestHistoryCard({required this.data,super.key});
  final RequestHistoryModel data;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    final cardColor = data.requestStatus=="Received" ? customColors.darkPrimary : colorScheme.secondary;
    final textColor = data.requestStatus=="Received" ? colorScheme.secondary : customColors.textPrimary;
    final svgPic = data.requestStatus=="Received" ? "assets/images/complete_icon.svg" : data.requestStatus=="Rejected" ? "assets/images/reject_icon.svg" : "assets/images/cancel_icon.svg";

    return Container(
      width: double.infinity,
          decoration: boxDecoration(
            cardColor: cardColor,
            shadowColor: colorScheme.primary,
          ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
        child: Row(
          children: [
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: SizedBox(
                width: 55,
                child: buildLabel(data.bloodType, textColor!, textTheme)),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: SizedBox(
                width: 55,
                child: buildLabel("${data.units} Units", textColor, textTheme)),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: SizedBox(
                width: 70,
                child: buildLabel(data.requestStatus, textColor, textTheme)),
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