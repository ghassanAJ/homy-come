// import 'package:design_system/design_system.dart';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:orders/src/localization/order_localization_scope.dart';

class OrderDateTimeWidget extends StatelessWidget {
  const OrderDateTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = context.orderTr;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: UI.spacing.lg,
        vertical: UI.spacing.xs,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIText.bodyXSmall(tr.title.date, color: UIColor.grey),
                SizedBox(height: UI.spacing.xs),
                UIText.bodySmall('27 tue, Des'),
              ],
            ),
          ),
          // VerticalDivider(color: UIColor.bordarCard, width: 2),
          Container(
            width: 0.8,
            height: UI.spacing.xxl,
            color: UIColor.bordarCard,
          ),
          SizedBox(width: UI.spacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIText.bodyXSmall(tr.title.time, color: UIColor.grey),
                SizedBox(height: UI.spacing.xs),
                UIText.bodySmall('10:30 AM'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
