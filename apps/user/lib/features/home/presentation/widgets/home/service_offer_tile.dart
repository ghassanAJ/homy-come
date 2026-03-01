import 'package:design_system/design_system.dart';

class ServiceOfferTile extends StatelessWidget {
  const ServiceOfferTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.reviewsCount,
    required this.ratingStars,
    this.width = 335,
  });

  final String imageUrl;
  final String title;
  final String price;
  final String oldPrice;
  final int reviewsCount;
  final List<bool> ratingStars;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: UIColor.neutral000,
        borderRadius: BorderRadius.circular(UI.radius.md),
        border: Border.all(color: UIColor.border),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(UI.radius.md),
                ),
                child: SizedBox(
                  height: 128,
                  width: width,
                  child: UINetworkIamge(imageUrl: imageUrl, fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: UI.padding.userHomeServiceOfferTileContent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Row(
                          children: ratingStars
                              .map(
                                (isFilled) => Icon(
                                  isFilled ? Icons.star : Icons.star_border,
                                  size: 20,
                                  color: UIColor.babyBlue,
                                ),
                              )
                              .toList(growable: false),
                        ),
                        SizedBox(width: UI.spacing.xs),
                        UIText.bodyXSmall(
                          '($reviewsCount Reviews)',
                          color: UIColor.midnight,
                          fontWeight: FontWeight.w300,
                        ),
                      ],
                    ),

                    SizedBox(height: UI.spacing.xxs),
                    UIText.bodyMedium(
                      title,
                      color: UIColor.primaryDark,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: UI.spacing.xxs),
                    Row(
                      children: [
                        UIText.bodyMedium(
                          price,
                          color: UIColor.midnight,
                          fontWeight: FontWeight.w300,
                        ),
                        SizedBox(width: UI.spacing.xs),
                        Text(
                          oldPrice,
                          style: UI.text.bodyMedium.copyWith(
                            color: UIColor.neutral400,
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: UIColor.neutral400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          PositionedDirectional(
            bottom: UI.spacing.xs,
            end: UI.spacing.sm,
            child: UIActionButton(
              label: 'Add',
              onTap: () {},
              width: 67,
              height: 40,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
