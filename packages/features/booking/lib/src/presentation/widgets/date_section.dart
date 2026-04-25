// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:booking/booking.dart';
import 'package:go_router/go_router.dart';

class DateSection extends StatelessWidget {
  // final BookingWizardState state;

  const DateSection({
    super.key,
    required this.availableDays,
    required this.scheduledAt,
    required this.selectedDayIndex,
    required this.onSelectedDay,
    required this.onSelectedMonth,
  });
  final List<DayModel> availableDays;
  final DateTime? scheduledAt;
  final int selectedDayIndex;
  final Function(int) onSelectedDay;
  final Function(DateTime) onSelectedMonth;

  @override
  Widget build(BuildContext context) {
    if (availableDays.isEmpty) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () async {
            final DateTime? scheduledAt = await showMonthPicker(context);
            if (scheduledAt != null) {
              onSelectedMonth(scheduledAt);
            }
          },
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                UIText.h6(
                  '${DateTime.now().year} ${_monthName(scheduledAt?.month ?? 0)}',
                  fontSize: 14,
                ),
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ),
        SizedBox(height: UI.spacing.sm),

        DaysSelector(
          days: availableDays,
          selectedIndex: selectedDayIndex,
          onSelect: onSelectedDay,
        ),
      ],
    );
  }

  Future<DateTime?> showMonthPicker(BuildContext context) async {
    final now = DateTime.now();

    // return showModalBottomSheet<DateTime>(
    //   context: context,
    //   shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    //   ),
    //   builder: (_) {
    //     return

    //   },
    // );
    return UIBottomSheet.show<DateTime>(
      context: context,

      content: SizedBox(
        height: 300,
        child: Column(
          children: [
            const SizedBox(height: 16),
            Text(
              'Select Month',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 2.5,
                ),
                itemCount: 12,
                itemBuilder: (_, index) {
                  final month = index + 1;
                  final date = DateTime(now.year, month);

                  return GestureDetector(
                    onTap: () => context.pop(date),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade200,
                      ),
                      child: Text(
                        _monthName(month),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _monthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'Jun',
      'July',
      'August',
      'Septmper',
      'Octobar',
      'Novmber',
      'Decmber',
    ];
    final indexOfMonth = month - 1 == -1 ? DateTime.now().month : month - 1;
    return months[indexOfMonth];
  }
}
