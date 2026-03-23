import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/core/widgets/input_decoration.dart';
import 'package:blood_donation_management_system/core/widgets/label_text_widget.dart';
import 'package:blood_donation_management_system/features/donation/widgets/next_button.dart';
import 'package:blood_donation_management_system/features/donation/widgets/previous_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ThirdRequestForm extends StatefulWidget {
  const ThirdRequestForm({super.key});

  @override
  State<ThirdRequestForm> createState() => _ThirdRequestFormState();
}

class _ThirdRequestFormState extends State<ThirdRequestForm> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;

    final _formKey = GlobalKey<FormState>();
    final _relationToPatientController = TextEditingController();
    final _contactNumberController = TextEditingController();
    final _reasonForRequestController = TextEditingController();

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
            
                //Form
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //Relationship to patient
                      buildLabel(
                        "Relationship to patient : ",
                        customColors.textPrimary!,
                        textTheme,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _relationToPatientController,
                        style: textTheme.tabText.copyWith(color: customColors.darkPrimary),
                        decoration: buildInputDecoration(
                          context: context,
                          hintText: "Enter Your Relationship to Patient",
                          svg: SvgPicture.asset(
                            "assets/images/Edit_icon.svg",
                            width: 18,
                          ),
                        ),
                      ),
            
                      const SizedBox(height: 15),
            
                      //Contact number
                      buildLabel(
                        "Contact number : ",
                        customColors.textPrimary!,
                        textTheme,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _contactNumberController,
                        style: textTheme.tabText.copyWith(color: customColors.darkPrimary),
                        decoration: buildInputDecoration(
                          context: context,
                          hintText: "Enter Contact Number",
                          svg: SvgPicture.asset(
                            "assets/images/Edit_icon.svg",
                            width: 18,
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),
            
                      //Reason for request
                      buildLabel(
                        "Reason for request :",
                        customColors.textPrimary!,
                        textTheme,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _reasonForRequestController,
                        style: textTheme.tabText.copyWith(color: customColors.darkPrimary),
                        decoration: buildInputDecoration(
                          context: context,
                          hintText: "Enter Reason for request",
                          svg: SvgPicture.asset(
                            "assets/images/Edit_icon.svg",
                            width: 18,
                          ),
                        ),
                      ),
            
                      const SizedBox(height: 30),

                      //Previous & Next Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PreviousButton(context: context),
                          NextButton(context: context),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}