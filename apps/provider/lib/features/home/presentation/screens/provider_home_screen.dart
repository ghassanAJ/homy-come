import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:homy_provider/features/home/presentation/widget/bank_card.dart';
import 'package:homy_provider/features/home/presentation/widget/bank_transfers_card.dart';
import 'package:homy_provider/features/home/presentation/widget/earning_chart_widget.dart';
import 'package:homy_provider/localization/files/providerTr.i69n.dart';
import 'package:util/util.dart';

class ProviderHomeScreen extends StatelessWidget {
  const ProviderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final topContentPadding =
        MediaQuery.paddingOf(context).top + kToolbarHeight + UI.spacing.md;
    final double heightScreen = MediaQuery.sizeOf(context).height;
    final tr = context.loc<ProviderTr>();
  
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
                  UIText.h4(tr.title.money),
                  SizedBox(height: UI.spacing.md),
                  BankCard(),
                  SizedBox(height: UI.spacing.md),
                  EarningsChart(),
                  SizedBox(height: UI.spacing.lg),
                  UIText.h4(tr.title.bankTransfers),
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
      appBar: UIAppBar(titleWidget: UIText.h4('Home Provider')),//TODO : delete app bar
    );
  }
}

enum StatusBankTransfers { success, inprogress, upcoming }
