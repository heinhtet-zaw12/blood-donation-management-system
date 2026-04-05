import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/core/widgets/label_text_widget.dart';
import 'package:blood_donation_management_system/features/donate/presentation/providers/donate_provider.dart';
import 'package:blood_donation_management_system/features/donate/widgets/previous_button.dart';
import 'package:blood_donation_management_system/features/donate/widgets/submit_button.dart';
import 'package:blood_donation_management_system/features/profile/presentation/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:blood_donation_management_system/core/storage/app_storage.dart';
import 'package:get_it/get_it.dart';

class DonateSubmit extends ConsumerStatefulWidget {
  const DonateSubmit({super.key});

  @override
  ConsumerState<DonateSubmit> createState() => _DonateSubmitState();
}

class _DonateSubmitState extends ConsumerState<DonateSubmit> {
  String? userId;
  AppStorage storage = GetIt.I.get<AppStorage>();

  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser () async{
  userId = await storage.getUserId();
  if(userId != null) ref.read(userProfileNotifierProvider.notifier).getProfile(userId: userId!);
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;

    final submitState = ref.watch(donateNotifierProvider);

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/tick_icon.svg'),
              const SizedBox(height: 10),
              buildLabel(
                "\"Precautions for blood donors\"",
                customColors.darkPrimary!,
                textTheme,
                alignment: Alignment.center,
              ),
              buildLabel(
                "(eg. get enough sleep)",
                customColors.darkPrimary!,
                textTheme,
                alignment: Alignment.center,
              ),
              const SizedBox(height: 20),

              
                SubmitButton(
                  context,
                  onPressed: () {
                    if (userId != null) {
                      ref.read(donateNotifierProvider.notifier).submitDonation(
                            userId: userId!,
                          );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("User ID not found")),
                      );
                    }
                  },
                ),

              const SizedBox(height: 20),

              if (submitState.isSuccess)
                Text(
                  "Donation submitted successfully!",
                  style: textTheme.bodyRegular.copyWith(color: Colors.green),
                ),
              if (submitState.isFailed)
                Text(
                  "Failed to submit donation. Try again.",
                  style: textTheme.bodyRegular.copyWith(color: Colors.red),
                ),

              const SizedBox(height: 20),
              PreviousButton(
                context: context,
                onPressed: () {
                  ref.read(donateStepProvider.notifier).state = DonateStep.second;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}