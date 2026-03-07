import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/core/widgets/app_bar.dart';
import 'package:blood_donation_management_system/core/widgets/elevated_button_widget.dart';
import 'package:blood_donation_management_system/features/home/dashboard/widgets/blood_availability_card.dart';
import 'package:blood_donation_management_system/features/home/dashboard/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({super.key, this.logo, this.barIcon});
  final String? logo;
  final String? barIcon;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    return Scaffold(
      backgroundColor: customColors.background,
      appBar: AppBarWidget(logo: "assets/images/Logo_white.svg", barIcon: "assets/images/bars_white_icon.svg",bgColor: colorScheme.primary,),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                "\"One person's blood donation, hope for many lives\"",
                textAlign: TextAlign.center,
                style: textTheme.subTitle.copyWith(
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Your single donation can save up to three lives. Join our community of heroes today.",
                textAlign: TextAlign.center,
                style: textTheme.tabText.copyWith(color: colorScheme.primary),
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 58,
                width: 165,
                child: ElevatedButtonWidget(text: "Donate", onPressed: (){},
                svg: SvgPicture.asset(
                      "assets/images/donate_icon.svg",
                      width: 20,
                      colorFilter: ColorFilter.mode(colorScheme.secondary,BlendMode.srcIn ),
                    ),
                    textStyle: textTheme.subTitle,
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 58,
                width: 165,
                child: ElevatedButtonWidget(text: "Request", onPressed: (){},
                svg: SvgPicture.asset(
                      "assets/images/request_icon.svg",
                      width: 20,
                      colorFilter: ColorFilter.mode(colorScheme.secondary,BlendMode.srcIn ),
                    ),
                    textStyle: textTheme.subTitle,
                ),
              ),
              const SizedBox(height: 40),
              Text(
                "Our Impact",
                style: textTheme.subTitle.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 15),
              Text(
                "Making a difference in our community",
                textAlign: TextAlign.center,
                style: textTheme.tabText.copyWith(color: customColors.darkPrimary),
              ),
              const SizedBox(height: 15),
              HomeCard(),
                  ],
                ),
                ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
                color: customColors.darkPrimary,
                child: Column(
                  children: [
                    Text(
                      "Blood Availability",
                      textAlign: TextAlign.center,
                      style: textTheme.subTitle.copyWith(color: customColors.background),
                    ),
                    Text(
                      "Current blood stock levels",
                      textAlign: TextAlign.center,
                      style: textTheme.tabText.copyWith(color: customColors.background),
                    ),
                    const SizedBox(height: 30,),
                    BloodAvailabilityCard()
                  ],
                ))
            ],
          ),
        ),
      ),
    );
  }
}
