import 'package:design_system/design_system.dart';
import 'package:homy_provider/features/home/presentation/widget/bank_card.dart';
import 'package:homy_provider/features/home/presentation/widget/bank_transfers_card.dart';
import 'package:homy_provider/features/home/presentation/widget/earning_chart_widget.dart';
import 'package:homy_provider/localization/files/providerTr.i69n.dart';
import 'package:user/features/home/presentation/widgets/home/home_header.dart';
import 'package:util/util.dart';

final List<BankTransferModel> mockBankTransfers = [
  BankTransferModel(
    amount: 1180,
    startDate: DateTime(2025, 8, 25),
    endDate: DateTime(2025, 8, 31),
    status: StatusBankTransfers.inprogress,
  ),
  BankTransferModel(
    amount: 1370,
    startDate: DateTime(2025, 8, 18),
    endDate: DateTime(2025, 8, 24),
    status: StatusBankTransfers.success,
  ),
  BankTransferModel(
    amount: 2600,
    startDate: DateTime(2025, 9, 1),
    endDate: DateTime(2025, 9, 7),
    status: StatusBankTransfers.upcoming,
  ),
  BankTransferModel(
    amount: 3050,
    startDate: DateTime(2025, 8, 10),
    endDate: DateTime(2025, 8, 16),
    status: StatusBankTransfers.success,
  ),
  BankTransferModel(
    amount: 4080,
    startDate: DateTime(2025, 9, 8),
    endDate: DateTime(2025, 9, 14),
    status: StatusBankTransfers.upcoming,
  ),
  BankTransferModel(
    amount: 5000,
    startDate: DateTime(2025, 8, 1),
    endDate: DateTime(2025, 8, 7),
    status: StatusBankTransfers.success,
  ),
];

class ProviderHomeScreen extends StatelessWidget {
  const ProviderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double heightScreen = MediaQuery.sizeOf(context).height;
    final tr = context.loc<ProviderTr>();

    return UIScaffold(
      appBar: UIAppBar(
        titleWidget: HomeHeader(),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: UI.spacing.sm),
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
                      child: BankTransfersCardWidget(
                        model: mockBankTransfers[index],
                      ),
                    ),
                separatorBuilder:
                    (context, _) => SizedBox(width: UI.spacing.xs),
                itemCount: mockBankTransfers.length,
              ),
            ),
          ],
        ),
      ),
      withBackgroundGradient: true,
    );
  }
}
