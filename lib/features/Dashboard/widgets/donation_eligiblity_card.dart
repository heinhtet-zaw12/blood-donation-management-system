import 'dart:math';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/features/Dashboard/widgets/arc_painter.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/theme_getter.dart';

class DonationEligibilityCard extends StatefulWidget {
  const DonationEligibilityCard({super.key});

  @override
  State<DonationEligibilityCard> createState() =>
      _DonationEligibilityCardState();
}

class _DonationEligibilityCardState
    extends State<DonationEligibilityCard>
    with SingleTickerProviderStateMixin {

  static const primaryRed = Color(0xffFF2D3A);
  static const darkRed = Color(0xff7A0000);

  late AnimationController _controller;
  late Animation<double> _progressAnimation;
  late Animation<int> _countAnimation;

  final int totalDays = 85;
  final double percent = 0.75;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    final curved =
    CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);

    _progressAnimation = Tween<double>(
      begin: 0,
      end: percent,
    ).animate(curved);

    _countAnimation = IntTween(
      begin: 0,
      end: totalDays,
    ).animate(curved);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    return Container(
      padding: const EdgeInsets.all(24),
      height: 346,
      decoration:  boxDecoration(cardColor: themeData.colorScheme.secondary, shadowColor: themeData.colorScheme.primary),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.ice_skating),
              SizedBox(width: 10),
              Text(
                "Next Donation Eligibility",
                style: textTheme.tabText.copyWith(color: customColors.darkPrimary),
              ),
            ],
          ),
          SizedBox(
            width: 230,
            height: 230,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: const Size(158, 158),
                      painter: ArcPainter(
                        progress: _progressAnimation.value,
                      ),
                    ),

                    /// Center Text
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 5,),
                        Text(
                          _countAnimation.value.toString(),
                          style: textTheme.title.copyWith(
                            color: themeData.colorScheme.primary
                          ),
                        ),
                        Text(
                          "Days",
                          style: textTheme.tabText.copyWith(
                            color: customColors.darkPrimary
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _legend(customColors.disabled, "Days Left"),
              const SizedBox(width: 30),
              _legend(const Color(0xffFF2D3A), "Days Spent"),
            ],
          )
        ],
      ),
    );
  }
  Widget _legend(Color? color, String text) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 6,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}