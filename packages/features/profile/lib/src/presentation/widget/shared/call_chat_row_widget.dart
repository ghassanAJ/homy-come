import 'package:design_system/design_system.dart';
import 'package:url_launcher/url_launcher.dart';

class CallAndChatWidget extends StatelessWidget {
  const CallAndChatWidget({super.key, required this.number});
  final String number;
  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri uri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                makePhoneCall(number);
              },
              child: Padding(
                padding: EdgeInsets.all(UI.spacing.xxs),
                child: UISvg(Assets.icons.call),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(UI.spacing.xxs),
              child: UISvg(Assets.icons.chat),
            ),
          ],
        ),
      ),
    );
  }
}
