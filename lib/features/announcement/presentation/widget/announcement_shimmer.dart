import 'package:flutter/material.dart';
import '../../../../core/widgets/shimmer_box.dart';

class AnnouncementShimmer extends StatelessWidget {
  const AnnouncementShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const ShimmerBox(width: 150, height: 24),
            const SizedBox(height: 12),
            const ShimmerBox(width: double.infinity, height: 16),
            const SizedBox(height: 8),
            const ShimmerBox(width: 250, height: 16),
            const SizedBox(height: 24),

            // List of Card Shimmers
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: ShimmerCardLayout(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerCardLayout extends StatelessWidget {
  const ShimmerCardLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Shimmer
          const ShimmerBox(width: 30, height: 30),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title Shimmer
                const ShimmerBox(width: 120, height: 20),
                const SizedBox(height: 8),
                // Subtitle/Content Shimmer
                const ShimmerBox(width: double.infinity, height: 14),
                const SizedBox(height: 4),
                const ShimmerBox(width: 200, height: 14),
              ],
            ),
          ),
        ],
      ),
    );
  }
}