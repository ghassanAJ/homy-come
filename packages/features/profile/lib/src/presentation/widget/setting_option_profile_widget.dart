import 'package:design_system/design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileSettingOptionWidget extends StatelessWidget {
  const ProfileSettingOptionWidget({
    super.key,
    required this.title,
    this.descreption,
    this.customTrailing,
    this.onTap,
    required this.imgUrl,
    this.color = UIColor.neutral25,
    this.isSvgIcon = false,
    this.colorIcon,
  });
  final String title;
  final String? descreption;
  final Widget? customTrailing;
  final Function()? onTap;
  final String imgUrl;
  final UIColor? color;
  final UIColor? colorIcon;
  final bool isSvgIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        contentPadding: UI.padding.profileSettingOptionContentPadding,
        trailing: Padding(
          padding: UI.padding.profileSettingOptionTrailingEnd,
          child:
              customTrailing ??
              UISvg(Assets.icons.right, matchTextDirection: true),
        ),
        leading: _buildProfileIcon(
          isSvgIcon: isSvgIcon,
          imgUrl: imgUrl,
          color: color,
          colorIcon: colorIcon,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIText.headerBody(title, fontFamily: UIFontFamily.dmSans),
            SizedBox(height: UI.spacing.xxs),
            if (descreption != null)
              UIText.bodyXSmall(
                descreption!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                color: UIColor.textGray,
                fontFamily: UIFontFamily.dmSans,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileIcon({
    required bool isSvgIcon,
    required String imgUrl,
    Color? color,
    UIColor? colorIcon,
  }) {
    if (isSvgIcon) {
      return UIIconBackground(
        size: UI.sizes.avatarMd,
        iconSize: UI.sizes.avatarMd,
        backgroundColor: color ?? UIColor.charcoal,
        child: UISvg(imgUrl, color: colorIcon ?? UIColor.grey),
      );
    }

    return Avatar(
      assetPath: imgUrl,
      placeholderWidget: Container(
        color: color,
        child: Padding(
          padding: UI.padding.profileSettingOptionIconContent,
          child: SizedBox(
            child: SvgPicture.asset(
              imgUrl,
              colorFilter: ColorFilter.mode(
                colorIcon ?? UIColor.charcoal,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
