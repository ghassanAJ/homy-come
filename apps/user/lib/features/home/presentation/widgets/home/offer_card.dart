import 'package:design_system/design_system.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    required this.image,
    this.aspectRatio = 2 / 1,
    this.width = 272,
    super.key,
  });

  final String image;
  final double aspectRatio;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(UI.radius.md),
          child: _buildImage(),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return UINetworkIamge(
      // TODO: Replace with real image URL from API/state.
      imageUrl: image,
      fit: BoxFit.cover,
      placeholder: UINetworkIamge(imageUrl: image, fit: BoxFit.cover),
    );
  }
}
