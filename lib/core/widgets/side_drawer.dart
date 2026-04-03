import 'package:blood_donation_management_system/core/storage/app_storage.dart';
import 'package:blood_donation_management_system/core/theme/extension/bdms_colors.dart';
import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/features/authentication/Logout/views/notifer/logout_state_model.dart';
import 'package:blood_donation_management_system/features/authentication/Logout/views/provider/logout_provider.dart';
import 'package:blood_donation_management_system/features/dashboard/widgets/drawerItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class SideDrawer extends ConsumerStatefulWidget {
  const SideDrawer({super.key,required this.isDashboard});
  final bool isDashboard;

  @override
  ConsumerState<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends ConsumerState<SideDrawer> {
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
    ref.listen(logoutNotifierProvider, (previous, next) {
      if (next.isSuccess) {
        Navigator.pop(context);
        context.go('/');
      }
    });
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

               //Home
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                    context.go('/');
                  },
                  child: DrawerItem(svg:  SvgPicture.asset(
                    width: 30,
                    height: 30,
                    "assets/images/home_icon.svg",
                  ),text:  "Home"),
                ),

                //announcement
                InkWell(
                  onTap: () => {},
                  child: DrawerItem(svg:  SvgPicture.asset(
                    width: 30,
                    height: 30,
                    "assets/images/announcment_icon.svg",
                  ),text:  "Announcements"),
                ),

               //logout or Login
               Consumer(builder: (context,ref,child){
                 final isLogout = ref.watch(logoutNotifierProvider);
                 return drawerItem(isLoggedIn,isLogout, context, ref, customColors);
               },),
               //Dashboard
               (!widget.isDashboard && isLoggedIn ) ?  InkWell(
                 onTap: () {
                   Navigator.pop(context);
                   context.go('/dashboard');
                 },
                 child: DrawerItem(svg:  SvgPicture.asset(
                   colorFilter: ColorFilter.mode(customColors.darkPrimary!, BlendMode.srcIn),
                   width: 30,
                   height: 30,
                   "assets/images/dashboard_icon.svg",
                 ),text:  "Dashboard"),
               ) : SizedBox(),

               //Settings
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

Widget drawerItem(bool isLoggedIn,LogoutStateModel isLogout, BuildContext context, WidgetRef ref, BDMSColors customColors){
 if(isLogout.isLoading){
   return Center(child: CircularProgressIndicator());
 }
  if (isLoggedIn)
   {
     return InkWell(onTap:  () async {
         await  ref.read(logoutNotifierProvider.notifier).logout();
         }, child: DrawerItem(svg:  SvgPicture.asset(
         width: 30,
         height: 30,
         "assets/images/logout_icon.svg",
       ),text:  "Logout"),
     );
   }

 return  InkWell(
   onTap: (){
     context.go('/login');
   },
   child:  DrawerItem(svg:  SvgPicture.asset(
     colorFilter: ColorFilter.mode(customColors.darkPrimary!, BlendMode.srcIn),
     width: 30,
     height: 30,
     "assets/images/Login_icon.svg",
   ),text:  "Login"),
);

}