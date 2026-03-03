import 'package:design_system/design_system.dart';

class NoOrderFoundWidget extends StatelessWidget {
  const NoOrderFoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Center(
        child: UIText.bodySmall(
          'no data order found',
        ),
      ),
    );
  }
}