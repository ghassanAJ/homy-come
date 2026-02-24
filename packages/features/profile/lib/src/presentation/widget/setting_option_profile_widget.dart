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
        contentPadding: EdgeInsets.only(bottom: UI.spacing.sm),
        trailing: customTrailing ?? UISvg( Assets.icons.right),
        leading: _buildProfileIcon(
          isSvgIcon: isSvgIcon,
          imgUrl: imgUrl,
          color: color,
          colorIcon: colorIcon,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIText.headerBody(title),
            SizedBox(height: UI.spacing.xxs),
            if (descreption != null)
              UIText.bodyXSmall(
                descreption!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                color: UIColor.textGray,
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
    Color? colorIcon,
  }) {///add TODO comment: use [UIIconBackground]
    if (isSvgIcon) {
      return Container(
        width: UI.sizes.avatarMd,
        height: UI.sizes.avatarMd,
        decoration: BoxDecoration(
          color: color ?? UIColor.neutral25,
          shape: BoxShape.circle,
        ),
        padding:  EdgeInsets.all(UI.spacing.xxs),
        child: SvgPicture.asset(
          imgUrl,
          colorFilter: ColorFilter.mode(
            colorIcon ?? UIColor.grey,
            BlendMode.srcIn,
          ),
        ),
      );
    }

    return Avatar(
      assetPath: imgUrl,
      placeholderWidget: Container(
        color: color,
        child: Padding(
          padding: EdgeInsets.all(UI.sizes.iconXXs),
          child: SizedBox(
            child: SvgPicture.asset(
              imgUrl,
              colorFilter: ColorFilter.mode(
                colorIcon ?? UIColor.grey,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

