import 'package:blood_donation_management_system/core/theme/extension/bdms_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/theme_getter.dart';

class LoginView  extends StatefulWidget {
  const LoginView({super.key});


  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final appColors = context.colors;
    final textTheme = context.bdmsText;
    return Scaffold(
      appBar: AppBar(
        title:  Text("Hello",
        style:  textTheme.title.copyWith(
          color:  appColors.success
        )
        ),
      ),
    );
  }
}
