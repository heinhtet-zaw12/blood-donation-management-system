import 'package:blood_donation_management_system/core/routes/router.dart';
import 'package:blood_donation_management_system/core/theme/theme_const.dart';
import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/features/authentication/register/presentation/register_screen.dart';
import 'package:blood_donation_management_system/features/home/home/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'features/Home/Dashboard/presentation/dashboard.dart';
import 'features/authentication/Login/presentation/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeConst.getTheme(),
    //   routerConfig:  router,
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeConst.getTheme(),
      home:  Home(),
    );
  }
}
