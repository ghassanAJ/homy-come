import 'package:booking/booking.dart';

class BookingStepAppBar extends UIAppBar {
  const BookingStepAppBar({
    super.key,
    required this.title,
    required this.onBack,
    required this.currentStepIndex,
    required this.stepsLength,
    required this.step,
  });
  @override
  final String title;
  final Function() onBack;
  final int currentStepIndex;
  final BookingWizardStep step;
  final int stepsLength;

  int getStepNUmber(BookingWizardStep step) {
    if (step == BookingWizardStep.hoursStep) return 2;
    if (step == BookingWizardStep.selectDateTimeStep) return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return UIAppBar(
      titleWidget: Column(
        children: [
          Text(
            step == BookingWizardStep.summary ? 'Summary' : title,
            style: UI.text.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
              // fontSize: 18,
              color: UIColor.balck,
            ),
          ),
          if (step != BookingWizardStep.summary)
            UIText.bodySmall(
              'Step ${getStepNUmber(step)} of 3',
              color: UIColor.textSecondary,
            ),
        ],
      ),
      leading: GestureDetector(
        onTap: () => onBack(),
        child: const BackButtonAppBar(),
      ),
    );
  }
}
