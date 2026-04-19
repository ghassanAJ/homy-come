import 'package:booking/booking.dart';
import 'package:go_router/go_router.dart';
import 'package:user/navigation/route.dart';

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
                  height: 160,
                  width: width,
                  child: UINetworkImage(
                    imageUrl: servicePreviewResponseModel.info?.image ?? '',
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
                        if (servicePreviewResponseModel.rating != null)
                          Row(
                            children: List.generate(
                              servicePreviewResponseModel.rating!,
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
                    UIText.bodySmall(
                      servicePreviewResponseModel.info?.name ?? '',
                      color: UIColor.primaryDark,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: UI.spacing.xxs),
                    if (servicePreviewResponseModel.priceModel != null)
                      UIPriceText(
                        oldPrice:
                            servicePreviewResponseModel.priceModel!.currentPrice
                                .toString(),
                        text: UIText.bodySmall(
                          servicePreviewResponseModel.priceModel!.newPrice
                              .toString(),
                          color: UIColor.midnight,
                          fontWeight: FontWeight.w400,
                        ),
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
              label: 'Book now',
              onTap: () {
                context.push(
                  UserPaths.serviceDetails,
                  extra: {'id': servicePreviewResponseModel.documentId},
                );
              },
              padding: EdgeInsets.symmetric(horizontal: UI.spacing.md),
              // width: 67,
              height: 36,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
