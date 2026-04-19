import 'package:design_system/design_system.dart';

class UIImage extends StatelessWidget {
  const UIImage(
    this.urlImage, {
    super.key,
    this.package,
    this.wigth,
    this.height,
    this.fit,
  });
  final String urlImage;
  final String? package;
  final double? wigth;
  final double? height;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      urlImage,
      width: wigth,
      height: height,
      fit: fit ?? BoxFit.cover,
      package: 'design_system',
    );
  }
}
