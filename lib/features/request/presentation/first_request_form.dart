import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/core/widgets/input_decoration.dart';
import 'package:blood_donation_management_system/core/widgets/label_text_widget.dart';
import 'package:blood_donation_management_system/features/donate/widgets/next_button.dart';
import 'package:blood_donation_management_system/features/request/providers/request_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class FirstRequestForm extends ConsumerStatefulWidget {
  const FirstRequestForm({super.key});

  @override
  ConsumerState<FirstRequestForm> createState() => _FirstRequestFormState();
}

class _FirstRequestFormState extends ConsumerState<FirstRequestForm> {
  final _formKey = GlobalKey<FormState>();
    final _patientNameController = TextEditingController();
    final _hospitalNameController = TextEditingController();
    final _patientAddressController = TextEditingController();
    String? selectedValue;
    List<String> bloodType = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

    @override
    void initState() {
      super.initState();

      final data = ref.read(requestFormProvider);

      _patientNameController.text = data.name ?? '';
      _hospitalNameController.text = data.phone ?? '';
      _patientAddressController.text = data.address ?? '';
      selectedValue = data.bloodType;
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
                        child: NextButton(context: context,
                        onPressed: () {
                          ref.read(requestFormProvider.notifier).state =
                              ref.read(requestFormProvider).copyWith(
                            name: _patientNameController.text,
                            address: _patientAddressController.text,
                            hospital: _hospitalNameController.text,
                            bloodType: selectedValue,
                          );

                          ref.read(requestStepProvider.notifier).state =
                              RequestStep.second;
                        },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}