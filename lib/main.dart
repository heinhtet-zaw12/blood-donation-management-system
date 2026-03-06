import 'package:blood_donation_management_system/core/routes/router.dart';
import 'package:blood_donation_management_system/core/theme/theme_const.dart';
import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'features/Home/Dashboard/presentation/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeConst.getTheme(),
      routerConfig:  router,
    );
  }
}
