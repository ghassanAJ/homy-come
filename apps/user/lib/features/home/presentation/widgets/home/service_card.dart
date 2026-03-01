import 'package:design_system/design_system.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({required this.title, this.imageUrl, super.key});

  final String title;

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 137,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(UI.radius.md),
            child: SizedBox(
              height: 128,
              width: double.infinity,
              child: UINetworkIamge(
                // TODO: Replace with real profile image URL from API/state.
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: UINetworkIamge(
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
    );
  }
}
