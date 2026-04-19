import 'package:design_system/design_system.dart';
import 'package:homy_provider/features/home/presentation/widget/bank_card.dart';
import 'package:homy_provider/features/home/presentation/widget/bank_transfers_card.dart';
import 'package:homy_provider/features/home/presentation/widget/earning_chart_widget.dart';
import 'package:homy_provider/localization/files/providerTr.i69n.dart';
import 'package:util/util.dart';

class ProviderHomeScreen extends StatelessWidget {
  const ProviderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double heightScreen = MediaQuery.sizeOf(context).height;
    final tr = context.loc<ProviderTr>();

    return UIScaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //   HomeScreenAppBar(
                //   appBarTitle: 'Home',
                //   isCollapsed: isCollapsed,
                //   expandedHeightappBar: expandedHeight,
                //   collapsedHeightappBar: collapsedHeight,
                //   onCollapsed: onCollapsed,
                //   onTap: (index) {},
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: UI.spacing.lg),
                  child: UIText.h4(tr.title.money),
                ),
                SizedBox(height: UI.spacing.md),
                BankCard(),
                SizedBox(height: UI.spacing.md),
                EarningsChart(),
                SizedBox(height: UI.spacing.lg),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: UI.spacing.lg),
                  child: UIText.h4(tr.title.bankTransfers),
                ),
              ],
            ),

            SizedBox(height: UI.spacing.sm),
            SizedBox(
              height: heightScreen * 0.14,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder:
                    (context, index) => Padding(
                      padding:
                          index == 0
                              ? EdgeInsetsDirectional.only(start: UI.spacing.lg)
                              : EdgeInsets.zero,
                      child: BankTransfersCardWidget(),
                    ),
                separatorBuilder:
                    (context, _) => SizedBox(width: UI.spacing.xs),
                itemCount: 6,
              ),
            ),
          ],
        ),
      ),
      withBackgroundGradient: true,
    );
  }
}

enum StatusBankTransfers { success, inprogress, upcoming }
