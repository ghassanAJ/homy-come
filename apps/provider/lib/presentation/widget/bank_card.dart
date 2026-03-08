import 'dart:math';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  const BankCard({super.key});

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.sizeOf(context).height;
    return Container(
      width: double.infinity,
      height: heightScreen * 0.18,

      decoration: BoxDecoration(
        color: const Color(0xFFADD8F7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final parentWidth = constraints.maxWidth;
          final parentHeight = constraints.maxHeight;

          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Positioned(
                  top: 2,
                  left: 2,
                  height: parentHeight * 0.3,
                  child: UIIamge(
                    assetPath: Assets.images.intersect1.path,

                    height: parentHeight * 0.3,
                  ),
                ),
                Positioned(
                  right: 1,
                  bottom: 2,

                  child: UIIamge(
                    assetPath: Assets.images.intersect.path,

                    height: parentHeight * 0.6,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: UI.spacing.lg,
                    horizontal: UI.spacing.lg,
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          UIText.h4('Finacial', color: UIColor.background),
                          SizedBox(height: UI.spacing.sm),
                          UIText.h4('220,304 AED'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class FinancialCard extends StatelessWidget {
  final String title;
  final String amount;
  final double percentage; // 0.0 to 1.0

  const FinancialCard({
    super.key,
    this.title = 'Financial',
    this.amount = '220,304 AED',
    this.percentage = 0.75,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF90CAF9), // أزرق فاتح
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          // الدائرة الزخرفية في الخلفية
          Positioned(
            bottom: -20,
            left: 80,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue[200]!.withOpacity(0.4),
              ),
            ),
          ),

          // المحتوى الرئيسي
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // النص
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF42A5F5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    amount,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

              // Circular Progress
              SizedBox(
                width: 90,
                height: 90,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // الدائرة
                    CustomPaint(
                      size: const Size(90, 90),
                      painter: _CircularProgressPainter(
                        progress: percentage,
                        backgroundColor: Colors.white,
                        progressColor: const Color(0xFF42A5F5),
                        strokeWidth: 8,
                      ),
                    ),
                    // النص بالوسط
                    Text(
                      '${(percentage * 100).toInt()}%',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Painter للدائرة
class _CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color backgroundColor;
  final Color progressColor;
  final double strokeWidth;

  _CircularProgressPainter({
    required this.progress,
    required this.backgroundColor,
    required this.progressColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // الخلفية البيضاء
    final bgPaint =
        Paint()
          ..color = backgroundColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, bgPaint);

    // التقدم
    final progressPaint =
        Paint()
          ..color = progressColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // يبدأ من فوق
      2 * pi * progress, // مقدار التقدم
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(_CircularProgressPainter old) => old.progress != progress;
}
