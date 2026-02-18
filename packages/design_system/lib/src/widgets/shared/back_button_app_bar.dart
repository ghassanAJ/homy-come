
import 'package:design_system/design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';

class backButtonAppBar extends StatelessWidget {
  const backButtonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24),
      padding: EdgeInsets.all(5),
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: UIColor.neutral100,
      ),
         child: SvgPicture.asset(Assets.icons.arrowLeft,package:  "design_system",color: UIColor.black,),
      // child: UIButton.icon(onPressed: () {}, icon: Icons.arrow_back_ios),
    );
  }
}
