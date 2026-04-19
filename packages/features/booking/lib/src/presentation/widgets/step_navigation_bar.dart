import 'package:booking/booking.dart';

class StepNavigationBar extends StatelessWidget {
  const StepNavigationBar({super.key, required this.next});

  final VoidCallback next;

  @override
  Widget build(BuildContext context) {
    final total = context
        .watch<BookingWizardBloc>()
        .state
        .selectedAddOns
        .map((addOn) {
          return addOn.price.newPrice ?? 0.0;
        })
        .reduce((a, b) => a + b);
    final currentTotal = context
        .watch<BookingWizardBloc>()
        .state
        .selectedAddOns
        .map((addOn) {
          return addOn.price.currentPrice ?? 0.0;
        })
        .reduce((a, b) => a + b);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(UI.spacing.md),
      decoration: BoxDecoration(
        color: UIColor.background,
        borderRadius: BorderRadius.circular(UI.radius.lg),
        boxShadow: UI.shadows.cardMd,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    UIText.h6(
                      'Total ',
                      color: UIColor.textSliverLight,
                      // textAlign: TextAlign.right,
                      // style: UI.text.bodyMedium.copyWith(
                      //
                      //   decoration: TextDecoration.lineThrough,
                      //   decorationColor: UIColor.textSliverLight,
                      // ),
                    ),
                    UIPriceText(
                      isOldPrice: true,
                      text: UIText.h6(
                        total.toStringAsFixed(2),
                        color: UIColor.textSliverLight,
                        textAlign: TextAlign.right,
                        // style: UI.text.bodyMedium.copyWith(
                        //
                        //   decoration: TextDecoration.lineThrough,
                        //   decorationColor: UIColor.textSliverLight,
                        // ),
                      ),
                    ),
                  ],
                ),
                UIPriceText(
                  text: UIText.h6(
                    currentTotal.toStringAsFixed(2),
                    color: UIColor.balck,
                  ),
                ),
              ],
            ),
          ),
          UIButton.primary(
            label:
                context.watch<BookingWizardBloc>().state.currentStep ==
                        BookingWizardStep.summary
                    ? 'Done'
                    : 'Next',
            onPressed: next,
          ),
        ],
      ),
    );
  }
}
