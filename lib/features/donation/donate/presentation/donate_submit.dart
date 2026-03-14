import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/core/widgets/label_text_widget.dart';
import 'package:blood_donation_management_system/features/donation/donate/widgets/previous_button.dart';
import 'package:blood_donation_management_system/features/donation/donate/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DonateSubmit extends StatelessWidget {
  const DonateSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;

    return Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              decoration: boxDecoration(
                cardColor: colorScheme.secondary,
                shadowColor: colorScheme.primary,
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/tick_icon.svg'),
                    const SizedBox(height: 10),
                    buildLabel(
                        "\"Precautions for blood donors\"",
                        customColors.darkPrimary!,
                        textTheme,
                        alignment: Alignment.center
                      ),
                      buildLabel(
                        "(eg. get enough sleep) ",
                        customColors.darkPrimary!,
                        textTheme,
                        alignment: Alignment.center
                      ),
                    const SizedBox(height: 20),
                    SubmitButton(context),
                    const SizedBox(height: 20),
                    PreviousButton(context: context),
                  ],
                ),
              ),
            ),
          );
  }
}