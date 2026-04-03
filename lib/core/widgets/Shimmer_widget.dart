import 'package:blood_donation_management_system/core/widgets/shimmer_box.dart';
import 'package:flutter/material.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Expanded(
      child: Column(children: [
        SizedBox(height: 20),
        Center(child: ShimmerBox(width: 350, height: 250)),
        SizedBox(height: 30),
        Expanded(child: Center(child: ShimmerBox(width: 350, height: double.infinity))),
      ],),
    ) ;
  }
}
