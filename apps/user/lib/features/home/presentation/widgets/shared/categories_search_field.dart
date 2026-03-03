import 'package:design_system/design_system.dart';

class CategoriesSearchField extends StatelessWidget {
  const CategoriesSearchField({
    required this.controller,
    this.readOnly = false,
    this.onTap,
    super.key,
  });
  final bool readOnly;
  final TextEditingController controller;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return AppTextField(
      onTap: onTap,
      readOnly: readOnly,
      borderRadius: BorderRadius.circular(UI.radius.xl),
      controller: controller,
      placeholder: 'search by category',
      showClearButton: false,
      isFlat: true,
      contentPadding: UI.padding.userSearchFieldContent,
      // prefixIcon: Icon(
      //   Icons.menu_rounded,
      //   color: UIColor.neutral700,
      //   size: UI.sizes.iconMd,
      // ),
      suffixIcon: Icon(
        Icons.search,
        color: UIColor.neutral700,
        size: UI.sizes.iconMd,
      ),
    );
  }
}
