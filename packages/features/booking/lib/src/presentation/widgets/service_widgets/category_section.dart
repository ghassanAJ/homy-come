import 'package:booking/src/presentation/screens/example_data.dart';
import 'package:design_system/design_system.dart';

class CategorySection<T> extends StatelessWidget {
  const CategorySection({
    super.key,
    required this.category,
    required this.itemBuilder,
  });

  final CategorySectionData<T> category;

  final CategoryItemBuilder<T> itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      color: UIColor.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTileHeader(context),
          const SizedBox(height: 16.0),
          _buildItemsList(context),
        ],
      ),
    );
  }

  Widget _buildItemsList(BuildContext context) {
    return Column(
      children: List.generate(category.items.length, (index) {
        final item = category.items[index];
        // bool isLastIndex = index == category.items.length - 1;
        return itemBuilder(context, item, index);
      }),
    );
  }

  Widget _buildSectionTileHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        _sectionTitle(context),
        // const SizedBox(height: 8.0),
        // category.subtitle != null
        //     ? _sectionSubtitle(context)
        //     : const SizedBox(),
        // const SizedBox(height: 16),
      ],
    );
  }

  Widget _sectionTitle(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(color: UIColor.bordarCard),
      child: UIText.bodyMedium(
        category.title,
        fontWeight: FontWeight.w700,
        // style: _textTheme(context).titleLarge,
        // strutStyle: Helper.buildStrutStyle(_textTheme(context).titleLarge),
      ),
    );
  }

  Widget _sectionSubtitle(BuildContext context) {
    return Text(
      category.subtitle,
      style: _textTheme(context).titleSmall,
      strutStyle: buildStrutStyle(_textTheme(context).titleSmall),
    );
  }

  Widget _buildFoodImage(String url) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/images/transparent.png',
      image: url,
      width: 64,
    );
  }

  Widget _buildFoodDetail({required BuildContext context, required Food food}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(food.name, style: _textTheme(context).titleMedium),
        const SizedBox(height: 16),
        Row(
          children: [
            Text(
              "មកពី${food.price} ",
              style: _textTheme(context).bodySmall,
              strutStyle: buildStrutStyle(_textTheme(context).bodySmall),
            ),
            Text(
              food.comparePrice,
              strutStyle: buildStrutStyle(_textTheme(context).bodySmall),
              style: _textTheme(
                context,
              ).bodySmall?.copyWith(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: 8.0),
            if (food.isHotSale) _buildFoodHotSaleIcon(),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionHoteSaleIcon() {
    return Container(
      margin: const EdgeInsets.only(right: 4.0),
      child: Icon(Icons.whatshot, color: UIColor.primary, size: 20.0),
    );
  }

  Widget _buildFoodHotSaleIcon() {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: UIColor.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Icon(Icons.whatshot, color: UIColor.primary, size: 16.0),
    );
  }

  TextTheme _textTheme(BuildContext context) => Theme.of(context).textTheme;

  StrutStyle buildStrutStyle(TextStyle? textStyle) {
    return StrutStyle(
      forceStrutHeight: true,
      fontWeight: textStyle?.fontWeight,
      fontSize: textStyle?.fontSize,
      fontFamily: textStyle?.fontFamily,
      fontStyle: textStyle?.fontStyle,
      fontFamilyFallback: textStyle?.fontFamilyFallback,
      debugLabel: textStyle?.debugLabel,
    );
  }
}
