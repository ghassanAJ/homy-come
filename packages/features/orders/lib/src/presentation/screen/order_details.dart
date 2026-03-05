import 'package:design_system/design_system.dart';
import 'package:flutter/widgets.dart';
import 'package:orders/src/presentation/screen/today_schedule_screen.dart';
import 'package:orders/src/presentation/widget/data_and_time_info_order_widget.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final topContentPadding =
        MediaQuery.paddingOf(context).top + kToolbarHeight + UI.spacing.md;
    return UIScaffold(
      appBar: UIAppBar(
        titleWidget: UIText.h4('Order Details'),
        leading: BackButtonAppBar(),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          UI.spacing.lg,
          topContentPadding,
          UI.spacing.lg,
          0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [UIText.h4('Service Details'), OrderStatusWidget()],
            ),
            SizedBox(height: UI.spacing.sm),
            Container(
              padding: EdgeInsets.all(UI.spacing.xxs),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(UI.radius.md),
                border: Border.all(color: UIColor.softBordarCard),
                color: UIColor.background,
              ),
              child: Column(
                children: [
                  InfoCleanerWithNumberPhone(),
                  Divider(height: 0.1, color: UIColor.softBordarCard),
                  OrderDateTimeWidget(date: '', time: '',),
                  Divider(height: 0.1, color: UIColor.softBordarCard),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: UI.spacing.lg,
                      vertical: UI.spacing.sm,
                    ),
                    child: LocationWithMapWidget(),
                  ),
                ],
              ),
            ),
            SizedBox(height: UI.spacing.xl),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: UI.spacing.md),
              child: DirectionAndDoneActions(),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCleanerWithNumberPhone extends StatelessWidget {
  const InfoCleanerWithNumberPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(UI.spacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: UI.sizes.inputHeight,
            height: UI.sizes.inputHeight,
            child: Avatar(
              size: AvatarSize.large,
              imageUrl: '',
              placeholderWidget: Container(
                color: UIColor.backgroungSilverLight,
              ),
            ),
          ),SizedBox(width: UI.spacing.xs,),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  UIText.bodyMedium('Maya Ali'),
                  SizedBox(width: UI.spacing.xxs),
                  Row(
                    children: [
                      UISvg(Assets.icons.star, color: UIColor.warning),
                      UIText.bodyXSmall('5.0', color: UIColor.warning),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: UI.sizes.iconSm,
                    height: UI.sizes.iconSm,
                    child: UIIamge(assetPath: Assets.images.phoneCall21.path),
                  ),
                  SizedBox(width: UI.spacing.xxs),
                  Text(
                    '+999 123 456 789',
                    style: UI.text.bodySmall.copyWith(
                      decoration: TextDecoration.underline,
                      color: UIColor.successBright,
                      decorationColor: UIColor.successBright,
                    ),
                  ),
   
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: UI.spacing.xs,
        vertical: UI.spacing.xxs,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: UIColor.babyBlue, width: 1),
        borderRadius: BorderRadius.circular(UI.radius.xl),
      ),
      child: UIText.headerBody('In progress', color: UIColor.babyBlue),
    );
  }
}
