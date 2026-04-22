import 'dart:developer';

import 'package:booking/booking.dart';
import 'package:go_router/go_router.dart';
import 'package:user/features/home/presentation/widgets/shared/base_category_item.dart';
import 'package:user/navigation/route.dart';

class HomeCategoriesRow extends StatelessWidget {
  const HomeCategoriesRow({required this.items, super.key});

  final List<ServiceCategoryModel> items;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var index = 0; index < items.length; index++)
            Padding(
              padding:
              // EdgeInsets.zero,
              UI.padding.userHomeItemStartAndEnd(isFirst: index == 0),
              child: BaseCategoryItem(
                onTap: () => _handleCategoryTap(context, items[index]),
                title: items[index].info.name,
                subtitle: '${items[index].servicesCount} services',
                iconPath: items[index].info.image ?? '',
              ),
            ),
        ],
      ),
    );
  }

  void _handleCategoryTap(BuildContext context, ServiceCategoryModel category) {
    final id = category.documentId;
    log('id: $id');
    final shellContext = StatefulNavigationShell.of(context).context;
    context.push(UserPaths.services, extra: {'id': id});
  }
}
