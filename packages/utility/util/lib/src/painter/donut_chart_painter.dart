import 'dart:math' as math;

import 'package:flutter/material.dart';

class DonutSegment {
  const DonutSegment({required this.color, required this.ratio});

  final Color color;
  final double ratio;
}

class DonutChartPainter extends CustomPainter {
  const DonutChartPainter({
    required this.segments,
    required this.strokeWidth,
    this.gapPx = 4.0,
  });

  final List<DonutSegment> segments;
  final double strokeWidth;
  final double gapPx;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (math.min(size.width, size.height) - strokeWidth) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final paint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.butt;

    final gapAngle = gapPx / radius;
    var startAngle = -math.pi / 2;

    for (final segment in segments) {
      final fullSweep = 2 * math.pi * segment.ratio;
      final sweep = fullSweep - gapAngle;

      if (sweep <= 0) {
        startAngle += fullSweep;
        continue;
      }

      paint.color = segment.color;
      canvas.drawArc(rect, startAngle + (gapAngle / 2), sweep, false, paint);
      startAngle += fullSweep;
    }
  }

  @override
  bool shouldRepaint(covariant DonutChartPainter oldDelegate) => true;
}
