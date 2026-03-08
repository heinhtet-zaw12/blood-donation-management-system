import 'package:blood_donation_management_system/features/home/dashboard/widgets/donation_request_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/theme_getter.dart';
import '../../../../core/widgets/box_decoration.dart';

class DonationRequestCard extends StatelessWidget {
  const DonationRequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
      Container(
        padding: const EdgeInsets.all(8),
        height: 235,
            width: 175,
            decoration: boxDecoration(cardColor: colorScheme.secondary, shadowColor: customColors.disabled),
          child: DonationRequestWidget(title: "My\nDonations",value : 0),
      ),
      SizedBox(width: 10,),
      Container(padding: const EdgeInsets.all(16),
      height: 235,
      width: 175,
      decoration: boxDecoration(cardColor:colorScheme.secondary, shadowColor: customColors.disabled),
          child: DonationRequestWidget(title: "My\nRequests",value : 0)
      ),
      ],
      ),
    );
  }
}
