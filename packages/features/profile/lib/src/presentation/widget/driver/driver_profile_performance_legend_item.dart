import 'package:design_system/design_system.dart';

class PerformanceLegendItem extends StatelessWidget {
  const PerformanceLegendItem({
    super.key,
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: UI.spacing.md,
          height: UI.spacing.md,
          margin: EdgeInsets.only(top: 2),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(UI.radius.xs),
          ),
        ),
        SizedBox(width: UI.spacing.xs),
        Expanded(
          child: UIText.bodyXSmall(
            label,
            color: UIColor.neutral800,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
