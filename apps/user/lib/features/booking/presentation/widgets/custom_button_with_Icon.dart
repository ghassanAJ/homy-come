
import 'package:design_system/design_system.dart';

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: UI.spacing.xs,
      ),
      decoration: BoxDecoration(
        color: UIColor.pink,
        borderRadius: BorderRadius.circular(UI.radius.md),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UIImage(Assets.images.checkMark1, wigth: null, height: null,),
          SizedBox(width: UI.spacing.xs),
          UIText.bodyMedium(
            'Added Service',
            fontWeight: FontWeight.w600,
            color: UIColor.background,
            fontFamily: 'Lexend',
          ),
        ],
      ),
    );
  }
}