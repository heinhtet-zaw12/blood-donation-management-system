import 'package:blood_donation_management_system/core/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/theme_getter.dart';
import '../widgets/drawerItem.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.shell, this.logo, this.barIcon});
  final StatefulNavigationShell shell;
  final String? logo;
  final String? barIcon;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    StatefulNavigationShell shell = widget.shell;
    return Scaffold(
      backgroundColor: customColors.background,
      appBar: AppBarWidget(),
      body:  shell,
      bottomNavigationBar: NavigationBar(
          backgroundColor:  colorScheme.primary,
          indicatorColor: Colors.transparent,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          selectedIndex: selectedScreen,
          onDestinationSelected: (int index) {
            setState(() {
              selectedScreen = index;
            });
            shell.goBranch(
              index,
              initialLocation: index == shell.currentIndex,
            );
          },
          destinations: [
            NavigationDestination(icon: SizedBox(
              height: 25,
              width: 25,
              child: SvgPicture.asset(
                  "assets/images/dashboard_icon.svg",
                  colorFilter: ColorFilter.mode(
                    shell.currentIndex == 0 ? colorScheme.secondary :  customColors.darkPrimary!,
                    BlendMode.srcIn,
                  )),
            ), label: "Dashboard"),
            NavigationDestination(icon: SizedBox(
              width: 25,
              height: 25,
              child: SvgPicture.asset(
                  "assets/images/donate_icon.svg",
                  colorFilter: ColorFilter.mode(
                    shell.currentIndex == 1 ? colorScheme.secondary :  customColors.darkPrimary!,
                    BlendMode.srcIn,
                  )),
            ), label: "Donate"),
            NavigationDestination(icon: SizedBox(
              width: 25,
              height: 25,
              child: SvgPicture.asset(
                  "assets/images/request_icon.svg",
                  height: 24,
                  width: 27,
                  colorFilter: ColorFilter.mode(
                    shell.currentIndex == 2 ? colorScheme.secondary :  customColors.darkPrimary!,
                    BlendMode.srcIn,
                  )),
            ), label: "Request"),
            NavigationDestination(icon: SizedBox(
              width: 25,
              height: 24,
              child: SvgPicture.asset(
                  "assets/images/appointment_icon2.svg",
                  colorFilter: ColorFilter.mode(
                    shell.currentIndex == 3 ? colorScheme.secondary :  customColors.darkPrimary!,
                    BlendMode.srcIn,
                  )),
            ), label: "Appointment"),
            NavigationDestination(icon: SizedBox(
              height: 25,
              width: 25,
              child: SvgPicture.asset(
                  "assets/images/records_icon.svg",

                  colorFilter: ColorFilter.mode(
                    shell.currentIndex == 4 ? colorScheme.secondary :  customColors.darkPrimary!,

                    BlendMode.srcIn,
                  )),
            ),label: "Records"),
            NavigationDestination(icon: SizedBox(
              height: 25,
              width: 25,
              child: SvgPicture.asset(
                  "assets/images/profile_icon.svg",
                  colorFilter: ColorFilter.mode(
                    shell.currentIndex == 5 ? colorScheme.secondary :  customColors.darkPrimary!,
                    BlendMode.srcIn,
                  )),
            ), label: "Profile"),
          ]),
        endDrawer: Drawer(
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
                  "assets/images/logout_icon.svg",
                ),text:  "Log Out"),
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
       ));
  }
}
