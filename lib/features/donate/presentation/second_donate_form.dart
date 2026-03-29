import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/core/widgets/input_decoration.dart';
import 'package:blood_donation_management_system/core/widgets/label_text_widget.dart';
import 'package:blood_donation_management_system/features/donate/presentation/providers/donate_provider.dart';
import 'package:blood_donation_management_system/features/donate/widgets/next_button.dart';
import 'package:blood_donation_management_system/features/donate/widgets/previous_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class SecondDonateForm extends ConsumerStatefulWidget {
  const SecondDonateForm({super.key});

  @override
  ConsumerState<SecondDonateForm> createState() => _SecondDonateFormState();
}

class _SecondDonateFormState extends ConsumerState<SecondDonateForm> {
  final _formKey = GlobalKey<FormState>();
    final _hospitalNameController = TextEditingController();
    final TextEditingController _dateController = TextEditingController();
    DateTime? selectedDate;
    String? selectedValue;
    List<String> timeSlot = ['9 : 00 AM', '10 : 00 AM', '11 : 00 AM', '1 : 00 PM', '2 : 00 PM', '3 : 00 PM', '4 : 00 PM'];

    @override
    void initState() {
      super.initState();

      final data = ref.read(donateFormProvider);

      _hospitalNameController.text = data.hospital ?? '';
      _dateController.text = data.date ?? '';
      selectedValue = data.time;
    }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;

    

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
                      //Preferred Date
                      buildLabel(
                        "Preferred date: ",
                        customColors.textPrimary!,
                        textTheme,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _dateController,
                        readOnly: true,
                          onTap: () {
                            _selectDate(context);
                          },
                        style: textTheme.tabText.copyWith(color: customColors.darkPrimary),
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
            
                      //Blood Type
                      buildLabel(
                        "Preferred Time: ",
                        customColors.textPrimary!,
                        textTheme,
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        value: selectedValue,
                        items: timeSlot.map((String value) {
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
                          hintText: "Choose Preferred Time",
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
                        "Hospital: ",
                        customColors.textPrimary!,
                        textTheme,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _hospitalNameController,
                        style: textTheme.tabText.copyWith(color: customColors.darkPrimary),
                        decoration: buildInputDecoration(
                          context: context,
                          hintText: "Enter hospital name",
                          svg: SvgPicture.asset(
                            "assets/images/Edit_icon.svg",
                            width: 18,
                          ),
                        ),
                      ),
            
                      const SizedBox(height: 30),
            
                      //Previous and Next Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                        children: [
                          PreviousButton(context: context,
                          onPressed: () {
                              ref.read(donateStepProvider.notifier).state =
                                  DonateStep.first;
                            },
                          ),
                          NextButton(context: context, 
                          onPressed: () {
                            ref.read(donateFormProvider.notifier).state =
                                ref.read(donateFormProvider).copyWith(
                              hospital: _hospitalNameController.text,
                              date: _dateController.text,
                              time: selectedValue,
                            );

                            // ref.read(donateStepProvider.notifier).state =
                            //     DonateStep.third;

                            ref.read(donateStepProvider.notifier).state =
                                DonateStep.submit;
                          },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}