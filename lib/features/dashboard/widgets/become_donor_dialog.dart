import 'package:blood_donation_management_system/core/widgets/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/theme_getter.dart';

class BecomeDonorDialog extends StatefulWidget {
  const BecomeDonorDialog({super.key});

  @override
  State<BecomeDonorDialog> createState() => _BecomeDonorDialogState();
}

class _BecomeDonorDialogState extends State<BecomeDonorDialog> {

  bool confirm1 = false;
  bool confirm2 = false;

  final List<String> checklist = [
    "Age between 18-65 years",
    "Weight at least 45 kg",
    "In good general health",
    "No recent infections or illnesses",
    "Not donated blood in last 3 months"
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    return Dialog(
      backgroundColor:  Colors.transparent,
      elevation:  0,
       insetPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),

      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: colorScheme.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    "assets/images/close_icon.svg",
                    height: 20,
                    width: 20,
                    colorFilter: ColorFilter.mode(
                      customColors.darkPrimary!,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Title
               Text(
                "Become a Donor",
                style: textTheme.subTitle.copyWith(
                  color:  customColors.darkPrimary
                )
              ),
              const SizedBox(height: 10),
               Text(
                "Donor Eligibility Checklist",
                style: textTheme.tabText.copyWith(
                  color:  customColors.darkPrimary
                ),
              ),

              const SizedBox(height: 16),
              // Green checklist
              ...checklist.map((e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                     Icon(Icons.check_circle, size: 22, color: customColors.success),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        e,
                        style: textTheme.bodyRegular.copyWith(
                          color:  customColors.textPrimary,
                          fontWeight:  FontWeight.w400
                        ),
                      ),
                    ),
                  ],
                ),
              )),
              const SizedBox(height: 30),
              // Checkbox 1
              Row(
                children: [
                  Checkbox(
                    value: confirm1,
                    onChanged: (value) {
                      setState(() {
                        confirm1 = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      "I confirm that I meet all the eligibility criteria.",
                      style:  textTheme.bodyRegular.copyWith(
                        color:  customColors.darkPrimary
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height:  20,),
              // Checkbox 2
              Row(
                children: [
                  Checkbox(
                    value: confirm2,
                    onChanged: (value) {
                      setState(() {
                        confirm2 = value!;
                      });
                    },
                  ),
                   Expanded(
                    child: Text(
                      "I consent to donate blood and understand the process.",
                        style: textTheme.bodyRegular.copyWith(
                            color:  customColors.darkPrimary
                        )
                    ),
                  )
                ],
              ),

              const SizedBox(height: 40),

              // Info Box
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: customColors.darkPrimary!),
                  borderRadius: BorderRadius.circular(3),
                ),
                child:  Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Icon(Icons.info, color: Colors.green),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Once you become a donor, you cannot undo this action. "
                            "You will gain access to the Donations page and donor-specific features.",
                        style: textTheme.subTitle.copyWith(color: customColors.success),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 30),
              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child:  ElevatedButtonWidget(text: "Submit", onPressed: (){

                }, svg:  SvgPicture.asset("assets/images/submit_icon.svg",
                  height: 20,
                  width: 20,
                  colorFilter: ColorFilter.mode(
                    colorScheme.secondary,
                    BlendMode.srcIn,
                  ),
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}