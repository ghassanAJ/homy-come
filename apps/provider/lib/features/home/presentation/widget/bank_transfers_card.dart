import 'package:design_system/design_system.dart';
import 'package:equatable/equatable.dart';
import 'package:homy_provider/localization/files/providerTr.i69n.dart';
import 'package:util/util.dart';

extension StatusBankTransfersLocalization on StatusBankTransfers {
  String label(ProviderTr tr) {
    switch (this) {
      case StatusBankTransfers.success:
        return tr.title.success; // make sure exists
      case StatusBankTransfers.inprogress:
        return tr.title.inProgerss;
      case StatusBankTransfers.upcoming:
        return tr.title.uncoming;
    }
  }
}

class BankTransfersCardWidget extends StatelessWidget {
  const BankTransfersCardWidget({super.key, required this.model});

  final BankTransferModel model;

  @override
  Widget build(BuildContext context) {
    final tr = context.loc<ProviderTr>();

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
          UIPriceText(text: UIText.h4(model.formattedAmount)),
          SizedBox(height: UI.spacing.xs),
          UIText.bodySmall(model.formattedDateRange, color: UIColor.grey),
          SizedBox(height: UI.spacing.md),
          UIText.bodyBold(
            model.status.label(tr),
            fontFamily: UIFontFamily.almarai,
            color: model.status.color,
          ),
        ],
      ),
    );
  }
}

enum StatusBankTransfers {
  success,
  inprogress,
  upcoming;

  bool get isSuccess => this == StatusBankTransfers.success;
  bool get isInProgress => this == StatusBankTransfers.inprogress;
  bool get isUpcoming => this == StatusBankTransfers.upcoming;
}

class BankTransferModel extends Equatable {
  final double amount;
  final DateTime startDate;
  final DateTime endDate;
  final StatusBankTransfers status;

  const BankTransferModel({
    required this.amount,
    required this.startDate,
    required this.endDate,
    required this.status,
  });

  String get formattedAmount => amount.toStringAsFixed(0);

  String get formattedDateRange {
    return '${_formatDate(startDate)} - ${endDate.month.toMonthName}';
  }

  String _formatDate(DateTime date) {
    // You can replace this with intl later
    return '${date.day}-${date.month}';
  }

  @override
  List<Object?> get props => [amount, startDate, endDate, status];
}

extension StatusBankTransfersUI on StatusBankTransfers {
  UIColor get color {
    switch (this) {
      case StatusBankTransfers.success:
        return UIColor.successlight;
      case StatusBankTransfers.inprogress:
        return UIColor.yellowPale;
      case StatusBankTransfers.upcoming:
        return UIColor.grey;
    }
  }
}
