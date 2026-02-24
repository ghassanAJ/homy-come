import 'package:design_system/design_system.dart';

class ServiceCategoryChip extends StatelessWidget {
  const ServiceCategoryChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(UI.radius.md),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 64,
            width: 96,
            decoration: BoxDecoration(
              color: selected ? UIColor.softGreen1 : UIColor.neutral100,
              borderRadius: BorderRadius.circular(UI.radius.md),
            ),
            child: Icon(
              Icons.cleaning_services_outlined,
              color: selected ? UIColor.primaryDark : UIColor.neutral500,
            ),
          ),
          SizedBox(height: UI.spacing.xs),
          UIText.caption(
            label,
            textAlign: TextAlign.center,
            color: selected ? UIColor.textPrimary : UIColor.textSecondary,

            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
