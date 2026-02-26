import 'package:design_system/design_system.dart';

class CancellationSheetContent extends StatelessWidget {
  const CancellationSheetContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520,
      width: double.infinity,
      decoration: BoxDecoration(
        color: UIColor.neutral100,
        borderRadius: BorderRadius.vertical(top: Radius.circular(UI.radius.xl)),
      ),
    );
  }
}