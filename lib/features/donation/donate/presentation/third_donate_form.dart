import 'package:blood_donation_management_system/core/theme/extension/bdms_colors.dart';
import 'package:blood_donation_management_system/core/theme/extension/bdms_text_theme.dart';
import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/core/widgets/label_text_widget.dart';
import 'package:blood_donation_management_system/features/donation/donate/widgets/next_button.dart';
import 'package:blood_donation_management_system/features/donation/donate/widgets/previous_button.dart';
import 'package:flutter/material.dart';

class ThirdDonateForm extends StatefulWidget {
  const ThirdDonateForm({super.key});

  @override
  State<ThirdDonateForm> createState() => _ThirdDonateFormState();
}


class _ThirdDonateFormState extends State<ThirdDonateForm> {
    List<bool?> answers = [null, null, null];

  Column DonationQuery(BDMSTextTheme textTheme, BDMSColors customColors, String labelText, String queryText){
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
      labelText,
      style: textTheme.tabText.copyWith(color: customColors.darkPrimary)
    ),
    const SizedBox(height: 10),
    
    Text(
      queryText,
      style: textTheme.bodyRegular.copyWith(color: customColors.textPrimary)
    ),
      ],
    );
}

Widget buildCheckbox(int index) {
    return Row(
      children: [
        /// YES
        Row(
          children: [
            const Text("Yes"),
            Checkbox(
              value: answers[index] == true,
              onChanged: (value) {
                setState(() {
                  answers[index] = true;
                });
              },
            ),
            
          ],
        ),
        const SizedBox(width: 15,),

        /// NO
        Row(
          children: [
            const Text("No"),
            Checkbox(
              value: answers[index] == false,
              onChanged: (value) {
                setState(() {
                  answers[index] = false;
                });
              },
            ),
            
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;

    final _formKey = GlobalKey<FormState>();
  

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
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DonationQuery(textTheme, customColors, "Date of last blood donation : ", "Have you donated blood in the past 4 months?"),
                    buildCheckbox(0),

                    const SizedBox(height: 20),
                    DonationQuery(textTheme, customColors, "Health status : ", "Are you currently sick or taking medication?"),
                    buildCheckbox(1),
                
                    const SizedBox(height: 10),
                
                    const SizedBox(height: 20),
                    DonationQuery(textTheme, customColors, "Tattoo / Surgery :", "Have you had a tatoo or surgery in the past 6 month or 1 year?"),
                    buildCheckbox(2),
                
                    const SizedBox(height: 30),
                            
                    //Next Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                      children: [
                        PreviousButton(context: context),
                        NextButton(context: context)
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
  }
}

