import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/theme_getter.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 352,
          height: 232,
          decoration:  boxDecoration(cardColor: colorScheme.secondary, shadowColor: customColors.disabled),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  const EdgeInsets.only(top: 30, left: 35, bottom: 15),
                child: Text("Donate Appointment",style: textTheme.tabText.copyWith(color: customColors.darkPrimary),),
              ),
              Center(
                child: Container(
                  width: 282,
                  height: 135,
                  decoration:  boxDecoration(cardColor: customColors.background, shadowColor: customColors.disabled),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                          children: [
                          Text("Asia Royal Hosiptal",style: textTheme.tabText.copyWith(
                            color: customColors.textPrimary
                          ),),
                          SvgPicture.asset(
                            "assets/images/dot_icon.svg",
                            height: 16,
                            width: 4,
                            colorFilter: ColorFilter.mode(
                              customColors.darkPrimary!,
                              BlendMode.srcIn,
                            ),
                          )
                        ],),
                      ),
                      SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text("11 : 00 AM", style:  textTheme.tabText.copyWith(
                          color: customColors.textPrimary
                        ),),
                      ),
                      SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text("21 MAR 2026", style:  textTheme.tabText.copyWith(
                            color: customColors.textPrimary
                        ),),
                      ),
                      SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Text("Pending",style: textTheme.tabText.copyWith(
                                color: customColors.textPrimary
                            ),),
                            SvgPicture.asset(
                              "assets/images/time_icon.svg",
                              height: 16,
                              width: 4,
                              colorFilter: ColorFilter.mode(
                                customColors.darkPrimary!,
                                BlendMode.srcIn,
                              ),
                            )
                          ],),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30,),
        Container(
          width: 352,
          height: 232,
          decoration:  boxDecoration(cardColor: colorScheme.secondary, shadowColor: customColors.disabled),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  const EdgeInsets.only(top: 30, left: 35,bottom: 30),
                child: Text("Request Appointment",style: textTheme.tabText.copyWith(color: customColors.darkPrimary),),
              ),
             Padding(
               padding: const EdgeInsets.only(top: 20),
               child: Center(
                    child: Text("No appointments found", style: textTheme.bodyRegular.copyWith(color: customColors.disabled,
                    ),),
                  ),
             ),

            ],
          ),
        ),
      ],
    );
  }
}
