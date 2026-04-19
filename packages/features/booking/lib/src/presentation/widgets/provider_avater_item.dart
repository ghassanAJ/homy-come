import 'package:design_system/design_system.dart';

class ProviderAvatarItem extends StatelessWidget {
  const ProviderAvatarItem({
    super.key,
    required this.name,
    required this.image,
    required this.rating,
    required this.selected,
    required this.onTap,
  });

  final String image;
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScale(
              scale: selected ? 1.05 : 1.0,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomRight,
                children: [
                  // 👤 Avatar with animated border
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOut,
                    height: UI.sizes.avatarxL,
                    width: UI.sizes.avatarxL,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: UIColor.neutral100,
                      border: Border.all(
                        color: selected ? UIColor.primary : Colors.transparent,
                        width: 2,
                      ),
                      boxShadow:
                          selected
                              ? [
                                BoxShadow(
                                  color: UIColor.primary.withValues(
                                    alpha: 0.25,
                                  ),
                                  blurRadius: 12,
                                  spreadRadius: 2,
                                ),
                              ]
                              : [],
                    ),
                    child: ClipOval(
                      child: UINetworkImage(
                        imageUrl: image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  // ✅ Selection indicator
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOut,
                      width: UI.spacing.md,
                      height: UI.spacing.md,
                      decoration: BoxDecoration(
                        color:
                            selected ? UIColor.softGreen : UIColor.background,
                        shape: BoxShape.circle,
                        boxShadow: UI.shadows.xxs,
                      ),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(
                            scale: animation,
                            child: FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                          );
                        },
                        child:
                            selected
                                ? UIImage(
                                  Assets.images.checkMark1.path,
                                  key: const ValueKey('check'),
                                  wigth: UI.sizes.iconMd,
                                  height: UI.sizes.iconMd,
                                  fit: BoxFit.contain,
                                )
                                : const SizedBox(key: ValueKey('empty')),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: UI.spacing.xxs),

            // 📝 Name (slight emphasis when selected)
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: UI.text.bodyMedium.copyWith(
                color: UIColor.balck,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              ),
              child: Text(name, maxLines: 1, overflow: TextOverflow.ellipsis),
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
