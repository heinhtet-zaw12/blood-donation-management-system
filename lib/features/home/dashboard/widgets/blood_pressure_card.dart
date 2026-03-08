import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/theme_getter.dart';


class BloodPressureCard extends StatefulWidget {
  const BloodPressureCard({super.key});

  @override
  State<BloodPressureCard> createState() => _BloodPressureCardState();
}

class _BloodPressureCardState extends State<BloodPressureCard>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<int> _systolicAnimation;
  late Animation<int> _diastolicAnimation;

  final int systolic = 120;
  final int diastolic = 80;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    final curved =
    CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);

    _systolicAnimation =
        IntTween(begin: 0, end: systolic).animate(curved);

    _diastolicAnimation =
        IntTween(begin: 0, end: diastolic).animate(curved);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
      width: 240,
      height: 250,
      decoration: boxDecoration(cardColor: colorScheme.secondary, shadowColor: customColors.disabled),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Column(
            children: [
               Text(
                "Last Blood Pressure",
                style: textTheme.tabText.copyWith(
                  color: customColors.darkPrimary
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "${_systolicAnimation.value}/${_diastolicAnimation.value}",
                style: textTheme.title.copyWith(
                  color: colorScheme.primary
                ),
              ),
              Text(
                "mmHg",
                style: textTheme.bodyRegular.copyWith(
                  color: colorScheme.primary
                ),
              ),
            ],
          );
        },
      ),
    );
  }


}