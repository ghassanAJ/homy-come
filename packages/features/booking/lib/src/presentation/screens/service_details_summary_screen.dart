import 'package:booking/src/presentation/widgets/price_row_widget.dart';
import 'package:booking/src/presentation/widgets/warning_section_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';

class ServiceDetailsSummaryScreen extends StatelessWidget {
  const ServiceDetailsSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final topContentPadding =
        MediaQuery.paddingOf(context).top + kToolbarHeight + UI.spacing.md;

    return UIScaffold(
      appBar: UIAppBar(
        titleWidget: Column(
          children: [UIText.h4('Summary', color: UIColor.balck)],
        ),
        leading: GestureDetector(
          onTap: () {
            if (context.canPop()) context.pop();
          },
          child: const BackButtonAppBar(),
        ),
        actions: [
          UIIconBackground(
            size: 34,
            iconSize: UI.sizes.iconSm,
            backgroundColor: UIColor.neutral100,
            child: Icon(Icons.notifications_none_rounded, color: UIColor.balck),
          ),
        ],
      ),
      withBackgroundGradient: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 145),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    UI.spacing.lg,
                    topContentPadding,
                    UI.spacing.lg,
                    0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UIText.h4('Service Details', color: UIColor.balck),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        UIText.h3(
                                          'Mera Ali',
                                          color: UIColor.balck,
                                        ),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        UIText.bodyXSmall(
                                          'Date',
                                          color: UIColor.grey,
                                        ),
                                        SizedBox(height: UI.spacing.xxs),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        UIText.bodyXSmall(
                                          'Start Time',
                                          color: UIColor.grey,
                                        ),
                                        SizedBox(height: UI.spacing.xxs),
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
                                  UIText.bodyXSmall(
                                    'Address',
                                    color: UIColor.grey,
                                  ),
                                  SizedBox(height: UI.spacing.xxs),
                                  UIText.bodySmall(
                                    'UEA Location name , details locations , street name 12357',
                                    color: UIColor.grey,
                                  ),
                                  SizedBox(height: UI.spacing.sm),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      UI.radius.md,
                                    ),
                                    child: Container(
                                      height: 72,
                                      width: double.infinity,
                                      color: UIColor.neutral100,
                                      alignment: Alignment.center,
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
                WaringSectionWidget(),
              ],
            ),
          ),
          SafeArea(
            top: false,
            minimum: EdgeInsets.fromLTRB(
              UI.spacing.lg,
              UI.spacing.sm,
              UI.spacing.lg,
              UI.spacing.sm,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: UIText.bodyMedium(
                      'Cancel Service',
                      color: UIColor.balck,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(width: UI.spacing.md),
                  Expanded(
                    child: UIButton.primary(
                      label: 'Done',
                      expanded: true,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
