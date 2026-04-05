import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/core/widgets/label_text_widget.dart';
import 'package:blood_donation_management_system/features/donate/widgets/previous_button.dart';
import 'package:blood_donation_management_system/features/donate/widgets/submit_button.dart';
import 'package:blood_donation_management_system/features/request/providers/request_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class RequestSubmit extends ConsumerWidget {
  const RequestSubmit({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;

    return Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              decoration: boxDecoration(
                cardColor: colorScheme.secondary,
                shadowColor: colorScheme.primary,
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/request_search_icon.svg'),
                    const SizedBox(height: 10),
                    buildLabel(
                        "Please click the “ Submit ” button to search for a blood donor. Please wait for a response.",
                        customColors.darkPrimary!,
                        textTheme,
                        alignment: Alignment.center
                      ),
                      
                    const SizedBox(height: 20),
                    // SubmitButton(context),
                    const SizedBox(height: 20),
                    PreviousButton(context: context,
                      onPressed: (){
                        ref.read(requestStepProvider.notifier).state = 
                          RequestStep.third;
                      }
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}