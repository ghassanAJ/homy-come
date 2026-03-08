import 'package:design_system/design_system.dart';

class UINetworkImage extends StatelessWidget {
  const UINetworkImage({
    required this.imageUrl,
    super.key,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
  });

  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? placeholder;

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.trim().isEmpty) {
      return placeholder ?? _placeholder();
    }

    return Image.network(
      imageUrl!,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(child: _loadingBuilder());
      },
      errorBuilder: (_, __, ___) => placeholder ?? _placeholder(),
    );
  }

  Widget _loadingBuilder() {
    return Container(
      color: UIColor.neutral100,
      alignment: Alignment.center,
      width: double.infinity,
    );
  }

  Widget _placeholder() {
    return Container(
      color: UIColor.neutral100,
      alignment: Alignment.center,
      child: const Icon(
        Icons.image_not_supported_outlined,
        color: UIColor.neutral300,
      ),
    );
  }
}
