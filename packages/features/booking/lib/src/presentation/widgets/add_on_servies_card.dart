import 'package:booking/src/presentation/widgets/custom_button_with_Icon.dart';
import 'package:design_system/design_system.dart';

class AddonServiceCard extends StatelessWidget {
  const AddonServiceCard({
    super.key,
    required this.title,
    required this.reviews,
    required this.price,
    required this.oldPrice,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String reviews;
  final String price;
  final String oldPrice;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    return Container(
      width: widthScreen * 0.5,
      decoration: BoxDecoration(
        color: UIColor.background,
        borderRadius: BorderRadius.circular(UI.radius.md),
        border: Border.all(color: UIColor.neutral100),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(UI.radius.md),
              ),
              child: Container(
                //  TODO : Use UINetworkImage
                width: double.infinity,
                color: UIColor.neutral100,
                child: UINetworkImage(
                  imageUrl:
                      //      'https://i.ibb.co/Xk4DRFtn/3a39546fa6e781e18a8f28ab571d4d0e6fb75834.png',
                      'https://i.ibb.co/vCPn6j6p/Home-Cleaning.jpg',
                  fit: BoxFit.contain,
                  // placeholder: (context, url) => Center(child: SizedBox()),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              UI.spacing.xs,
              UI.spacing.xs,
              UI.spacing.xs,
              UI.spacing.xxs,
            ),
            child: Row(
              children: [
                UISvg(Assets.icons.starBlue, color: UIColor.babyBlue),
                SizedBox(width: UI.spacing.xxs),
                Expanded(
                  child: UIText.bodyXXSmall(
                    reviews,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    // fontFamily: UIFonts.lexend,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: UI.spacing.sm),
            child: UIText.h6(title, color: UIColor.balck, maxLines: 2),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              UI.spacing.sm,
              UI.spacing.xs,
              UI.spacing.sm,
              UI.spacing.sm,
            ),
            child: Row(
              children: [
                UIPriceText(text: UIText.h3(price, color: UIColor.balck)),
                SizedBox(width: UI.spacing.xs),
                Text(
                  //TODO : use UIPriceText
                  oldPrice,
                  style: UI.text.bodyMedium.copyWith(
                    // fontFamily: UIFonts.lexend,
                    color: UIColor.neutral300,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: UI.sizes.avatarMd,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                UI.spacing.sm,
                0,
                UI.spacing.sm,
                UI.spacing.sm,
              ),
              child:
                  selected
                      ? GestureDetector(
                        onTap: onTap,
                        child: CustomButtonWithIconWidget(),
                      )
                      : UIButton.outlined(
                        label: 'Add',
                        expanded: true,
                        backgroundColor: UIColor.babyBlue,
                        borderColor: UIColor.babyBlue,
                        foregroundColor: UIColor.white,
                        onPressed: onTap,
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
