import 'package:design_system/design_system.dart';

class CategoriesSearchField extends StatelessWidget {
  const CategoriesSearchField({required this.controller, super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      borderRadius: BorderRadius.circular(UI.radius.xl),
      controller: controller,
      placeholder: 'Hinted search text',
      showClearButton: false,
      isFlat: true,
      contentPadding: UI.padding.userSearchFieldContent,
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
