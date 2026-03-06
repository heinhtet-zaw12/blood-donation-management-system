import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/theme_getter.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    return Container(
      padding: const EdgeInsets.all(16),
      width: 399,
      height: 250,
      decoration: boxDecoration(cardColor: themeData.colorScheme.secondary, shadowColor: themeData.colorScheme.primary),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Text("Upcoming Appointments",
                style: textTheme.tabText.copyWith(
                  color: customColors.darkPrimary
                )),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 120,
                  height: 159,
                  decoration: boxDecoration(cardColor: themeData.colorScheme.primary, shadowColor: themeData.colorScheme.primary),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("2",
                          style: textTheme.title.copyWith(
                            color: themeData.colorScheme.secondary
                          )),
                      Text("MAR", style: textTheme.bodyRegular.copyWith(
                        color: themeData.colorScheme.secondary
                      ))
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Blood-donation",
                          style: textTheme.bodyRegular.copyWith(
                            color: customColors.darkPrimary
                          )),
                      SizedBox(height: 8),
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
                          SizedBox(width: 8,),
                          Expanded(child: Text("11 : 00 AM", style: textTheme.tabText.copyWith(color: customColors.darkPrimary),)),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                            child: SvgPicture.asset(
                              "assets/images/location_icon.svg",
                              height: 20,
                              colorFilter: ColorFilter.mode(
                                customColors.darkPrimary!,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Text("Sakura Medical Center",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.tabText.copyWith(color: customColors.darkPrimary),),
                          ),

                        ],
                      ),


                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}