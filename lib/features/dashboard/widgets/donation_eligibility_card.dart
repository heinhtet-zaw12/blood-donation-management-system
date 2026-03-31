import 'dart:math';
import 'package:blood_donation_management_system/core/theme/extension/bdms_text_theme.dart';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/features/dashboard/presentation/provider/dashboard_provier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/theme_getter.dart';
import 'arc_painter.dart';



class DonationEligibilityCard extends ConsumerStatefulWidget {
  const DonationEligibilityCard({super.key});

  @override
  ConsumerState<DonationEligibilityCard> createState() =>
      _DonationEligibilityCardState();
}

class _DonationEligibilityCardState
    extends ConsumerState<DonationEligibilityCard>
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
    final colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    final remainingDays = ref.watch(dashboardNotifierProvider.select((state)=> state.dashboardDataModel?.data?.donationStatus?.daysRemaining));

    return Container(
      padding: const EdgeInsets.all(24),
      height: 346,
      decoration:  boxDecoration(cardColor:colorScheme.secondary, shadowColor: customColors.disabled),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 20,
                child: SvgPicture.asset(
                  "assets/images/time_icon.svg",
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    customColors.darkPrimary!,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              SizedBox(width: 8),
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
                            color: colorScheme.primary
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
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _legend(customColors.disabled, "Days Left" , customColors.textPrimary ,textTheme ),
              const SizedBox(width: 30),
              _legend(const Color(0xffFF2D3A), "Days Spent" , customColors.textPrimary , textTheme),
            ],
          )
        ],
      ),
    );
  }
  Widget _legend(Color? color, String text , Color? textColor ,BDMSTextTheme textTheme ) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 5,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: textTheme.bodyRegular.copyWith(
            color:  textColor
          ),
        )
      ],
    );
  }
}