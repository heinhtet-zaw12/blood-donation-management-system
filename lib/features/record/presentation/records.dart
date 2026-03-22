import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/core/widgets/label_text_widget.dart';
import 'package:blood_donation_management_system/features/record/widgets/donate_history.dart';
import 'package:blood_donation_management_system/features/record/widgets/request_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Records extends StatelessWidget {
  const Records({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;

    return Scaffold(
      backgroundColor: customColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                DonateHistory(),
                const SizedBox(height: 50,),
                RequestHistory()
              ],
            )
          ),
        ),
      ),
    );
  }
}
