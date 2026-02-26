import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CategoriesSearchField extends StatelessWidget {
  const CategoriesSearchField({
    required this.controller,
    super.key,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: UIColor.neutral100,
        borderRadius: BorderRadius.circular(UI.radius.xl),
      ),
      padding: UI.padding.userSearchFieldContent,
      child: Row(
        children: [
          Icon(
            Icons.menu_rounded,
            color: UIColor.neutral700,
            size: UI.sizes.iconMd,
          ),
          SizedBox(width: UI.spacing.sm),
          Expanded(
            child: TextField( // TODO: Replace with AppTextField when it supports the current design
              controller: controller,
              textInputAction: TextInputAction.search,
              style: UI.text.bodyMedium.copyWith(color: UIColor.neutral700),
              decoration: InputDecoration(
                hintText: 'Hinted search text',
                hintStyle: UI.text.bodyMedium.copyWith(color: UIColor.neutral700),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          Icon(Icons.search, color: UIColor.neutral700, size: UI.sizes.iconMd),
        ],
      ),
    );
  }
}

