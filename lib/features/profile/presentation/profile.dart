import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/theme_getter.dart';
import '../../../core/widgets/input_decoration.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // PROFILE CARD
             SizedBox(height: 10,),
             Container(
            width: 352,
             height: 338,
             decoration: boxDecoration(cardColor: colorScheme.secondary, shadowColor: customColors.disabled),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 // Avatar
                 Stack(
                   children: [
                     SizedBox(
                       width:130,
                       height: 130,
                       child: const CircleAvatar(
                         radius: 55,
                          backgroundImage: NetworkImage(
                              "https://images.pexels.com/photos/29914634/pexels-photo-29914634.jpeg"),
                       ),
                     ),
                     Positioned(
                       bottom: 0,
                       right: 15,
                       child: Container(
                         padding: const EdgeInsets.all(6),
                         decoration:  BoxDecoration(
                           shape: BoxShape.circle,
                           color:colorScheme.primary,
                         ),
                         child: SvgPicture.asset(
                         "assets/images/Edit_icon.svg",
                         width: 18,
                           colorFilter: ColorFilter.mode(colorScheme.secondary,BlendMode.srcIn),
                       ),
                       ),
                     )
                   ],
                 ),
                 const SizedBox(height: 20),

                 //User Name
                 Text(
                   "User Name : Zar Ni",
                   style:textTheme.bodyRegular.copyWith(
                     color:  customColors.darkPrimary,
                   ) ,
                 ),

                 const SizedBox(height: 20),
                  Text(
                   "User ID : 000255",
                   style: textTheme.bodyRegular.copyWith(
                     fontWeight: FontWeight.w400,
                     color: customColors.darkPrimary
                   ),
                 ),
                 const SizedBox(height: 5),

                 //Blood type
                 Text(
                   "Blood-type : B+",
                   style: textTheme.bodyRegular.copyWith(
                       fontWeight: FontWeight.w400,
                       color: customColors.darkPrimary
                   ),
                 ),
               ],
             ),
           ),
            const SizedBox(height: 20),

            // DONATION INFO
            Container(
              width: 352,
              height: 229,
              decoration: boxDecoration(cardColor: colorScheme.secondary, shadowColor: customColors.disabled),
              child:  Column(
                mainAxisAlignment:  MainAxisAlignment.center,
                children:  [
                  Text("Last Donation : 28 Jan 2026",
                    style:textTheme.bodyRegular.copyWith(
                      fontWeight:  FontWeight.w400,
                      color:  customColors.darkPrimary,
                    ) ,
                  ),
                  SizedBox(height: 8),

                  Text("Birth of Date : 14 Feb 2025",
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
            ),

            const SizedBox(height: 20),

            // User Info
            Container(
              width: 352,
              height: 424,
              decoration:  boxDecoration(cardColor: colorScheme.secondary, shadowColor:customColors.disabled),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                        decoration: buildInputDecoration(hintText: "No.5 First Floor , Hteet Tan 5 Stree, kyeemyindaing, Yangon",hintStyle: textTheme.tabText.copyWith(color: customColors.darkPrimary, fontWeight: FontWeight.w400),  color: customColors.disabled! , svg:  SvgPicture.asset(
                          "assets/images/Edit_icon.svg",
                          width: 15,
                        ),),
                      ),
                    ),

                    //Medical Conditions
                    SizedBox(height: 20,),
                    Text("Medical Conditions" , style:  textTheme.bodyRegular.copyWith(color:  customColors.darkPrimary , fontWeight:  FontWeight.w400),),
                    const SizedBox(height: 12,),
                    Row(
                      children: [
                        Expanded(
                          child:  SizedBox(
                            height: 55,
                            child: TextFormField(
                              readOnly: true,
                              decoration: buildInputDecoration(hintText: "None",hintStyle: textTheme.tabText.copyWith(color: customColors.darkPrimary, fontWeight: FontWeight.w400),  color: customColors.disabled! , svg:  SvgPicture.asset(
                                "assets/images/drop_down.svg",
                              ),),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child:  SizedBox(
                            height: 55,
                            child: TextFormField(
                              readOnly: true,
                              decoration: buildInputDecoration(hintText: "Male",hintStyle: textTheme.tabText.copyWith(color: customColors.darkPrimary, fontWeight: FontWeight.w400),  color: customColors.disabled! , svg:  SvgPicture.asset(
                                "assets/images/drop_down.svg",
                              ),),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),

                    //Phone Number
                    Text("Phone Number" , style:  textTheme.bodyRegular.copyWith(color:  customColors.darkPrimary , fontWeight:  FontWeight.w400),),
                    const SizedBox(height: 12,),
                    SizedBox(
                      height: 55,
                      child: TextFormField(
                        readOnly: true,
                        decoration: buildInputDecoration(hintText: "+959 965243876",hintStyle: textTheme.tabText.copyWith(color: customColors.darkPrimary, fontWeight: FontWeight.w400),  color: customColors.disabled! , svg:  SvgPicture.asset(
                          "assets/images/Edit_icon.svg",
                          width: 15,
                        ),),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // MEDICAL CARD
            Container(
              width: 352,
              height: 289,
              decoration:  boxDecoration(cardColor: colorScheme.secondary, shadowColor:customColors.disabled),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment:  MainAxisAlignment.center,
                  children: [
                    //Address
                    Text("Allergies" , style:  textTheme.bodyRegular.copyWith(color:  customColors.darkPrimary , fontWeight: FontWeight.w400),),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 55,
                      child: TextFormField(
                        readOnly: true,
                        decoration: buildInputDecoration(hintText: "Seafood",hintStyle: textTheme.tabText.copyWith(color: customColors.darkPrimary, fontWeight: FontWeight.w400),  color: customColors.disabled! , svg:  SvgPicture.asset(
                          "assets/images/Edit_icon.svg",
                          width: 15,
                        ),),
                      ),
                    ),
                    SizedBox(height: 30,),
                    //Phone Number
                    Text("Current Medications" , style:  textTheme.bodyRegular.copyWith(color:  customColors.darkPrimary , fontWeight:  FontWeight.w400),),
                    const SizedBox(height: 12,),
                    SizedBox(
                      height: 55,
                      child: TextFormField(
                        readOnly: true,
                        decoration: buildInputDecoration(hintText: "I'm takign through medicine.",hintStyle: textTheme.tabText.copyWith(color: customColors.darkPrimary, fontWeight: FontWeight.w400),  color: customColors.disabled! , svg:  SvgPicture.asset(
                          "assets/images/Edit_icon.svg",
                          width: 15,
                        ),),
                      ),
                    ),

                  ],
                ),
              ),
            ),


            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),

        boxShadow: const [
          BoxShadow(
            color: Color(0x33FF2D3D),
            blurRadius: 12,
            offset: Offset(0, 6),
          )
        ],
      ),

      child: child,
    );
  }

  /// INPUT BOX
  Widget _inputBox(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),

      decoration: BoxDecoration(
        color: const Color(0xffEFE4E4),
        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          const Icon(Icons.edit, color: Color(0xffFF2D3D), size: 18)
        ],
      ),
    );
  }

  /// DROPDOWN STYLE BOX
  Widget _dropdownBox(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),

      decoration: BoxDecoration(
        color: const Color(0xffEFE4E4),
        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          const Icon(Icons.arrow_drop_down, color: Color(0xffFF2D3D))
        ],
      ),
    );
  }
}