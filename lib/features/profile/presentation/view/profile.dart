import 'package:blood_donation_management_system/core/utils/date_formatter.dart';
import 'package:blood_donation_management_system/core/widgets/Shimmer_widget.dart';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/features/profile/presentation/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/theme_getter.dart';
import '../../../../core/widgets/input_decoration.dart';
import '../../../../core/widgets/shimmer_box.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {

 @override
 void initState() {
   super.initState();
 }
 @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;

    final userData =  ref.watch(userProfileNotifierProvider);
    final user =  userData.userProfileModel?.data;


    return  userData.isLoading ? ShimmerWidget()  :  SafeArea(
      child:  SingleChildScrollView(
        padding:  EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // PROFILE CARD
            SizedBox(height: 10,),
             Container(
            width: 352,
               padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
               decoration: boxDecoration(cardColor: colorScheme.secondary, shadowColor: customColors.disabled),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 SizedBox(
                   width:110,
                   height: 110,
                   child: const CircleAvatar(
                     radius: 55,
                     backgroundImage: AssetImage('assets/images/default_profile.jpg'),
                   ),
                 ),
                 //User Name
                 SizedBox(height: 15,),
                 Text(
                   user?.userName ?? "User",
                   style:textTheme.subTitle.copyWith(
                     color:  customColors.darkPrimary,
                   ) ,
                 ),
                  SizedBox(height: 15,),
                 user?.donorInfo !=null ?Row(
                  mainAxisAlignment:  MainAxisAlignment.center,
                  children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16,horizontal: 32),
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(children: [ SizedBox(
                      width: 20,
                      child: SvgPicture.asset(
                        "assets/images/blood_icon.svg",
                        height: 16,
                        colorFilter: ColorFilter.mode(
                          colorScheme.secondary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ) , Text("${user?.donorInfo?.bloodGroup ?? ''} ${user?.donorInfo?.bloodGroup?.contains('+') == true ? 'POSITIVE' : 'NEGATIVE'}",style: textTheme.tabText.copyWith(color: colorScheme.secondary),),
                    ],),
                  ),
                  SizedBox(width: 20,),
                  Text("Verified donor", style: textTheme.tabText.copyWith(color: customColors.disabled),),
                ],) : SizedBox.shrink(),
                 const SizedBox(height: 20),
                  Text(
                   "email : ${user?.email ?? "NA"}",
                   style: textTheme.bodyRegular.copyWith(
                     fontWeight: FontWeight.w400,
                     color: customColors.darkPrimary
                   ),
                 ),
                 const SizedBox(height: 5),

                 //Blood type
               ],
             ),
           ),
            const SizedBox(height: 20),

            // DONATION INFO
           user?.donorInfo != null ? Container(
              width: 352,
             padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
             decoration: boxDecoration(cardColor: colorScheme.secondary, shadowColor: customColors.disabled),
              child:  Column(
                mainAxisAlignment:  MainAxisAlignment.center,
                children:  [
                  (user?.donorInfo?.lastDonationDate != null ) ?   Text("Last Donation : ${user?.donorInfo?.lastDonationDate?.toCustomFormattedDateOrEmpty() }",
                    style:textTheme.bodyRegular.copyWith(
                      fontWeight:  FontWeight.w400,
                      color:  customColors.darkPrimary,
                    ) ,
                  ) : SizedBox(),
                  SizedBox(height: 8),
                  Text("Birth of Date : ${user?.donorInfo?.dateOfBirth?.toCustomFormattedDateOrEmpty()}",
                    style:textTheme.bodyRegular.copyWith(
                      fontWeight:  FontWeight.w400,
                      color:  customColors.darkPrimary,
                    ) ,
                  ),
                  SizedBox(height: 8),

                  Text("Weight : 86 kg", style:textTheme.bodyRegular.copyWith(
                    fontWeight:  FontWeight.w400,
                    color:  customColors.darkPrimary,
                  ) ,),
                  SizedBox(height: 8),

                  Text("Last blood pressure : 120/80 mmHg",
                    style:textTheme.bodyRegular.copyWith(
                      fontWeight:  FontWeight.w400,
                      color:  customColors.darkPrimary,
                    ) ,
                  ),
                ],
              ),
            ) : const SizedBox.shrink(),

            const SizedBox(height: 20),

            // User Info
            user?.donorInfo != null ?  Container(
              width: 352,
              decoration:  boxDecoration(cardColor: colorScheme.secondary, shadowColor:customColors.disabled),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment:  MainAxisAlignment.center,
                  children: [
                    //Address
                     Text("Address" , style:  textTheme.bodyRegular.copyWith(color:  customColors.darkPrimary , fontWeight: FontWeight.w400),),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 55,
                      child: TextFormField(
                        readOnly: true,
                        style: TextStyle(
                            color: customColors.darkPrimary
                          ),
                        decoration: buildInputDecoration(
                          context: context,
                          hintText: "No.5 First Floor , Hteet Tan 5 Stree, kyeemyindaing, Yangon",
                          hintStyle: textTheme.tabText.copyWith(color: customColors.darkPrimary, 
                          fontWeight: FontWeight.w400),  
                          svg:  SvgPicture.asset(
                          "assets/images/Edit_icon.svg",
                          width: 15,
                        ),),
                      ),
                    ),

                    //Phone Number
                    const SizedBox(height: 12),
                    Text("Phone Number" , style:  textTheme.bodyRegular.copyWith(color:  customColors.darkPrimary , fontWeight:  FontWeight.w400),),
                    const SizedBox(height: 12,),
                    SizedBox(
                      height: 55,
                      child: TextFormField(
                        readOnly: true,
                        style: TextStyle(
                            color: customColors.darkPrimary
                          ),
                        decoration: buildInputDecoration(
                          hintText: "+959 965243876",
                          context: context,
                          hintStyle: textTheme.tabText.copyWith(color: customColors.darkPrimary, fontWeight: FontWeight.w400),  
                          svg:  SvgPicture.asset(
                          "assets/images/Edit_icon.svg",
                          width: 15,
                        ),),
                      ),
                    ),

                  ],
                ),
              ),
            ) : const SizedBox.shrink(),
            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}