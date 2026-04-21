import 'package:design_system/design_system.dart';
import 'package:util/src/contect_manager/content_manager.dart';

class ContactInfoCleaner extends StatelessWidget {
  const ContactInfoCleaner({
    super.key,
    required this.name,
    required this.image,
    required this.rate,
    required this.phoneNUmber,
  });
  final String name;
  final String image;
  final double rate;
  final String phoneNUmber;
  Future<void> contactUser(String phone) async {
    ContentManager.contactByWhatsApp(phone);
    ContentManager.contactByPhone(phone);
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
              imageUrl: image,

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
                  SizedBox(width: UI.spacing.xs),
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
                      contactUser(phoneNUmber);
                    },
                    child: Text(
                      '+$phoneNUmber',
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
