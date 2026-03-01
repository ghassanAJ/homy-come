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
          for (final item in items)
            Padding(
              padding: UI.padding.userHomeItemEndWithXxs,
              child: BaseCategoryItem(
                title: item.title,
                subtitle: item.description,
                iconPath: item.iconPath,
              ),
            ),
        ],
      ),
    );
  }
}
