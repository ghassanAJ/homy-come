import 'package:booking/booking.dart';

class StepNavigationBar extends StatelessWidget {
  const StepNavigationBar({super.key, required this.next});

  final VoidCallback next;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BookingWizardBloc>().state;
    final total =
        state.selectedAddOns.isEmpty
            ? 0
            : state.selectedAddOns
                .map((addOn) {
                  return addOn.price.newPrice ?? 0.0;
                })
                .reduce((a, b) => a + b);
    final currentTotal =
        state.selectedAddOns.isEmpty
            ? 0
            : state.selectedAddOns
                .map((addOn) {
                  return addOn.price.currentPrice ?? 0.0;
                })
                .reduce((a, b) => a + b);
    return (state.currentStep == BookingWizardStep.summary)
        ? SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: next,
            style: ElevatedButton.styleFrom(
              backgroundColor: UIColor.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(6),
              ),
            ),
            child:
                state.isSubmitting
                    ? CircularProgressIndicator.adaptive(
                      backgroundColor: UIColor.white,
                    )
                    : UIText.bodyMedium(
                      'Done',
                      color: UIColor.babyBlue,
                      fontWeight: FontWeight.bold,
                    ),
          ),
        )
        : Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: UI.spacing.md, horizontal: 12),
          padding: EdgeInsets.all(UI.spacing.md),
          decoration: BoxDecoration(
            color: UIColor.background,
            borderRadius: BorderRadius.circular(UI.radius.lg),
            boxShadow: UI.shadows.cardMd,
          ),
          child: Row(
            children: [
              if (context.watch<BookingWizardBloc>().state.currentStep !=
                  BookingWizardStep.summary)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (context
                              .watch<BookingWizardBloc>()
                              .state
                              .currentStep !=
                          BookingWizardStep.summary)
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
              UIButton.primary(label: 'Next', onPressed: next),
            ],
          ),
        );
  }
}
