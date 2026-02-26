
import 'package:design_system/design_system.dart';

class CircleNumberOption extends StatelessWidget {
  const CircleNumberOption({
    required this.value,
    required this.selected,
    required this.onTap,
  });

  final int value;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: UI.sizes.avatarMd,
        height: UI.sizes.avatarMd,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ? UIColor.softGreen : UIColor.background,
          border: Border.all(
            color: selected ? UIColor.softGreen : UIColor.neutral200,
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: UIText.bodyMedium(
          '$value',
          fontWeight: FontWeight.w600,
          color: selected ? UIColor.background : UIColor.balck,
        ),
      ),
    );
  }
}
