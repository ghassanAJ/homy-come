import 'package:booking/booking.dart';

class ServiceOfferTile extends StatelessWidget {
  const ServiceOfferTile({
    super.key,

    required this.servicePreviewResponseModel,
    this.width = 335,
  });

  final double width;

  final ServicePreviewResponseModel servicePreviewResponseModel;

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
                  child: UINetworkIamge(
                    imageUrl: servicePreviewResponseModel.info.image,
                    fit: BoxFit.cover,
                  ),
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
                          children: List.generate(
                            servicePreviewResponseModel.rating,
                            (index) => Icon(
                              Icons.star,
                              size: 20,
                              color: UIColor.babyBlue,
                            ),
                          ),
                        ),
                        SizedBox(width: UI.spacing.xs),
                        UIText.bodyXSmall(
                          '(${servicePreviewResponseModel.reviewsCount} Reviews)',
                          color: UIColor.midnight,
                          fontWeight: FontWeight.w300,
                        ),
                      ],
                    ),

                    SizedBox(height: UI.spacing.xxs),
                    UIText.bodyMedium(
                      servicePreviewResponseModel.info.name ?? '',
                      color: UIColor.primaryDark,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: UI.spacing.xxs),
                    Row(
                      children: [
                        UIText.bodyMedium(
                          servicePreviewResponseModel.priceModel.newPrice
                              .toString(),
                          color: UIColor.midnight,
                          fontWeight: FontWeight.w300,
                        ),
                        SizedBox(width: UI.spacing.xs),
                        Text(
                          servicePreviewResponseModel.priceModel.currentPrice
                              .toString(),
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
