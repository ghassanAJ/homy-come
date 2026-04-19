import 'package:design_system/design_system.dart';

class FrequencyChangeSheetContent extends StatelessWidget {
  const FrequencyChangeSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520,
      width: double.infinity,
      decoration: BoxDecoration(
        color: UIColor.neutral100,
        borderRadius: BorderRadius.vertical(top: Radius.circular(UI.radius.xl)),
      ),
      // child: ListView(),
    );
  }
}
