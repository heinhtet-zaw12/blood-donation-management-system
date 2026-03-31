import 'package:blood_donation_management_system/core/utils/date_formatter.dart';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/features/dashboard/presentation/provider/dashboard_provier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/theme_getter.dart';


class UrgentRequestCard extends ConsumerWidget {
  const UrgentRequestCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    final dashboardData = ref.watch(dashboardNotifierProvider);
    final urgentRequestData = dashboardData.dashboardDataModel?.data?.urgentBloodRequest;

    return (urgentRequestData != null)? Container(
      padding: const EdgeInsets.all(16),
      height: 274,
      width: 382,
      decoration: boxDecoration(cardColor: colorScheme.secondary, shadowColor: customColors.disabled),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
             Row(
              children: [
                Icon(Icons.warning, color: customColors.darkPrimary,
                size: 18,
                ),
                const SizedBox(width: 8),
                Text(
                  "Urgent Blood Requests",
                  style: textTheme.tabText.copyWith(
                    color:  customColors.darkPrimary,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  width: 120,
                  height: 159,
                  decoration: boxDecoration(cardColor:colorScheme.primary, shadowColor:  colorScheme.primary),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(urgentRequestData.unitsRequired.toString(),
                          style: textTheme.title.copyWith(color:colorScheme.secondary)),
                      Text("Units", style: textTheme.bodyRegular.copyWith(
                        color:  colorScheme.secondary
                      ))
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Requests Information",
                          style: textTheme.tabText.copyWith(
                            color: customColors.darkPrimary
                          ) ),
                      SizedBox(height:
                      10),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                            child: SvgPicture.asset(
                              "assets/images/blood_icon.svg",
                              height: 16,
                              colorFilter: ColorFilter.mode(
                                customColors.darkPrimary!,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          Expanded(child: Text(urgentRequestData.bloodGroup.toString(), style: textTheme.tabText.copyWith(color: customColors.darkPrimary),)),
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
                            child: Text(urgentRequestData.hospitalId.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.tabText.copyWith(color: customColors.darkPrimary),),
                          ),

                        ],
                      ),
                      SizedBox(height: 8,),
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
                          Expanded(child: Text(urgentRequestData.requiredDate?.toFormattedTime() ?? "N/A", style: textTheme.tabText.copyWith(color: customColors.darkPrimary),)),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                            child: SvgPicture.asset(
                              "assets/images/calender_icon.svg",
                              height: 20,
                              colorFilter: ColorFilter.mode(
                                customColors.darkPrimary!,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(child: Text(urgentRequestData.requiredDate?.toFormattedDate() ?? "N/A", style: textTheme.tabText.copyWith(color: customColors.darkPrimary),)),

                        ],
                      )
                   ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ) : SizedBox();
  }


}