import 'package:design_system/design_system.dart';

class UIImage extends StatelessWidget {
  const UIImage(this.urlImage, {super.key, this.package, required this.wigth, required this.height});
  final AssetGenImage urlImage;
  final String? package;
  final double? wigth;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return urlImage.image(package: 'design_system', fit: BoxFit.contain,width:wigth,height: height );
  }
}
