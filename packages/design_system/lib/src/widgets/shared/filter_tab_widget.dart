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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isSelected
              ? SvgPicture.asset(
                  iconPath,
                  key: ValueKey(iconPath),
                  height: 18,
                  width: 18,
                  color: UIColor.primary,
                  package: package,
                )
              : const SizedBox.shrink(),
          if (isSelected) const SizedBox(width: 4),
          UIText.bodyMedium(
            text,
            color: isSelected ? UIColor.primary : UIColor.neutral500,
          ),
        ],
      ),
    );
  }
}
