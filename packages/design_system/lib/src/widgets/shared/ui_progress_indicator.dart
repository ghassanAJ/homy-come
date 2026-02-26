import 'package:design_system/design_system.dart';

class UIProgressIndicator extends StatelessWidget {
  const UIProgressIndicator({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(color ?? UIColor.primary),
      ),
    );
  }
}
