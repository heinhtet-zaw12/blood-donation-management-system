import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/core/widgets/input_decoration.dart';
import 'package:blood_donation_management_system/features/donation/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/widgets/label_text_widget.dart';

class FirstDonateForm extends StatefulWidget {
  const FirstDonateForm({super.key});

  @override
  State<FirstDonateForm> createState() => _FirstDonateFormState();
}

final _formKey = GlobalKey<FormState>();
final _usernameController = TextEditingController();
final _contactNumController = TextEditingController();
String? selectedValue;
List<String> bloodType = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

class _FirstDonateFormState extends State<FirstDonateForm> {
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
                //User name
                buildLabel("User name: ", customColors.textPrimary!, textTheme),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _usernameController,
                  style: textTheme.tabText.copyWith(
                    color: customColors.darkPrimary,
                  ),
                  decoration: buildInputDecoration(
                    context: context,
                    hintText: "Enter username",
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
                        style: textTheme.tabText.copyWith(
                          color: customColors.darkPrimary,
                        ),
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

                //Contact Number
                buildLabel(
                  "Contact Number: ",
                  customColors.textPrimary!,
                  textTheme,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _contactNumController,
                  style: textTheme.tabText.copyWith(
                    color: customColors.darkPrimary,
                  ),
                  decoration: buildInputDecoration(
                    context: context,
                    hintText: "Enter contact number",
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
