import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:user/navigation/route.dart';

class StepNavigationBar extends StatelessWidget {
  const StepNavigationBar({super.key, required this.next});
  final Function next;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(UI.spacing.md),
      decoration: BoxDecoration(
        color: UIColor.background,
        borderRadius: BorderRadius.circular(UI.radius.lg),
        boxShadow: UI.shadows.cardMd,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Total 78.00 AED',
                  style: UI.text.bodyMedium.copyWith(
                    color: UIColor.textSliverLight,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: UIColor.textSliverLight,
                  ),
                ),
                UIText.h6('48.00AED', color: UIColor.balck),
              ],
            ),
          ),
          SizedBox(
            // width: 128,
            child: UIButton.primary(
              label: 'Next',
              // expanded: true,
              onPressed: () {
                next();
              },
            ),
          ),
        ],
      ),
    );
  }
}
