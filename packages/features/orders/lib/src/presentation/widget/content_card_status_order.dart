import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:orders/src/presentation/widget/data_and_time_info_order_widget.dart';
import 'package:orders/src/presentation/widget/info_cleaner_of_order_widget.dart';
import 'package:orders/src/presentation/widget/location_of_myOrder_widget.dart';
import 'package:orders/src/presentation/widget/name_and_status_order_widget.dart';

class ContentCardStatusOrder extends StatelessWidget {
  const ContentCardStatusOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NameAndStatusOrderwidget(),
        Divider(color: UIColor.bordarCard, height: 0.5),
        InfoCleanerOfOrderwidget(),
        Divider(color: UIColor.bordarCard, height: 0.5),
        DateTimeInfoOrderWidget(),
        Divider(color: UIColor.bordarCard, height: 0.5),
        CurrentOrderLocationView(),
      ],
    );
  }
}
