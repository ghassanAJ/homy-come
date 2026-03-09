
import 'package:design_system/design_system.dart';
import 'package:homy_provider/features/home/presentation/screens/provider_home_screen.dart';
import 'package:homy_provider/localization/files/providerTr.i69n.dart';
import 'package:util/util.dart';

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

  
  String _getTranslationOFStatusBankTransfer(StatusBankTransfers status){
  
    switch(status) {
      case StatusBankTransfers.success:
          
        throw UnimplementedError();
      case StatusBankTransfers.inprogress:
        // TODO: Handle this case.
        throw UnimplementedError();
      case StatusBankTransfers.upcoming:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  @override
  Widget build(BuildContext context) {
    final tr =context.loc<ProviderTr>();
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
           tr.title.inProgerss   ,
            fontFamily: UIFontFamily.almarai,
            color: _getColroStatusBankTransfers(StatusBankTransfers.success),
          ),
        ],
      ),
    );
  }
}
