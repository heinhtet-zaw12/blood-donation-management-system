import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/features/home/data/blood_availability_data.dart';
import 'package:flutter/material.dart';

class BloodAvailabilityCard extends StatelessWidget {
  const BloodAvailabilityCard({super.key});

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 1
      ),
      itemCount: bloodAvailability.length,
      itemBuilder: (context, index) {
        final card = bloodAvailability[index];
        return Container(
          padding: const EdgeInsets.all(8),
          height: 50,
          width: 56,
          decoration: boxDecoration(
            cardColor: colorScheme.secondary,
            shadowColor: colorScheme.primary,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
            
                Text(
                  card.bloodType,
                  textAlign: TextAlign.center,
                  style: textTheme.subTitle.copyWith(color: colorScheme.primary),
                ),
            
                Text(
                  "${card.availabilityCount}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Roboto',fontSize:  11 , fontWeight:  FontWeight.w500)
                ),

                Text(
                  true ? "Available" : "UnAvailable",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Roboto',fontSize:  11 , fontWeight:  FontWeight.w500)
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}