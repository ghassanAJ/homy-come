import 'package:booking/src/presentation/widgets/price_row_widget.dart';

import '../../../booking.dart';

class ServiceDetailsSummaryScreen extends StatelessWidget {
  const ServiceDetailsSummaryScreen({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return UIScaffold(
      appBar: UIAppBar(title: 'Summary'),
      withBackgroundGradient: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 145),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                UI.spacing.lg,
                UI.spacing.md,
                UI.spacing.lg,
                0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText.h4('Booking Details', color: UIColor.balck),
                  SizedBox(height: UI.spacing.sm),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: UIColor.background,
                      borderRadius: BorderRadius.circular(UI.radius.md),
                      border: Border.all(color: UIColor.softgrey),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(UI.spacing.sm),
                          child: Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: UIColor.neutral25,
                                ),
                              ),
                              SizedBox(width: UI.spacing.sm),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    UIText.h3('Mera Ali', color: UIColor.balck),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: UI.sizes.iconXs,
                                          color: UIColor.warning,
                                        ),
                                        SizedBox(width: UI.spacing.xxs),
                                        UIText.bodySmall(
                                          '5.0',
                                          color: UIColor.warning,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(height: 1, color: UIColor.softgrey),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(UI.spacing.sm),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    UIText.bodyXSmall(
                                      'Date',
                                      color: UIColor.grey,
                                    ),
                                    SizedBox(height: 2),
                                    UIText.bodySmall(
                                      '27 tue, Des',
                                      color: UIColor.balck,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 50,
                              color: UIColor.softgrey,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(UI.spacing.sm),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    UIText.bodyXSmall(
                                      'Start Time',
                                      color: UIColor.grey,
                                    ),
                                    SizedBox(height: 2),
                                    UIText.bodySmall(
                                      '10:30 AM',
                                      color: UIColor.balck,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(height: 1, color: UIColor.softgrey),
                        Padding(
                          padding: EdgeInsets.all(UI.spacing.sm),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UIText.bodyXSmall('Address', color: UIColor.grey),
                              SizedBox(height: 2),
                              UIText.bodySmall(
                                'UEA Location name , details locations , street name 12357',
                              ),
                              SizedBox(height: UI.spacing.sm),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  UI.radius.md,
                                ),
                                child: UIImage(
                                  Assets.images.locationImage.path,
                                  fit: BoxFit.cover,
                                  height: 72,
                                  wigth: double.infinity,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: UI.spacing.lg),
                  PriceRow(title: 'Working Hour', amount: '10'),
                  PriceRow(title: 'Service Charge', amount: '0'),
                  PriceRow(title: 'Deep Cleaning', amount: '20'),
                  PriceRow(title: 'Fee', amount: '0.3'),
                  PriceRow(title: 'Total', amount: '30.3', isTotal: true),
                  SizedBox(height: UI.spacing.sm),
                ],
              ),
            ),
            CancellationSection(),
          ],
        ),
      ),
      floatingActionButton: SummaryBottomBar(),
    );
  }
}

class SummaryBottomBar extends StatelessWidget {
  const SummaryBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              showReasons(context);
            },
            child: UIText.bodyMedium(
              'Cancel Service',
              color: UIColor.balck,
              textAlign: TextAlign.center,
            ),
          ),
          // BlocConsumer<OrderCubit, ToastificationUtil.BaseState<OrderState>>(
          //   listener: (context, state) {
          //     final data = state.data;

          //     if (data?.isCancelOrderLoading == true) {
          //       DialogsManager.showLoading(context);
          //     }

          //     if (data?.isCancelOrderLoading == false &&
          //         (data?.isOrderCancelled == true ||
          //             data?.cancelOrderError != null)) {
          //       DialogsManager.hideLoading(context);
          //     }
          //     if (data?.isOrderCancelled == true &&
          //         data?.isCancelOrderLoading == false) {
          //       ToastificationUtil.success('Order cancelled successfully');
          //     }
          //   },
          //   builder: (context, state) {
          //     return InkWell(
          //       onTap: () {
          //         showReasons(context);
          //       },
          //       child: UIText.bodyMedium(
          //         'Cancel Service',
          //         color: UIColor.balck,
          //         textAlign: TextAlign.center,
          //       ),
          //     );
          //   },
          // ),

          // SizedBox(width: UI.spacing.md),
          // Expanded(
          //   child: UIButton.primary(
          //     label: 'Done',
          //     expanded: true,
          //     onPressed: () {},
          //   ),
          // ),
        ],
      ),
    );
  }

  Future<void> showReasons(BuildContext context) async {
    final result =
        await BottomSheetManager.showReasonsRejectionBottomSheet<String>(
          context,
          title: 'Cancel Booking',
          description: 'Please select a reason for cancellation',
          reasons: const [
            'Service price is not suitable',
            'Change my mind',
            'Booked by mistake',
            'Other',
          ],
        );

    if (result != null) {
      // context.read<OrderCubit>().cancelOrder(
      //   item.id,
      //   item.status == "scheduled"
      //       ? FilterOrder.scheduled
      //       : FilterOrder.in_progress,
      //   result,
      // );
    }
  }
}
