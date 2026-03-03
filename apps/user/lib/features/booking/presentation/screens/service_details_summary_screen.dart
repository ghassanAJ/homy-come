import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';

class ServiceDetailsSummaryScreen extends StatelessWidget {
  const ServiceDetailsSummaryScreen({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    final topContentPadding =
        MediaQuery.paddingOf(context).top + kToolbarHeight + UI.spacing.md;

    return UIScaffold(
      appBar: UIAppBar(
        title: 'Summary',
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
            padding: EdgeInsets.fromLTRB(
              UI.spacing.md,
              topContentPadding,
              UI.spacing.md,
              145,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIText.h2('Service Details', color: UIColor.balck),
                SizedBox(height: UI.spacing.sm),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: UIColor.background,
                    borderRadius: BorderRadius.circular(UI.radius.md),
                    border: Border.all(color: UIColor.neutral200),
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
                                color: UIColor.pink.withValues(alpha: .35),
                              ),
                              child: Icon(
                                Icons.person,
                                color: UIColor.neutral500,
                                size: UI.sizes.iconMd,
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
                      Divider(height: 1, color: UIColor.neutral200),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(UI.spacing.sm),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  UIText.bodySmall(
                                    'Date',
                                    color: UIColor.neutral500,
                                  ),
                                  SizedBox(height: UI.spacing.xxs),
                                  UIText.bodyMedium(
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
                            color: UIColor.neutral200,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(UI.spacing.sm),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  UIText.bodySmall(
                                    'Start Time',
                                    color: UIColor.neutral500,
                                  ),
                                  SizedBox(height: UI.spacing.xxs),
                                  UIText.bodyMedium(
                                    '10:30 AM',
                                    color: UIColor.balck,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(height: 1, color: UIColor.neutral200),
                      Padding(
                        padding: EdgeInsets.all(UI.spacing.sm),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UIText.bodySmall(
                              'Address',
                              color: UIColor.neutral500,
                            ),
                            SizedBox(height: UI.spacing.xxs),
                            UIText.bodyMedium(
                              'UEA Location name , details locations , street name 12357',
                              color: UIColor.balck,
                            ),
                            SizedBox(height: UI.spacing.sm),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(UI.radius.md),
                              child: Container(
                                height: 72,
                                width: double.infinity,
                                color: UIColor.neutral100,
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.map_outlined,
                                  color: UIColor.neutral500,
                                  size: UI.sizes.iconLg,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: UI.spacing.lg),
                _PriceRow(title: 'Working Hour', amount: '\$10'),
                _PriceRow(title: 'Service Charge', amount: '\$0'),
                _PriceRow(title: 'Deep Cleaning', amount: '\$20'),
                _PriceRow(title: 'Fee', amount: '\$0.3'),
                _PriceRow(title: 'Total', amount: '\$30.3', isTotal: true),
                SizedBox(height: UI.spacing.sm),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(UI.spacing.md),
                  color: UIColor.neutral100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        size: UI.sizes.iconSm,
                        color: UIColor.neutral500,
                      ),
                      SizedBox(width: UI.spacing.xs),
                      Expanded(
                        child: UIText.bodyMedium(
                          'You can cancel your order for free if the cancellation is made 6 hours before the scheduled start time of the booking.',
                          color: UIColor.neutral500,
                        ),
                      ),
                    ],
                  ),
                ),
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
                    child: UIText.h3(
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

class _PriceRow extends StatelessWidget {
  const _PriceRow({
    required this.title,
    required this.amount,
    this.isTotal = false,
  });

  final String title;
  final String amount;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: UI.spacing.sm),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: UIColor.neutral200)),
      ),
      child: Row(
        children: [
          Expanded(
            child: UIText.bodyMedium(
              title,
              color: UIColor.balck,
              fontWeight: isTotal ? FontWeight.w700 : FontWeight.w600,
            ),
          ),
          UIText.bodyMedium(
            amount,
            color: UIColor.neutral500,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
