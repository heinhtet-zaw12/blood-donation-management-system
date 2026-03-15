import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/core/widgets/input_decoration.dart';
import 'package:blood_donation_management_system/core/widgets/label_text_widget.dart';
import 'package:blood_donation_management_system/features/donation/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FirstRequestForm extends StatefulWidget {
  const FirstRequestForm({super.key});

  @override
  State<FirstRequestForm> createState() => _FirstRequestFormState();
}

class _FirstRequestFormState extends State<FirstRequestForm> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;

    final _formKey = GlobalKey<FormState>();
    final _patientNameController = TextEditingController();
    final _hospitalNameController = TextEditingController();
    final _patientAddressController = TextEditingController();
    String? selectedValue;
    List<String> bloodType = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

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
                      //Patient name
                      buildLabel(
                        "Patient name: ",
                        customColors.textPrimary!,
                        textTheme,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _patientNameController,
                        style: textTheme.tabText.copyWith(color: customColors.darkPrimary),
                        decoration: buildInputDecoration(
                          context: context,
                          hintText: "Enter Patient Name",
                          svg: SvgPicture.asset(
                            "assets/images/Edit_icon.svg",
                            width: 18,
                          ),
                        ),
                      ),
            
                      const SizedBox(height: 15),
            
                      //Blood Type
                      buildLabel(
                        "Blood-type: ",
                        customColors.textPrimary!,
                        textTheme,
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        value: selectedValue,
                        items: bloodType.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: textTheme.tabText.copyWith(color: customColors.darkPrimary),
                            ),
                          );
                        }).toList(),
                        decoration: buildInputDecoration(
                          context: context,
                          hintText: "Choose Blood Type",
                          svg: SvgPicture.asset(
                            "assets/images/drop_down.svg",
                            width: 16,
                          ),
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            selectedValue = newValue;
                          });
                        },
                      ),
            
                      const SizedBox(height: 15),
            
                      //Hospital Name
                      buildLabel(
                        "Hospital name: ",
                        customColors.textPrimary!,
                        textTheme,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _hospitalNameController,
                        style: textTheme.tabText.copyWith(color: customColors.darkPrimary),
                        decoration: buildInputDecoration(
                          context: context,
                          hintText: "Enter Hospital Name",
                          svg: SvgPicture.asset(
                            "assets/images/Edit_icon.svg",
                            width: 18,
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),
            
                      //Address
                      buildLabel(
                        "Address: ",
                        customColors.textPrimary!,
                        textTheme,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _patientAddressController,
                        style: textTheme.tabText.copyWith(color: customColors.darkPrimary),
                        decoration: buildInputDecoration(
                          context: context,
                          hintText: "Enter Address",
                          svg: SvgPicture.asset(
                            "assets/images/Edit_icon.svg",
                            width: 18,
                          ),
                        ),
                      ),
            
                      const SizedBox(height: 30),

                      //Next Button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 75),
                        child: NextButton(context: context),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}