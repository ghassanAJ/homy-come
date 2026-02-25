import 'dart:developer';
import 'package:profile/profile.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orders/src/presentation/widget/card_status_order_widget.dart';
import 'package:orders/src/localization/order_localization_scope.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = context.orderTr;
    return Scaffold(
      body: UIBackground(
        content: CustomScrollView(
          slivers: [
            OrderAppBar(),
            SliverToBoxAdapter(child: SizedBox(height: UI.spacing.md)),

            SliverToBoxAdapter(
              child: UIchipsBar(
                firstLabel: tr.labels.all,
                label: [
                  tr.title.inProgess,
                  tr.title.scheduled,
                  tr.title.completed,
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: UI.spacing.md)),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: UI.spacing.lg,
                vertical: UI.spacing.md,
              ),
              sliver: SliverList.separated(
                itemBuilder: (context, i) => OrderStatusCardContent(),
                separatorBuilder:
                    (context, _) => SizedBox(height: UI.spacing.md),
                itemCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderAppBar extends StatelessWidget {
  const OrderAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UISliverAppBar(
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Padding(
          padding: EdgeInsets.only(
            left: UI.spacing.xl,
            top: UI.spacing.md,
          ),
          child: Column(
            children: [Divider(height: 4, color: UIColor.divider)],
          ),
        ),
      ),
      variant: UISliverAppBarVariant.transparent,
      leading: SizedBox(
        width: 24,
        height: 24,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: BackButtonAppBar(),
        ),
      ),
      centerTitle: true,
      titleWidget: UIText.h4(context.orderTr.title.myOrder),
    
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(right: UI.spacing.lg),
            padding: EdgeInsets.symmetric(
              horizontal: UI.spacing.sm,
              vertical: UI.spacing.xxs,
            ),
            // width: 50,
            height: UI.sizes.iconLg,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(UI.radius.sm),
              color: UIColor.neutral100,
            ),
            child:UISvg(Assets.icons.notification,color: UIColor.black,)
          ),
        ),
      ],
    );
  }
}
