import 'package:design_system/design_system.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return UIText.h6(title, color: UIColor.balck, maxLines: 2);
  }
}