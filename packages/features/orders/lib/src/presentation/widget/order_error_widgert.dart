
import 'package:design_system/design_system.dart';

class OrdersErrorWidget extends StatelessWidget {
  const OrdersErrorWidget({
    super.key,
    required this.message,
    required this.onTap,
  });
  final String message;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UIText.bodyMedium(message),
          SizedBox(height: UI.spacing.xs),
          GestureDetector(
            onTap: onTap,
            child: UIText.bodySmall('retry agian', color: UIColor.babyBlue),
          ),
        ],
      ),
    );
  }
}