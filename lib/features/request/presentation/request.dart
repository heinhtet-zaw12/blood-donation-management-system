import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/features/request/presentation/first_request_form.dart';
import 'package:blood_donation_management_system/features/request/presentation/request_submit.dart';
import 'package:blood_donation_management_system/features/request/presentation/second_request_form.dart';
import 'package:blood_donation_management_system/features/request/presentation/third_request_form.dart';
import 'package:blood_donation_management_system/features/request/providers/request_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Request extends ConsumerWidget {
  const Request({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final customColors = context.colors;
    final step = ref.watch(requestStepProvider);

    Widget current;

    switch (step) {
      case RequestStep.first:
        current = const FirstRequestForm();
        break;
      case RequestStep.second:
        current = const SecondRequestForm();
        break;
      case RequestStep.third:
        current = const ThirdRequestForm();
        break;
      case RequestStep.submit:
        current = const RequestSubmit();
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
