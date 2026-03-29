import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/features/donate/presentation/donate_submit.dart';
import 'package:blood_donation_management_system/features/donate/presentation/first_donate_form.dart';
import 'package:blood_donation_management_system/features/donate/presentation/second_donate_form.dart';
import 'package:blood_donation_management_system/features/donate/presentation/third_donate_form.dart';
import 'package:blood_donation_management_system/features/donate/presentation/providers/donate_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Donate extends ConsumerWidget {
  const Donate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customColors = context.colors;
    final step = ref.watch(donateStepProvider);

    Widget current;

    switch (step) {
      case DonateStep.first:
        current = const FirstDonateForm();
        break;
      case DonateStep.second:
        current = const SecondDonateForm();
        break;
      case DonateStep.third:
        current = const ThirdDonateForm();
        break;
      case DonateStep.submit:
        current = const DonateSubmit();
        break;
    }

    return Scaffold(
      backgroundColor: customColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: current
        ),
      ),
    );
  }
}