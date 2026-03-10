
import 'package:design_system/design_system.dart';

class CallAndChatWidget extends StatelessWidget {
  const CallAndChatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:  EdgeInsets.all(UI.spacing.xxs),
              child: UISvg(Assets.icons.call),
            ),
            Padding(
              padding:  EdgeInsets.all(UI.spacing.xxs),
              child: UISvg(Assets.icons.chat),
            ),
          ],
        ),
      ),
    );
  }
}
