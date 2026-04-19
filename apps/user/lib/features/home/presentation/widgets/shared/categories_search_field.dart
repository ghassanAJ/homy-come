import 'package:design_system/design_system.dart';

class CategoriesSearchField extends StatelessWidget {
  const CategoriesSearchField({
    required this.controller,
    this.readOnly = false,
    this.onTap,
    this.placeholder = 'search by category',
    this.withIcon = true,
    super.key,
  });
  final bool readOnly;
  final bool withIcon;
  final TextEditingController controller;
  final VoidCallback? onTap;
  final String placeholder;
  @override
  Widget build(BuildContext context) {
    return AppTextField(
      onTap: onTap,
      readOnly: readOnly,
      borderRadius: BorderRadius.circular(UI.radius.xl),
      controller: controller,
      placeholder: placeholder,
      showClearButton: false,
      isFlat: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),

      prefixIcon:
          withIcon
              ? Icon(
                Icons.search,
                color: UIColor.textGray,
                // size: UI.sizes.iconMd,
              )
              : null,
    );
  }
}
