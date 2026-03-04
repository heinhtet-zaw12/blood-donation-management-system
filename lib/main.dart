import 'package:blood_donation_management_system/core/theme/theme_const.dart';
import 'package:blood_donation_management_system/features/Auth/Login/presentation/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeConst.getTheme(),
      home: LoginView(),
    );
  }
}

