import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/theme_getter.dart';
import '../../../../core/widgets/elevated_button_widget.dart';
import '../../../../core/widgets/input_decoration.dart';
import '../../../../core/widgets/label_text_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? selectedGender;
  final List<String> genderOptions = ['Male', 'Female', 'Other'];
  String? selectedBloodGroup;
  final List<String> bloodGroups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  final TextEditingController dateController = TextEditingController();
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),

    );
    if (picked != null) {
      setState(() {
        dateController.text = "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      }); }
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    final _formKey = GlobalKey<FormState>();
    bool isAgree = false;
    final passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: SafeArea(
        child:  SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Container(
              width: screenWidth *0.9,
                margin: const EdgeInsets.symmetric(vertical: 60),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: (){
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
                    "Register",
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

                  Form(
                      key: _formKey,
                      child: Column(children: [
                        //User Name
                        const SizedBox(height: 26),
                        buildLabel("User name",customColors.textPrimary! , textTheme),
                        const SizedBox(height: 6),
                        TextFormField(
                          decoration: buildInputDecoration(hintText: "User name",hintStyle: textTheme.tabText.copyWith(color: customColors.disabled),  color: customColors.disabled! , svg:  SvgPicture.asset(
                            "assets/images/Edit_icon.svg",
                            width: 18,
                          ),),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "First name is required";
                            }
                            if (value.length < 2) {
                              return "Name must be at least 2 characters";
                            }
                            return null;
                          },
                        ),

                        //Email address
                        const SizedBox(height: 16),
                        buildLabel("Email address", customColors.textPrimary!, textTheme) ,
                        const SizedBox(height: 6),
                        TextFormField(
                          decoration: buildInputDecoration(hintText: "Email address",hintStyle: textTheme.tabText.copyWith(color: customColors.disabled),  color: customColors.disabled! , svg:  SvgPicture.asset(
                            "assets/images/Edit_icon.svg",
                            width: 18,
                          ),),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email is required";
                            }
                            final emailRegex =
                            RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
                            if (!emailRegex.hasMatch(value)) {
                              return "Enter valid email";
                            }
                            return null;
                          },
                        ),

                        //Phone number
                        const SizedBox(height: 26),
                        buildLabel("Phone number",customColors.textPrimary! , textTheme),
                        const SizedBox(height: 6),
                        TextFormField(
                          decoration: buildInputDecoration(hintText: "Phone number",hintStyle: textTheme.tabText.copyWith(color: customColors.disabled),  color: customColors.disabled! , svg:  SvgPicture.asset(
                            "assets/images/Edit_icon.svg",
                            width: 18,
                          ),),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Phone number is required";
                            }
                            if (value.length < 8) {
                              return "Invalid phone number";
                            }
                            return null;
                          },
                        ),

                        //Date of birth
                        const SizedBox(height: 26),
                        buildLabel("Date of birth",customColors.textPrimary! , textTheme),
                        const SizedBox(height: 6),
                        TextFormField(
                          controller:  dateController,
                          readOnly: true,
                          onTap: () => selectDate(context),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select your birth date';
                            }
                            return null;
                          },
                          decoration: buildInputDecoration(hintText: "dd/mm/yy",hintStyle: textTheme.tabText.copyWith(color: customColors.disabled),  color: customColors.disabled! , svg:  SvgPicture.asset(
                            "assets/images/calender_icon.svg",
                            width: 18,
                            colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
                          ),),
                        ),

                        //Gender
                        const SizedBox(height: 26),
                        buildLabel("Gender",customColors.textPrimary! , textTheme),
                        const SizedBox(height: 6),
                        DropdownButtonFormField<String>(
                          initialValue: selectedGender,
                          hint: const Text('Select...'),
                          icon:  SvgPicture.asset("assets/images/drop_down.svg",width: 15,height: 15,),
                          decoration: buildInputDecoration(hintText: "dd/mm/yy",hintStyle: textTheme.tabText.copyWith(color: customColors.disabled),  color: customColors.disabled! ,
                          ),
                          items: genderOptions.map((String gender) {
                            return DropdownMenuItem<String>(
                              value: gender,
                              child: Text(gender),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedGender = newValue;
                            });
                          },
                          validator: (value) => value == null ? 'Please select your gender' : null,

                        ),

                        //Blood group
                        const SizedBox(height: 26),
                        buildLabel("Blood group",customColors.textPrimary! , textTheme),
                        const SizedBox(height: 6),
                        DropdownButtonFormField<String>(
                          initialValue: selectedBloodGroup,
                          hint: const Text('Select...'),
                          icon:  SvgPicture.asset("assets/images/drop_down.svg",
                            width: 15,
                            height: 15,
                          ),
                          decoration: buildInputDecoration(hintText: "dd/mm/yy",hintStyle: textTheme.tabText.copyWith(color: customColors.disabled),  color: customColors.disabled! ,
                          ),
                          items: bloodGroups.map((String group) {
                            return DropdownMenuItem<String>(
                              value: group,
                              child: Text(group),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedBloodGroup = newValue;
                            });
                          },
                           validator: (value) => value == null ? 'Please select blood group' : null,
                          //

                        ),

                        //Weight (kg)
                        const SizedBox(height: 26),
                        buildLabel("Weight (kg)",customColors.textPrimary! , textTheme),
                        const SizedBox(height: 6),
                        TextFormField(
                          decoration: buildInputDecoration(hintText: "Weight kg",hintStyle: textTheme.tabText.copyWith(color: customColors.disabled),  color: customColors.disabled! ,
                            svg:  SvgPicture.asset(
                            "assets/images/Edit_icon.svg",
                            width: 18,
                          ),),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Weight is required";
                            }
                            final weight = double.tryParse(value);
                            if (weight == null) {
                              return "Enter valid weight";
                            }
                            if (weight < 30) {
                              return "Weight too low";
                            }
                            return null;
                          },
                        ),

                        //Address
                        const SizedBox(height: 26),
                        buildLabel("Address",customColors.textPrimary! , textTheme),
                        const SizedBox(height: 6),
                        TextFormField(
                          decoration: buildInputDecoration(hintText: "Address",hintStyle: textTheme.tabText.copyWith(color: customColors.disabled),  color: customColors.disabled! , svg:  SvgPicture.asset(
                            "assets/images/Edit_icon.svg",
                            width: 18,
                          ),),
                          validator:  (value){
                            if (value == null || value.isEmpty) {
                              return "Address is required";
                            }
                            return null;
                          },
                        ),

                        //Password
                        const SizedBox(height: 26),
                        buildLabel("Password",customColors.textPrimary! , textTheme),
                        const SizedBox(height: 6),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: buildInputDecoration(hintText: "Password",hintStyle: textTheme.tabText.copyWith(color: customColors.disabled),  color: customColors.disabled! , svg:  SvgPicture.asset(
                            "assets/images/Edit_icon.svg",
                            width: 18,
                          ),),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password required";
                            }
                            if (value.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                        ),

                        //Confirm Password
                        const SizedBox(height: 26),
                        buildLabel("Confirm password",customColors.textPrimary! , textTheme),
                        const SizedBox(height: 6),
                        TextFormField(
                          obscureText: true,
                          decoration: buildInputDecoration(hintText: "Confirm password",hintStyle: textTheme.tabText.copyWith(color: customColors.disabled),  color: customColors.disabled! , svg:  SvgPicture.asset(
                            "assets/images/Edit_icon.svg",
                            width: 18,
                          ),),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Confirm your password";
                            }
                            if (value != passwordController.text) {
                              return "Passwords do not match";
                            }
                            return null;
                          },
                        ),

                        //Terms and condition
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            Checkbox(
                              value: isAgree,
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              onChanged: (value) {
                                isAgree = value!;
                              },
                              side:  BorderSide(
                                  color: customColors.darkPrimary!,
                                  width: 2
                              ),
                            ),
                            Text(
                              "I agree to the terms and conditions",
                              style: textTheme.tabText.copyWith(
                                  color: customColors.darkPrimary
                              ),
                            )
                          ],
                        ),

                        //Register Button
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 50,
                          width: 282,
                          child: ElevatedButtonWidget(text: "Register", onPressed: (){
                            if(!_formKey.currentState!.validate()){
                              return;
                            }
                            if(!isAgree){
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please accept terms and conditions"),
                                ),
                              );
                              return;
                            }
                          },svg: SvgPicture.asset(
                            "assets/images/Register_icon.svg",
                            width: 18,
                            colorFilter: ColorFilter.mode(colorScheme.secondary,BlendMode.srcIn ),
                          ) ,),
                        )  ,
                      ],)),

                  const SizedBox(height: 20),

                  //Don't have an account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text("Already have an account? ", style:  textTheme.tabText.copyWith(
                          color: customColors.darkPrimary
                      ),),
                      SizedBox(width: 5,),
                      Text(
                        "Log In",
                        style:  textTheme.tabText.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: colorScheme.primary,
                            color: colorScheme.primary
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}