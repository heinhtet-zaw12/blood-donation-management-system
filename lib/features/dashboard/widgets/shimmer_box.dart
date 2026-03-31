import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerBox extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const ShimmerBox({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Shimmer(
        duration: const Duration(milliseconds: 1500),
        interval: const Duration(seconds: 0),
        color: Colors.white.withValues(alpha: 0.5),
        enabled: true,
        direction: const ShimmerDirection.fromLTRB(),
        child: Container(
          width: width,
          height: height,
          color: Colors.grey[300],
        ),
      ),
    );
  }
}