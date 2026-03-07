
import 'package:design_system/design_system.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfoCleaner extends StatelessWidget {
  const ContactInfoCleaner({
    super.key,
    required this.name,
    required this.rate,
  });
  final String name;
  final double rate;
  Future<void> contactUser(String phone) async {
    final String whatsappNumber = phone.replaceAll(RegExp(r'[^0-9]'), '');
  final Uri callUri = Uri.parse('tel:$phone');
    final Uri whatsappUri = Uri.parse("https://wa.me/$whatsappNumber");

    if (!await launchUrl(whatsappUri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch WhatsApp');
    }    else if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri, mode: LaunchMode.externalApplication);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(UI.spacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: UI.sizes.inputHeight,
            height: UI.sizes.inputHeight,
            child: Avatar(
              size: AvatarSize.large,
              imageUrl: '',
              placeholderWidget: Container(
                color: UIColor.backgroungSilverLight,
              ),
            ),
          ),
          SizedBox(width: UI.spacing.xs),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  UIText.bodyMedium(name),
                  SizedBox(width: UI.spacing.xxs),
                  Row(
                    children: [
                      UISvg(Assets.icons.star, color: UIColor.warning),
                      UIText.bodyXSmall('$rate', color: UIColor.warning),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: UI.sizes.iconSm,
                    height: UI.sizes.iconSm,
                    child: UIIamge(assetPath: Assets.images.phoneCall21.path),
                  ),
                  SizedBox(width: UI.spacing.xxs),
                  GestureDetector(
                    onTap: () {
                      // _contactUser('+963991212193');
                      contactUser('963991212193');
                    },
                    child: Text(
                      '+999 123 456 789',
                      style: UI.text.bodySmall.copyWith(
                        decoration: TextDecoration.underline,
                        color: UIColor.successBright,
                        decorationColor: UIColor.successBright,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
