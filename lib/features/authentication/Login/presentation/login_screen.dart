import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/theme_getter.dart';
import '../../../../core/widgets/elevated_button_widget.dart';
import '../../../../core/widgets/input_decoration.dart';
import '../../../../core/widgets/label_text_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: SafeArea(
        child:  Center(
          child: Container(
            width: screenWidth *0.9,
            height: 550,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: colorScheme.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap:  (){
                    Navigator.pop(context);
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset(
                      "assets/images/close_icon.svg",
                      width: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                 Text(
                  "Log In",
                  style: textTheme.subTitle.copyWith(
                    color: colorScheme.primary
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "You can sign in to your account to\nmanage your Bloodlife donation.",
                  textAlign: TextAlign.center,
                  style: textTheme.tabText.copyWith(
                    color: customColors.darkPrimary
                  ),
                ),

                Form(child: Column(children: [
                  //UserName
                  const SizedBox(height: 26),
                  buildLabel("User name",customColors.textPrimary! , textTheme),
                  const SizedBox(height: 6),
                  TextFormField(
                    decoration: buildInputDecoration(hintText: "Enter username",hintStyle: textTheme.tabText.copyWith(color: customColors.disabled),  color: customColors.disabled! , svg:  SvgPicture.asset(
                      "assets/images/Edit_icon.svg",
                      width: 18,
                    ),),
                  ),

                  //Password
                  const SizedBox(height: 16),
                  buildLabel("Password", customColors.textPrimary!, textTheme) ,
                  const SizedBox(height: 6),
                  TextFormField(
                    obscureText: true,
                    decoration: buildInputDecoration(hintText: "Password",hintStyle: textTheme.tabText.copyWith(color: customColors.disabled),  color: customColors.disabled! , svg:  SvgPicture.asset(
                      "assets/images/Edit_icon.svg",
                      width: 18,
                    ),),
                  ),

                  //RememberMe
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onChanged: (value) {},
                        side:  BorderSide(
                            color: customColors.darkPrimary!,
                            width: 2
                        ),
                      ),
                      Text(
                        "Remember me",
                        style: textTheme.tabText.copyWith(
                            color: customColors.darkPrimary
                        ),
                      )
                    ],
                  ),

                  //Login Button
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    width: 282,
                    child: ElevatedButtonWidget(text: "Log In", onPressed: (){
                      context.push('/dashboard');
                    },svg: SvgPicture.asset(
                      "assets/images/Login_icon.svg",
                      width: 18,
                      colorFilter: ColorFilter.mode(colorScheme.secondary,BlendMode.srcIn ),
                    ) ,),
                  )  ,
                ],)),

               const SizedBox(height: 10),

               //Don't have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text("Don’t have an account yet? ", style:  textTheme.tabText.copyWith(
                      color: customColors.darkPrimary
                    ),),
                    SizedBox(width: 5,),
                    TextButton(onPressed: (){
                      context.go('/register');
                    }, child:   Text(
                      "Register",
                      style:  textTheme.tabText.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: colorScheme.primary,
                          color: colorScheme.primary
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}