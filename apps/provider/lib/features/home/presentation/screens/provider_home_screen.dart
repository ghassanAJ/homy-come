import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:homy_provider/features/home/presentation/widget/bank_card.dart';
import 'package:homy_provider/features/home/presentation/widget/earning_chart_widget.dart';

class ProviderHomeScreen extends StatelessWidget {
  const ProviderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final topContentPadding =
        MediaQuery.paddingOf(context).top + kToolbarHeight + UI.spacing.md;
    final double widthScreen = MediaQuery.sizeOf(context).width;
    final double heightScreen = MediaQuery.sizeOf(context).height;
    final tr = 
    return UIScaffold(
      body: Padding(
        padding: EdgeInsets.only(top: topContentPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: UI.spacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText.h4('money'),
                  SizedBox(height: UI.spacing.md),
                  BankCard(),
                  SizedBox(height: UI.spacing.md),
                  EarningsChart(),

                  SizedBox(height: UI.spacing.lg),
                  UIText.h4('Bank Transfers'),
                ],
              ),
            ),

            SizedBox(height: UI.spacing.sm),
            SizedBox(
              height: heightScreen * 0.14,
              child: Padding(
                padding: EdgeInsets.only(left: UI.spacing.lg),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) => BankTransfersCardWidget(),
                  separatorBuilder:
                      (context, _) => SizedBox(width: UI.spacing.xs),
                  itemCount: 6,
                ),
              ),
            ),
          ],
        ),
      ),
      withBackgroundGradient: true,
      appBar: UIAppBar(titleWidget: UIText.h4('Home Provider')),
    );
  }
}

class BankTransfersCardWidget extends StatelessWidget {
  const BankTransfersCardWidget({super.key});
  UIColor _getColroStatusBankTransfers(StatusBankTransfers status) {
    switch (status) {
      case StatusBankTransfers.success:
        return UIColor.successlight;
      case StatusBankTransfers.inprogress:
        return UIColor.yellowPale;
      case StatusBankTransfers.upcoming:
        return UIColor.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: UI.spacing.sm,
        vertical: UI.spacing.md,
      ),
      width: 153,
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: UIColor.neutral475.withAlpha(50)),
        borderRadius: BorderRadius.circular(UI.radius.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UIText.h4('220,304 \$'),
          SizedBox(height: UI.spacing.xs),
          UIText.bodySmall('25-31 Aug', color: UIColor.grey),
          SizedBox(height: UI.spacing.md),
          UIText.bodyBold(
            StatusBankTransfers.success.name,
            fontFamily: UIFontFamily.almarai,
            color: _getColroStatusBankTransfers(StatusBankTransfers.success),
          ),
        ],
      ),
    );
  }
}

enum StatusBankTransfers { success, inprogress, upcoming }
