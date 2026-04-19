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
  @override
  Widget build(BuildContext context) {
    return UIAppBar(
      titleWidget: Column(
        children: [
          Text(
            step == BookingWizardStep.summary ? 'Summary' : title,
            style: UI.text.h4.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: UIColor.balck,
            ),
          ),
          if (step != BookingWizardStep.summary)
            UIText.bodyMedium(
              'Step $currentStepIndex of $stepsLength',
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
