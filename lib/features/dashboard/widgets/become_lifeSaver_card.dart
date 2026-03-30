import 'package:blood_donation_management_system/features/donor/presentation/view/become_a_donor_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/theme_getter.dart';
import '../../../../core/widgets/box_decoration.dart';
import '../../../../core/widgets/elevated_button_widget.dart';


class BecomeLifesaverCard extends StatefulWidget {
  const BecomeLifesaverCard({super.key});

  @override
  State<BecomeLifesaverCard> createState() => _BecomeLifesaverCardState();
}

class _BecomeLifesaverCardState extends State<BecomeLifesaverCard> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    return Container(
      padding: const EdgeInsets.all(16),
      height: 247,
      width: 382,
      decoration: boxDecoration(cardColor: colorScheme.secondary, shadowColor: customColors.disabled),
      child: Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        children: [
          Text("Become a Life Saver", style: textTheme.subTitle.copyWith(color: colorScheme.primary),),
          SizedBox(height: 10,),
          SizedBox(
            width: 255,
            child: Text("You haven't registered as a donor yet. Click below to start your journey as a blood donor and help save lives.",
            textAlign: TextAlign.center,
            style: textTheme.tabText.copyWith(color: customColors.darkPrimary),
            ),
          ),
          SizedBox(height: 30,),
          SizedBox(
            width: 194,
            height: 50,
            child: ElevatedButtonWidget(text: "Become a Donor",
                svg:  SvgPicture.asset(
                  "assets/images/donate_icon.svg",
                  height: 20,
                  width: 20,
                  colorFilter: ColorFilter.mode(
                    colorScheme.secondary,
                    BlendMode.srcIn,
                  ),
                ),
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (_) =>  BecomeDonorDialog(),
                  );
            }),
          )
        ],
      ),
    );
  }
}
