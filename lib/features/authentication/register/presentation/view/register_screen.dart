import 'package:blood_donation_management_system/features/authentication/register/presentation/provider/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/theme_getter.dart';
import '../../../../../core/widgets/elevated_button_widget.dart';
import '../../../../../core/widgets/input_decoration.dart';
import '../../../../../core/widgets/label_text_widget.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
   String _username = '';
    String _email = '';
    String _password = '';
   String _confirmPassword = '';
   bool _agreeToTerms = false;
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
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
    ref.listen(registerNotifierProvider, (previous, next) {
      if (next.isSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Register Success!")),
        );
        context.push('/login');
      }
      if (next.isError) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Register Failed!")),
        );
      }
    });
    final screenWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
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
                  Align(
                    alignment: Alignment.topRight,
                    child:    GestureDetector(
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
                        buildLabel("Username",customColors.textPrimary! , textTheme),
                        const SizedBox(height: 6),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: buildInputDecoration(
                            context: context,
                            hintText: "Username",
                            hintStyle: textTheme.tabText.copyWith(color: customColors.disabled),
                            svg:  SvgPicture.asset(
                            "assets/images/Edit_icon.svg",
                            width: 18,
                          ),),
                          validator: (value) {
                            if (value == null || value.isEmpty) return "Username is required" ;
                            if (value.length < 6) return "Username must be at least 6 character";
                            return null;
                          },
                          onSaved: (value) => _username = value ?? '',
                        ),
                        //Email address
                        const SizedBox(height: 16),
                        buildLabel("Email address", customColors.textPrimary!, textTheme) ,
                        const SizedBox(height: 6),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: buildInputDecoration(
                            context: context,
                            hintText: "Email address",
                            hintStyle: textTheme.tabText.copyWith(color: customColors.disabled),
                            svg:  SvgPicture.asset(
                            "assets/images/Edit_icon.svg",
                            width: 18,
                          ),),
                          validator: (value) {
                            if (value == null || value.isEmpty) return "Email is required";
                            if (!emailRegex.hasMatch(value)) return 'Invalid email format';
                            return null;
                          },
                          onSaved: (value) => _email = value ?? '',
                        ),
                        //Password
                        const SizedBox(height: 26),
                        buildLabel("Password",customColors.textPrimary! , textTheme),
                        const SizedBox(height: 6),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: true,
                          decoration: buildInputDecoration(
                            context: context,
                            hintText: "Password",
                            hintStyle: textTheme.tabText.copyWith(color: customColors.disabled),
                            svg:  SvgPicture.asset(
                            "assets/images/Edit_icon.svg",
                            width: 18,
                          ),),
                          validator: (value) {
                            if (value == null || value.isEmpty) return 'Password is required';
                           if(value.length < 8)  return  'Password must be at least 8 characters';
                            _password = value;
                            return null;
                          },
                          onSaved: (value) => _password = value ?? '',
                        ),

                        //PasswordConfirmation
                        const SizedBox(height: 26),
                        buildLabel("Password Confirmation",customColors.textPrimary! , textTheme),
                        const SizedBox(height: 6),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: true,
                          decoration: buildInputDecoration(
                            context: context,
                            hintText: "passwordConfirmation",
                            hintStyle: textTheme.tabText.copyWith(color: customColors.disabled),
                            svg:  SvgPicture.asset(
                              "assets/images/Edit_icon.svg",
                              width: 18,
                            ),),
                          validator: (value) {
                            if (value == null || value.isEmpty) return 'Password Confirmation is required';
                            if (value != _password) return 'Password Confirmation does not match';
                            return null;
                          },
                          onSaved: (value) => _confirmPassword = value ?? '',
                        ),
                         //Terms and condition
                        const SizedBox(height: 18),
                        FormField<bool>(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          initialValue: _agreeToTerms,
                          validator: (value) {
                            if (value == false) return 'You need to agree to terms and conditions';
                            return null;
                          },
                          builder: (state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: state.value,
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      onChanged: (value) {
                                        state.didChange(value);
                                        _agreeToTerms = value ?? false;
                                      },
                                      // styling...
                                    ),
                                    Text("I agree to the terms and conditions", style: textTheme.tabText),
                                  ],
                                ),
                                if (state.hasError)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Text(state.errorText!, style: TextStyle(color: colorScheme.error, fontSize: 12)),
                                  ),
                              ],
                            );
                          },
                        ),

                        //Register Button
                        const SizedBox(height: 20),
                        Consumer(builder: (context, ref, child){
                          final stateModel = ref.watch(registerNotifierProvider);
                          return Column(
                            children: [
                              if (stateModel.isError && stateModel.errorMessage != null && !stateModel.isLoading)
                                Padding(padding: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    stateModel.errorMessage!,
                                    style: const TextStyle(color: Colors.red),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              stateModel.isLoading
                                  ? const Center(
                                child: CircularProgressIndicator(),
                              ):
                              SizedBox(
                                height: 50,
                                width: 282,
                                child: ElevatedButtonWidget(text: "Register",
                                  onPressed: (){
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      ref.read(registerNotifierProvider.notifier).register(userName: _username, email: _email, password: _password, passwordConfirm: _confirmPassword);
                                    }
                                  },svg: SvgPicture.asset(
                                    "assets/images/Register_icon.svg",
                                    width: 18,
                                    colorFilter: ColorFilter.mode(colorScheme.secondary,BlendMode.srcIn ),
                                  ) ,),
                              ),
                            ],
                          );

                        }),
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
                      TextButton(onPressed: () => context.go('/login'), child: Text(
                        "Log In",
                        style:  textTheme.tabText.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: colorScheme.primary,
                            color: colorScheme.primary
                        ), ),
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