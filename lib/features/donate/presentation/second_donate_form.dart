import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/core/widgets/input_decoration.dart';
import 'package:blood_donation_management_system/core/widgets/label_text_widget.dart';
import 'package:blood_donation_management_system/features/donate/presentation/providers/donate_provider.dart';
import 'package:blood_donation_management_system/features/donate/presentation/providers/hospital_provider.dart';
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
  final TextEditingController _dateController = TextEditingController();
  DateTime? selectedDate;

  String? selectedTime;
  int? selectedHospitalId;

  List<String> timeSlot = [
    '9 : 00 AM',
    '10 : 00 AM',
    '11 : 00 AM',
    '1 : 00 PM',
    '2 : 00 PM',
    '3 : 00 PM',
    '4 : 00 PM'
  ];

  @override
  void initState() {
    super.initState();
    final form = ref.read(donateFormProvider);
    _dateController.text = form.donationDate ?? '';
    selectedTime = form.donationTime;
    selectedHospitalId = form.hospitalId;
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
    final colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;

    final hospitalsAsync = ref.watch(hospitalListProvider);

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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Preferred Date
                buildLabel("Preferred date: ", customColors.textPrimary!, textTheme),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _dateController,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  style: textTheme.tabText.copyWith(color: customColors.darkPrimary),
                  decoration: buildInputDecoration(
                    context: context,
                    hintText: "dd/mm/yy",
                    svg: SvgPicture.asset("assets/images/calender_icon1.svg", width: 18),
                  ),
                ),

                const SizedBox(height: 15),

                // Preferred Time
                buildLabel("Preferred Time: ", customColors.textPrimary!, textTheme),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: selectedTime,
                  items: timeSlot.map((time) {
                    return DropdownMenuItem<String>(
                      value: time,
                      child: Text(time, style: textTheme.tabText.copyWith(color: customColors.darkPrimary)),
                    );
                  }).toList(),
                  decoration: buildInputDecoration(
                    context: context,
                    hintText: "Choose Preferred Time",
                    svg: SvgPicture.asset("assets/images/drop_down.svg", width: 16),
                  ),
                  onChanged: (value) {
                    setState(() => selectedTime = value);
                  },
                ),

                const SizedBox(height: 15),

                // Hospital Selection
                buildLabel("Hospital: ", customColors.textPrimary!, textTheme),
                const SizedBox(height: 10),
                hospitalsAsync.when(
                  data: (hospitals) {
                    return DropdownButtonFormField<int>(
                      value: selectedHospitalId,
                      items: hospitals.map((hospital) {
                        return DropdownMenuItem<int>(
                          value: hospital.id,
                          child: Text(hospital.name!, style: textTheme.tabText.copyWith(color: customColors.darkPrimary)),
                        );
                      }).toList(),
                      decoration: buildInputDecoration(
                        context: context,
                        hintText: 'Select Hospital',
                        svg: SvgPicture.asset("assets/images/drop_down.svg", width: 16),
                      ),
                      onChanged: (value) {
                        setState(() => selectedHospitalId = value);
                      },
                    );
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (err, _) => Text("Failed to load hospitals"),
                ),

                const SizedBox(height: 30),

                // Previous & Next Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PreviousButton(
                      context: context,
                      onPressed: () {
                        ref.read(donateStepProvider.notifier).state = DonateStep.first;
                      },
                    ),
                    NextButton(
                      context: context,
                      onPressed: () {
                        ref.read(donateFormProvider.notifier).state =
                            ref.read(donateFormProvider).copyWith(
                              donationDate: _dateController.text,
                              hospitalId: selectedHospitalId,
                            );

                        ref.read(donateStepProvider.notifier).state = DonateStep.submit;
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