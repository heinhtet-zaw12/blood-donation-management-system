import 'package:blood_donation_management_system/core/storage/app_storage.dart';
import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/features/dashboard/widgets/drawerItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key,required this.isDashboard});
  final bool isDashboard;

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  AppStorage _storage = GetIt.I.get<AppStorage>();

  String? token;

  @override
  void initState() {
    super.initState();
    getToken();
  }
  void getToken() async{
    String? fetchtoken = await _storage.getToken();
    setState(() {
      token = fetchtoken;
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    final bool isLoggedIn = token != null && token!.isNotEmpty;
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
                InkWell(
                  onTap: () => context.push('/'),
                  child: DrawerItem(svg:  SvgPicture.asset(
                    width: 30,
                    height: 30,
                    "assets/images/home_icon.svg",
                  ),text:  "Home"),
                ),
                InkWell(
                  onTap: () => {},
                  child: DrawerItem(svg:  SvgPicture.asset(
                    width: 30,
                    height: 30,
                    "assets/images/announcment_icon.svg",
                  ),text:  "Announcements"),
                ),
               (token != null ) ? InkWell(
                 child: DrawerItem(svg:  SvgPicture.asset(
                   width: 30,
                   height: 30,
                   "assets/images/logout_icon.svg",
                 ),text:  "Logout"),
               ) : InkWell(
                 child:  DrawerItem(svg:  SvgPicture.asset(
                   width: 30,
                   height: 30,
                   "assets/images/Login_icon.svg",
                 ),text:  "Login"),
               ),
               (!widget.isDashboard && token != null) ?  InkWell(
                 onTap: () => context.push('/dashboard'),
                 child: DrawerItem(svg:  SvgPicture.asset(
                   colorFilter: ColorFilter.mode(customColors.darkPrimary!, BlendMode.srcIn),
                   width: 30,
                   height: 30,
                   "assets/images/dashboard_icon.svg",
                 ),text:  "Dashboard"),
               ) : SizedBox(),
               InkWell(child: DrawerItem(svg:  SvgPicture.asset(width: 30, height: 30, "assets/images/setting_icon.svg",),text:  "Settings")),
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