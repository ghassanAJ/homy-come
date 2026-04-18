import 'package:booking/booking.dart';

class BookingStepAppBar extends UIAppBar {
  const BookingStepAppBar({
    super.key,
    required this.title,
    required this.onBack,
    required this.currentStepIndex,
    required this.stepsLength,
  });
  @override
  final String title;
  final Function() onBack;
  final int currentStepIndex;
  final int stepsLength;
  @override
  Widget build(BuildContext context) {
    return UIAppBar(
      titleWidget: Column(
        children: [
          Text(
            title,
            style: UI.text.h4.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: UIColor.balck,
            ),
          ),
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
