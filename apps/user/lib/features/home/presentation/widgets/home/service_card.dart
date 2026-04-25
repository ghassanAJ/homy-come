import 'package:design_system/design_system.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    required this.title,
    this.imageUrl,
    required this.onTap,
    super.key,
  });

  final String title;
  final VoidCallback onTap;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        // width: 150,
        child: AspectRatio(
          aspectRatio: 1.4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(UI.radius.md),
            child: Stack(
              alignment: AlignmentGeometry.bottomLeft,
              children: [
                /// 🌄 Image
                Positioned.fill(
                  child: UINetworkImage(imageUrl: imageUrl, fit: BoxFit.cover),
                ),

                /// 🌑 Gradient overlay (key for readability)
                // Positioned.fill(
                //   child: DecoratedBox(
                //     decoration: BoxDecoration(
                //       gradient: LinearGradient(
                //         begin: Alignment.topCenter,
                //         end: Alignment.bottomCenter,
                //         colors: [
                //           UIColor.black.withOpacity(0.0),
                //           UIColor.black.withOpacity(0.6),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),

                /// 🏷 Title with background
                Positioned(
                  // left: 8,
                  // right: 8,
                  // bottom: 8,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: UI.spacing.xs,
                      vertical: UI.spacing.xxs,
                    ),
                    decoration: BoxDecoration(
                      color: UIColor.black.withOpacity(0.19),
                      // borderRadius: BorderRadius.circular(UI.radius.sm),
                    ),
                    child: UIText.bodySmall(
                      title,
                      color: UIColor.white,
                      fontWeight: FontWeight.w700,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
