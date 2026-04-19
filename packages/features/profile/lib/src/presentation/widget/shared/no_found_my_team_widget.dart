
import 'package:design_system/design_system.dart';

class NoFoundMyteamDataWidget extends StatelessWidget {
  const NoFoundMyteamDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: UIText.bodySmall('no found my team data ?!'),
    );
  }
}

