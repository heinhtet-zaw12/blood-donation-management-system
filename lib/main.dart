import 'package:blood_donation_management_system/core/routes/router.dart';
import 'package:blood_donation_management_system/core/theme/theme_const.dart';
import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/features/authentication/register/presentation/view/register_screen.dart';
import 'package:blood_donation_management_system/features/home/presentation/home.dart';
import 'package:blood_donation_management_system/service_locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'features/authentication/Login/presentation/view/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  runApp(const ProviderScope(child: MyApp()));
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
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeConst.getTheme(),
    //   home:  Home()
    // );
  }
}
