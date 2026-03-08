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
        width: 137,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(UI.radius.md),
              child: SizedBox(
                height: 128,
                width: double.infinity,
                child: UINetworkImage(
                  // TODO: Replace with real profile image URL from API/state.
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: UINetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: UI.spacing.xs),
            UIText.bodySmall(
              title,
              color: UIColor.grey,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
