import 'package:design_system/design_system.dart';

class CategoriesSearchField extends StatelessWidget {
  const CategoriesSearchField({required this.controller, super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      placeholder: 'Hinted search text',
      showClearButton: false,
      prefixIcon: Icon(
        Icons.menu_rounded,
        color: UIColor.neutral700,
        size: UI.sizes.iconMd,
      ),
      suffixIcon: Icon(
        Icons.search,
        color: UIColor.neutral700,
        size: UI.sizes.iconMd,
      ),
    );
  }
}
