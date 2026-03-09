import 'package:design_system/design_system.dart';

class AboutAppShimmer extends StatelessWidget {
  const AboutAppShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _line(width: maxWidth),
            SizedBox(height: UI.spacing.sm),
            _line(width: maxWidth * 0.96),
            SizedBox(height: UI.spacing.sm),
            _line(width: maxWidth * 0.92),
            SizedBox(height: UI.spacing.sm),
            _line(width: maxWidth * 0.98),
            SizedBox(height: UI.spacing.sm),
            _line(width: maxWidth * 0.86),
            SizedBox(height: UI.spacing.sm),
            _line(width: maxWidth * 0.54),
          ],
        );
      },
    );
  }

  Widget _line({required double width}) {
    return ShimmerBox(
      width: width,
      height: UI.spacing.md,
      radius: UI.radius.xs,
    );
  }
}
