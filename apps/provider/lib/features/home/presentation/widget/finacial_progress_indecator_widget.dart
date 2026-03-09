
import 'dart:math';

import 'package:design_system/design_system.dart';

class FinancialProgressIndicator extends StatelessWidget {
  const FinancialProgressIndicator({
    super.key,
    required this.parentWidth,
  });

  final double parentWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: parentWidth * 0.1),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: parentWidth * 0.3,
            height: parentWidth * 0.3,
    
            child: Transform.rotate(
              angle: pi / 2,
              child: CircularProgressIndicator(
                value: 0.75,
                color: UIColor.background,
    
                strokeWidth: 12,
                backgroundColor: UIColor.bluepal.withAlpha(
                  102,
                ),
                strokeCap: StrokeCap.round,
              ),
            ),
          ),
          UIText.labelCircleProgerss(
            '75%',
            color: UIColor.background,
            fontFamily: UIFontFamily.almarai,
          ),
        ],
      ),
    );
  }
}
