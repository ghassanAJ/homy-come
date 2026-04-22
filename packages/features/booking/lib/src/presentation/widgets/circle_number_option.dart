import 'package:design_system/design_system.dart';

class CircleNumberOptionWidget extends StatelessWidget {
  const CircleNumberOptionWidget({
    super.key,
    required this.value,
    required this.selected,
    required this.onTap,
  });

  final int value;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ? UIColor.babyPink : UIColor.background,
          border: Border.all(
            color: selected ? UIColor.pink : UIColor.neutral200,
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: UIText.bodyMedium(
          '$value',
          fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
          color: selected ? UIColor.pink : UIColor.balck,
          fontSize: selected ? 20 : null,
        ),
      ),
    );
  }
}
