import 'package:design_system/design_system.dart';

class UIBackground extends StatelessWidget {
  const UIBackground({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(
        gradient: const RadialGradient(
          center: Alignment.topLeft,
          radius: .9,
          colors: [UIColor.softGreen, UIColor.background],
        ),
      ),
      child: child,
    );
  }
}
