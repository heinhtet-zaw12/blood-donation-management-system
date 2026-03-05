import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ArcPainter extends CustomPainter {
  final double progress; // 0 → 1

  ArcPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 10.0;
    final gapAngle = 0.2; // size of each gap

    final rect = Offset.zero & size;

    final startAngle = -pi / 2 + gapAngle / 2;

    final totalAngle = 2 * pi - gapAngle * 2;

    final redSweep = totalAngle * progress;
    final greySweep = totalAngle * (1 - progress);

    final redPaint = Paint()
      ..color = const Color(0xffFF2D3A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final greyPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // final debugPaint = Paint()
    //   ..color = Colors.red
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 1.0;
    //
    // canvas.drawRect(rect, debugPaint);


    // Red arc
    canvas.drawArc(
      rect.deflate(strokeWidth / 2),
      startAngle,
      redSweep,
      false,
      redPaint,
    );

    // Grey arc
    canvas.drawArc(
      rect.deflate(strokeWidth / 2),
      startAngle + redSweep + gapAngle,
      greySweep,
      false,
      greyPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}