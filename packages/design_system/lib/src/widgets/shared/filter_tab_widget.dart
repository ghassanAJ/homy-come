import 'package:flutter_svg/svg.dart';

import '../../../design_system.dart';

class FilterTabWidget extends StatelessWidget {
  const FilterTabWidget({
    super.key,
    required this.isSelected,
    required this.text,
    required this.iconPath,
    required this.package,
  });

  final String text;
  final String iconPath;
  final bool isSelected;
  final String package;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 250),
      // curve: Curves.easeOutBack,
      scale: isSelected ? 1.0 : 0.9,
      child: Container(
              // margin: EdgeInsets.symmetric(horizontal: UI.spacing.xxs),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: UI.spacing.sm,
          vertical: UI.spacing.xs,
        ),
        decoration: BoxDecoration(
          boxShadow: UI.shadows.xs,
          color:
              isSelected
                  ?  UIColor.babyBlue
                  :  UIColor.neutral100,
          borderRadius: BorderRadius.circular(UI.radius.sm),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            UIText.bodySmall(
              text,
              color: UIColor.black,
            ),
          ],
        ),
      ),
    );
  }
}
