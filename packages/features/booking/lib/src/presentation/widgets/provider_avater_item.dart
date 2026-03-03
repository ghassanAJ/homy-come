import 'package:design_system/design_system.dart';

class ProviderAvatarItem extends StatelessWidget {
  const ProviderAvatarItem({
    super.key,
    required this.name,
    required this.rating,
    required this.selected,
    required this.onTap,
  });

  final String name;
  final String rating;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: UI.sizes.avatarxL,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: UI.sizes.avatarxL,
                  width: UI.sizes.avatarxL,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: UIColor.neutral100,
                  ),
                ),
                Positioned(
                  // right: 2,
                  // bottom: 2,
                  child: Stack(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        width: UI.spacing.lg,
                        height: UI.spacing.lg,
                        decoration: BoxDecoration(
                          color:
                              selected ? UIColor.softGreen : UIColor.background,
                          shape: BoxShape.circle,
                          boxShadow: UI.shadows.xxs,
                        ),
                      ),
                      if (selected)
                        Positioned(
                          left: 2,
                          bottom: 2,
                          child: UIImage(
                            Assets.images.checkMark1.path,
                            wigth: UI.sizes.iconMd,
                            height: UI.sizes.iconMd,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: UI.spacing.xxs),
            UIText.bodyMedium(
              name,
              color: UIColor.balck,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, size: 12, color: UIColor.warning),
                SizedBox(width: 2),
                UIText.inputError(rating, color: UIColor.warning),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
