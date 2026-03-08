import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/features/home/dashboard/widgets/drawerItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key,required this.isDashboard});
  final bool isDashboard;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    
    return Drawer(
         width: MediaQuery.of(context).size.width * 0.9,
         backgroundColor: colorScheme.secondary,
         child: SafeArea(
           child: Column(
             crossAxisAlignment:  CrossAxisAlignment.start,
             children: [
               const SizedBox(height: 40),
               // Close Button
               Padding(
                 padding: const EdgeInsets.only(left: 24),
                 child: IconButton(
                   icon: SvgPicture.asset(
                     width: 20,
                     height: 20,
                     "assets/images/close_icon.svg",
                   ) , onPressed: () {
                   Navigator.pop(context);
                 },),
               ),
               const SizedBox(height: 40),
                    // Drawer Items
                DrawerItem(svg:  SvgPicture.asset(
                  width: 30,
                  height: 30,
                  "assets/images/home_icon.svg",
                ),text:  "Home"),
                DrawerItem(svg:  SvgPicture.asset(
                  width: 30,
                  height: 30,
                  "assets/images/announcment_icon.svg",
                ),text:  "Announcements"),
                DrawerItem(svg:  SvgPicture.asset(
                  width: 30,
                  height: 30,
                  isDashboard ? "assets/images/logout_icon.svg" : "assets/images/Login_icon1.svg",
                ),text:  isDashboard ? "Log Out" : "Log In"),
                DrawerItem(svg:  SvgPicture.asset(width: 30, height: 30, "assets/images/setting_icon.svg",),text:  "Settings"),
               const Spacer(),
               Padding(
                padding: EdgeInsets.only(bottom: 20, left: 24),
                child: Text("www.bloodlife.com", style: textTheme.tabText.copyWith(
                  color: customColors.darkPrimary
                )
               ,),),
                  ],),
                ),
       );
  }
}