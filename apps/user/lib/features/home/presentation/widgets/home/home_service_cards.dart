import 'package:design_system/design_system.dart';
import 'package:user/features/home/domain/entities/home_content.dart';
import 'package:user/features/home/presentation/widgets/home/service_card.dart';

class HomeServiceCards extends StatelessWidget {
  const HomeServiceCards({required this.items, super.key});

  final List<HomeServiceItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: UI.padding.userHomeItemEndWithXxs,
          child: ServiceCard(title: item.title, imageUrl: item.imageUrl),
        );
      },
    );
  }
}
