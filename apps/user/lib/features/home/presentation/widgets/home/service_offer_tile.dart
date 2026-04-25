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
    return GestureDetector(
      onTap: () {
        context.push(
          UserPaths.serviceDetails,
          extra: {'id': servicePreviewResponseModel.documentId},
        );
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Stack(
          alignment: Alignment.bottomLeft,

          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: UINetworkImage(
                  imageUrl: servicePreviewResponseModel.info?.image ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: UI.spacing.xs,
                vertical: UI.spacing.xxs,
              ),
              decoration: BoxDecoration(
                color: UIColor.black.withOpacity(0.19),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  UIText.bodySmall(
                    servicePreviewResponseModel.info?.name ?? '',
                    color: UIColor.white,
                    fontWeight: FontWeight.w700,
                  ),

                  // if (servicePreviewResponseModel.priceModel != null)
                  //   Row(
                  //     children: [
                  //       UIText.bodySmall('Start from ', color: UIColor.white),
                  //       UIPriceText(
                  //         text: UIText.bodySmall(
                  //           servicePreviewResponseModel.priceModel!.newPrice
                  //               .toString(),
                  //           color: UIColor.white,
                  //           fontWeight: FontWeight.w400,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
