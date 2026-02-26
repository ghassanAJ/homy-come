import 'package:design_system/design_system.dart';

class DateItemWidget extends StatelessWidget {
  const DateItemWidget({
    required this.day,
    required this.weekDay,
    required this.selected,
    required this.onTap,
  });

  final String day;
  final String weekDay;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: UI.sizes.avatarLg,
        child: Column(
          children: [
            Container(
              width: UI.sizes.avatarLg,
              height: UI.sizes.avatarLg,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected ? UIColor.softGreen : UIColor.background,
                border: Border.all(
                  color: selected ? UIColor.softGreen : UIColor.softgrey,
                ),
              ),
              alignment: Alignment.center,
              child: UIText.h3(
                day,
                color: selected ? UIColor.background : UIColor.balck,
              ),
            ),
            SizedBox(height: UI.spacing.xxs),
            UIText.bodyMediumRoboto(weekDay, color: UIColor.balck),
          ],
        ),
      ),
    );
  }
}
