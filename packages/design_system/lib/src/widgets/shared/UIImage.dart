import 'package:design_system/design_system.dart';

class UIImage extends StatelessWidget {
  const UIImage(
    this.urlImage, {
    super.key,
    this.package,
    this.wigth,
    this.height,
  });
  final String urlImage;
  final String? package;
  final double? wigth;
  final double? height;
  @override
  Widget build(BuildContext context) {
    // return urlImage.image(package: 'design_system', fit: BoxFit.contain,width:wigth,height: height );
    return Image.asset(urlImage,width: wigth,height: height,package: 'design_system',);
  }
}
