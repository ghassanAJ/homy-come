import 'package:design_system/design_system.dart';
import 'package:user/features/home/domain/entities/home_content.dart';
import 'package:user/features/home/presentation/widgets/shared/base_category_item.dart';

class HomeCategoriesRow extends StatelessWidget {
  const HomeCategoriesRow({required this.items, super.key});

  final List<HomeCategoryItem> items;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var index = 0; index < items.length; index++)
            Padding(
              padding: UI.padding.userHomeItemStartAndEnd(isFirst: index == 0),
              child: BaseCategoryItem(
                title: items[index].title,
                subtitle: items[index].description,
                iconPath: items[index].iconPath,
              ),
            ),
        ],
      ),
    );
  }
}
