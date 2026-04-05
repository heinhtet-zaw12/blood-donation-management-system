import 'package:blood_donation_management_system/core/storage/app_storage.dart';
import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/core/widgets/input_decoration.dart';
import 'package:blood_donation_management_system/features/donate/presentation/providers/donate_provider.dart';
import 'package:blood_donation_management_system/features/donate/widgets/next_button.dart';
import 'package:blood_donation_management_system/features/donor/presentation/provider/donor_provider.dart';
import 'package:blood_donation_management_system/features/profile/presentation/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

import '../../../core/widgets/label_text_widget.dart';

class FirstDonateForm extends ConsumerStatefulWidget {
  const FirstDonateForm({super.key});

  @override
  ConsumerState<FirstDonateForm> createState() =>
      _FirstDonateFormState();
}



class _FirstDonateFormState extends ConsumerState<FirstDonateForm> {

final _formKey = GlobalKey<FormState>();
final _usernameController = TextEditingController();
final _contactNumController = TextEditingController();
String? selectedValue;
AppStorage storage = GetIt.I.get<AppStorage>();
String? userId;
List<String> bloodType = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

  @override
void initState() {
  super.initState();
  getUser();
}

 void getUser () async{
  userId = await storage.getUserId();
  //user profile
  if(userId != null) ref.read(userProfileNotifierProvider.notifier).getProfile();
  //donor profile
  if(userId != null) ref.read(donorProfileNotifierProvider.notifier).getDonorProfile(userId: userId!);
 }
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;

    final userState = ref.watch(userProfileNotifierProvider);
    final donorState = ref.watch(donorProfileNotifierProvider);

    if (userState.isLoading || donorState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final username = userState.userProfileModel?.data?.userName ?? '';
    final bloodGroup = userState.userProfileModel?.data?.donorInfo?.bloodGroup ?? '';
    final emergencyPhone = userState.userProfileModel?.data?.donorInfo?.emergencyPhone ?? '';

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
                  controller: TextEditingController(text: username),
                  readOnly: true,
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
                TextFormField(
                  controller: TextEditingController(text: bloodGroup),
                  readOnly: true,
                  style: textTheme.tabText.copyWith(
                    color: customColors.darkPrimary,
                  ),
                  decoration: buildInputDecoration(
                    context: context,
                    hintText: "Enter blood Group",
                    svg: SvgPicture.asset(
                      "assets/images/Edit_icon.svg",
                      width: 18,
                    ),
                  ),
                ),
                // DropdownButtonFormField<String>(
                //   value: selectedValue,
                //   items: bloodType.map((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(
                //         value,
                //         style: textTheme.tabText.copyWith(
                //           color: customColors.darkPrimary,
                //         ),
                //       ),
                //     );
                //   }).toList(),
                //   decoration: buildInputDecoration(
                //     context: context,
                //     hintText: "Choose Blood Type",
                //     svg: SvgPicture.asset(
                //       "assets/images/drop_down.svg",
                //       width: 16,
                //     ),
                //   ),
                //   onChanged: (newValue) {
                //     setState(() {
                //       selectedValue = newValue;
                //     });
                //   },
                // ),


                const SizedBox(height: 15),

                //Contact Number
                buildLabel(
                  "Contact Number: ",
                  customColors.textPrimary!,
                  textTheme,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: TextEditingController(text: emergencyPhone),
                  readOnly: true,
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
                  child: NextButton(context: context,
                  onPressed: () {

                    ref.read(donateStepProvider.notifier).state =
                        DonateStep.second;
                  },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
