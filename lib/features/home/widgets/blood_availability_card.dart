import 'package:blood_donation_management_system/core/theme/theme_getter.dart';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/features/home/model/blood_availability_model.dart';
import 'package:flutter/material.dart';

class BloodAvailabilityCard extends StatelessWidget {
  const BloodAvailabilityCard({super.key, required this.bloodAvailabilityData, required this.crossAsixCount});
    final List<BloodAvailabilityModel> bloodAvailabilityData;
    final int crossAsixCount;


  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
   
    return GridView.builder(
      padding: crossAsixCount == 3
    ? const EdgeInsets.all(10)
    : const EdgeInsets.symmetric(horizontal: 65,vertical: 10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAsixCount,
        crossAxisSpacing: crossAsixCount==3 ? 20.0 : 30.0,
        mainAxisSpacing: 20.0,
        childAspectRatio: 0.95
      ),
      itemCount: bloodAvailabilityData.length,
      itemBuilder: (context, index) {
        final card = bloodAvailabilityData[index];
        return Container(
          padding: const EdgeInsets.all(12),
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
                  card.availability==true ? "Available" : "UnAvailable",
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