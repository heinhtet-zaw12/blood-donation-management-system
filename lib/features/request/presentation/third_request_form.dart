import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/core/widgets/input_decoration.dart';
import 'package:blood_donation_management_system/core/widgets/label_text_widget.dart';
import 'package:blood_donation_management_system/features/donate/widgets/next_button.dart';
import 'package:blood_donation_management_system/features/donate/widgets/previous_button.dart';
import 'package:blood_donation_management_system/features/request/providers/request_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class ThirdRequestForm extends ConsumerStatefulWidget {
  const ThirdRequestForm({super.key});

  @override
  ConsumerState<ThirdRequestForm> createState() => _ThirdRequestFormState();
}

class _ThirdRequestFormState extends ConsumerState<ThirdRequestForm> {
  final _formKey = GlobalKey<FormState>();
    final _relationToPatientController = TextEditingController();
    final _contactNumberController = TextEditingController();
    final _reasonForRequestController = TextEditingController();

    @override
    void initState() {
      super.initState();

      final data = ref.read(requestFormProvider);
      _relationToPatientController.text = data.relationPatient ?? '';
      _contactNumberController.text = data.phone ?? '';
      _reasonForRequestController.text = data.reason ?? '';
    }

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
                          PreviousButton(context: context,
                          onPressed: () {
                              ref.read(requestStepProvider.notifier).state =
                                  RequestStep.second;
                            },
                          ),
                          NextButton(context: context,
                          onPressed: () {
                            ref.read(requestFormProvider.notifier).state =
                                ref.read(requestFormProvider).copyWith(
                                  relationPatient: _relationToPatientController.text,
                                  phone: _contactNumberController.text,
                                  reason: _reasonForRequestController.text
                            );

                            ref.read(requestStepProvider.notifier).state =
                                RequestStep.submit;
                          },
                          ),
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