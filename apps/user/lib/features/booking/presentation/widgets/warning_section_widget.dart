
import 'package:design_system/design_system.dart';

class WaringSectionWidget extends StatelessWidget {
  const WaringSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical:  UI.spacing.sm,horizontal: UI.spacing.xl),
      color: UIColor.neutral100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
  UISvg(Assets.icons.info,color: UIColor.black,),
          SizedBox(width: UI.spacing.xs),
          Expanded(
            child: UIText.inputPlaceholder(
              'You can cancel your order for free if the cancellation is made 6 hours before the scheduled start time of the booking.',
              color: UIColor.grey,
            ),
          ),
        ],
      ),
    );
  }
}


