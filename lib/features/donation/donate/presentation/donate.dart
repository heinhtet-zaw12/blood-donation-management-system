import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/features/donation/donate/presentation/donate_submit.dart';
import 'package:blood_donation_management_system/features/donation/donate/presentation/first_donate_form.dart';
import 'package:blood_donation_management_system/features/donation/donate/presentation/second_donate_form.dart';
import 'package:blood_donation_management_system/features/donation/donate/presentation/third_donate_form.dart';
import 'package:flutter/material.dart';

class Donate extends StatefulWidget {
  const Donate({super.key});

  @override
  State<Donate> createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;


    return Scaffold(
      backgroundColor: customColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ThirdDonateForm()
        ),
      ),
    );
  }
}