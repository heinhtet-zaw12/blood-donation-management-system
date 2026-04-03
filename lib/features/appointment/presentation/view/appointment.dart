import 'package:blood_donation_management_system/core/widgets/Shimmer_widget.dart';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/features/appointment/presentation/provider/appointment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/storage/app_storage.dart';
import '../../../../core/theme/theme_getter.dart';
import '../../../../core/widgets/elevated_button_widget.dart';


class Appointment extends ConsumerStatefulWidget {
  const Appointment({super.key});

  @override
  ConsumerState<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends ConsumerState<Appointment> {
  AppStorage storage = GetIt.I.get<AppStorage>();
  String? userId;
  @override
  void initState() {
    super.initState();
    getAppointment();
  }
  void getAppointment () async{
    userId = await storage.getUserId();
    if(userId != null) ref.read(appointmentNotifierProvider.notifier).getAppointments(userId: userId!);
  }
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    final appointment = ref.watch(appointmentNotifierProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if(appointment.isLoading)  ShimmerWidget(),
        if(appointment.isError)  Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
               children: [
               const Icon(Icons.error_outline, size: 48, color: Colors.red), const SizedBox(height: 16),
            const Text("Something went wrong!"),
            const SizedBox(height: 16),
            ElevatedButtonWidget(
            text: "Retry",
            onPressed: (){
              getAppointment();
            },),
             ],),),
        if(appointment.isSuccess) Container(
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
        // SizedBox(height: 30,),
        // Container(
        //   width: 352,
        //   height: 232,
        //   decoration:  boxDecoration(cardColor: colorScheme.secondary, shadowColor: customColors.disabled),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Padding(
        //         padding:  const EdgeInsets.only(top: 30, left: 35,bottom: 30),
        //         child: Text("Request Appointment",style: textTheme.tabText.copyWith(color: customColors.darkPrimary),),
        //       ),
        //      Padding(
        //        padding: const EdgeInsets.only(top: 20),
        //        child: Center(
        //             child: Text("No appointments found", style: textTheme.bodyRegular.copyWith(color: customColors.disabled,
        //             ),),
        //           ),
        //      ),
        //
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
