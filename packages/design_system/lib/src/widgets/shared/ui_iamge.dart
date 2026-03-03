import 'package:design_system/design_system.dart';

class UIIamge extends StatelessWidget {
  const UIIamge({
    required this.assetPath,
    super.key,
    this.package,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
  });

  final String assetPath;
  final String? package;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? placeholder;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      package: Assets.package,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (_, __, ___) => placeholder ?? _placeholder(),
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
