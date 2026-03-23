import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/features/donation/presentation/third_donate_form.dart';
import 'package:blood_donation_management_system/features/request/presentation/first_request_form.dart';
import 'package:blood_donation_management_system/features/request/presentation/request_submit.dart';
import 'package:blood_donation_management_system/features/request/presentation/second_request_form.dart';
import 'package:blood_donation_management_system/features/request/presentation/third_request_form.dart';
import 'package:flutter/material.dart';

class Request extends StatelessWidget {
  const Request({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;


    return Scaffold(
      backgroundColor: customColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: RequestSubmit()
          
        ),
      ),
    );
  }
}
