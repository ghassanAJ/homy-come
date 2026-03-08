import 'package:design_system/design_system.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({
    super.key,
    required this.title,
    required this.amount,
    this.isTotal = false,
  });

  final String title;
  final String amount;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: UI.spacing.sm),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: UIColor.backgroungSwitchUnactive),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: UIText.bodySmall(
              title,
              color: UIColor.balck,
              fontWeight: FontWeight.w600,
            ),
          ),
          UIPriceText(
            text: UIText.bodySmall(
              amount,
              color: UIColor.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
