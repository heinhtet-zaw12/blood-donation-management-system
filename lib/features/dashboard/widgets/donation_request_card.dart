import 'package:blood_donation_management_system/features/dashboard/presentation/provider/dashboard_provier.dart';
import 'package:blood_donation_management_system/features/dashboard/widgets/donation_request_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/theme_getter.dart';
import '../../../../core/widgets/box_decoration.dart';

class DonationRequestCard extends ConsumerWidget {
  const DonationRequestCard({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final statistics = ref.watch(dashboardNotifierProvider).dashboardDataModel?.data?.statistics;
    final totalDonation = statistics?.totalDonations?.toInt();
    final totalRequest = statistics?.totalBloodRequests?.toInt();
    final colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            height: 235,
            width: 175,
            decoration: boxDecoration(cardColor: colorScheme.secondary, shadowColor: customColors.disabled),
            child: DonationRequestWidget(title: "My\nDonations",value : totalDonation!),
          ),
          SizedBox(width: 10,),
          Container(padding: const EdgeInsets.all(16),
              height: 235,
              width: 175,
              decoration: boxDecoration(cardColor:colorScheme.secondary, shadowColor: customColors.disabled),
              child: DonationRequestWidget(title: "My\nRequests",value : totalRequest!)
          ),
        ],
      ),
    );
  }
}