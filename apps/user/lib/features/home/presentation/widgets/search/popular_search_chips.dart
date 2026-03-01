import 'package:design_system/design_system.dart';

class PopularSearchChips extends StatelessWidget {
  const PopularSearchChips({
    required this.popularSearch,
    required this.selectedPopular,
    required this.onSelected,
    super.key,
  });

  final List<String> popularSearch;
  final String selectedPopular;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: UI.spacing.xs,
      runSpacing: UI.spacing.xs,
      children: _buildPopularSearchItems(),
    );
  }

  List<Widget> _buildPopularSearchItems() {
    return popularSearch.map((item) {
      final isSelected = item == selectedPopular;

      return GestureDetector(
        onTap: () => onSelected(item),
        child: Container(
          padding: UI.padding.userSearchChipContent,
          decoration: BoxDecoration(
            color: UIColor.white,
            borderRadius: BorderRadius.circular(UI.radius.full),
            border: Border.all(
              color:
                  isSelected
                      ? UIColor.neutral100.withValues(alpha: 0.3)
                      : UIColor.neutral100.withValues(alpha: 0.9),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: UIColor.black.withValues(alpha: 0.06),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: UIText.bodyMedium(
            item,
            color: isSelected ? UIColor.primary : UIColor.grey,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
      );
    }).toList();
  }
}
