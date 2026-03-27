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

class SecondRequestForm extends ConsumerStatefulWidget {
  const SecondRequestForm({super.key});

  @override
  ConsumerState<SecondRequestForm> createState() => _SecondRequestFormState();
}

class _SecondRequestFormState extends ConsumerState<SecondRequestForm> {
  

    final _formKey = GlobalKey<FormState>();
    final _numberOfUnitsController = TextEditingController();
    final TextEditingController _dateController = TextEditingController();
    DateTime? selectedDate;
    bool? isEmergency;

    @override
    void initState() {
      super.initState();

      final data = ref.read(requestFormProvider);
      _numberOfUnitsController.text = data.unit ?? '';
      isEmergency = data.isEmergencyRequest ?? false;
      _dateController.text = data.date ?? '';
    }

    Future<void> _selectDate(BuildContext context) async {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );

      if (pickedDate != null) {
        setState(() {
          selectedDate = pickedDate;
          _dateController.text =
              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
        });
      }
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
                //Number of Units
                buildLabel(
                  "Number of Units: ",
                  customColors.textPrimary!,
                  textTheme,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _numberOfUnitsController,
                  style: textTheme.tabText.copyWith(
                    color: customColors.darkPrimary,
                  ),
                  decoration: buildInputDecoration(
                    context: context,
                    hintText: "Enter Number of Units",
                    svg: SvgPicture.asset(
                      "assets/images/Edit_icon.svg",
                      width: 18,
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                //Date
                buildLabel("Date: ", customColors.textPrimary!, textTheme),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _dateController,
                  readOnly: true,
                  onTap: () {
                    _selectDate(context);
                  },
                  style: textTheme.tabText.copyWith(
                    color: customColors.darkPrimary,
                  ),
                  decoration: buildInputDecoration(
                    context: context,
                    hintText: "dd/mm/yy",
                    svg: SvgPicture.asset(
                      "assets/images/calender_icon1.svg",
                      width: 18,
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                "Is it an emergency or a pre-booked surgery date?",
                style: textTheme.tabText.copyWith(color: customColors.textPrimary)
              ),
                
                Row(
                  children: [
                    Row(
                      children: [
                        const Text("Emergency"),
                        Checkbox(
                          value: isEmergency == true,
                          onChanged: (value) {
                            setState(() {
                              isEmergency = true;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(width: 15),

                    /// NO
                    Row(
                      children: [
                        const Text("Pre-booked"),
                        Checkbox(
                          value: isEmergency == false,
                          onChanged: (value) {
                            setState(() {
                              isEmergency = false;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                //Previous and Next Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PreviousButton(context: context,
                    onPressed: () {
                              ref.read(requestStepProvider.notifier).state =
                                  RequestStep.first;
                            },
                    ),
                    NextButton(context: context,
                    onPressed: () {
                            ref.read(requestFormProvider.notifier).state =
                                ref.read(requestFormProvider).copyWith(
                              unit: _numberOfUnitsController.text,
                              isEmergencyRequest: isEmergency,
                              date: _dateController.text,
                            );

                            ref.read(requestStepProvider.notifier).state =
                                RequestStep.third;
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
