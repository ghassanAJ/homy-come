import 'package:booking/booking.dart';
import 'package:booking/src/presentation/widgets/cancel_lation_sheet_content.dart';
import 'package:booking/src/presentation/widgets/time_slot_chip.dart';
import 'package:booking/src/presentation/widgets/warning_section_widget.dart';

class ServiceDetailsStep3 extends StatefulWidget {
  const ServiceDetailsStep3({super.key});

  @override
  State<ServiceDetailsStep3> createState() => _ServiceDetailsStep3State();
}

class _ServiceDetailsStep3State extends State<ServiceDetailsStep3> {
  // ── Static mock data (providers & time slots come from the API in a real
  // implementation; wired to the bloc via SelectProvider / SelectScheduledAt).
  final List<({String id, String name, String rating})> _providers = const [
    (id: 'p-1', name: 'Mera Ali', rating: '5.0'),
    (id: 'p-2', name: 'Samia Moham...', rating: '5.0'),
    (id: 'p-3', name: 'Judi Ahmad', rating: '5.0'),
    (id: 'p-4', name: 'Judi Ahm...', rating: '5.0'),
  ];

  final List<({String day, String weekDay, DateTime date})> _days = [
    (day: '12', weekDay: 'Thu', date: DateTime(2025, 9, 12)),
    (day: '13', weekDay: 'Fri', date: DateTime(2025, 9, 13)),
    (day: '14', weekDay: 'Sat', date: DateTime(2025, 9, 14)),
    (day: '15', weekDay: 'Sun', date: DateTime(2025, 9, 15)),
    (day: '16', weekDay: 'Mon', date: DateTime(2025, 9, 16)),
  ];

  final List<({String label, String hour, bool available})> _times = const [
    (label: '9:00 AM', hour: '09:00', available: true),
    (label: '9:30 AM', hour: '09:30', available: false),
    (label: '9:15 AM', hour: '09:15', available: false),
    (label: '10:00 AM', hour: '10:00', available: false),
    (label: '9:45 AM', hour: '09:45', available: false),
  ];

  final int _selectedDayIndex = 0;

  Future<void> _showFrequencyBottomSheet() async {
    await UIBottomSheet.show<void>(
      context: context,
      showHandleIndicator: false,
      maxHeightFactor: 0.75,
      backgroundColor: UIColor.neutral100,
      contentPadding: EdgeInsets.zero,
      content: const FrequencyChangeSheetContent(),
    );
  }

  Future<void> _showCancellationBottomSheet() async {
    await UIBottomSheet.show<void>(
      context: context,
      showHandleIndicator: false,
      maxHeightFactor: 0.75,
      backgroundColor: UIColor.neutral100,
      contentPadding: EdgeInsets.zero,
      content: const CancellationSheetContent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final topContentPadding =
        MediaQuery.paddingOf(context).top + kToolbarHeight + UI.spacing.md;

    return BlocConsumer<BookingWizardBloc, BookingWizardState>(
      listenWhen:
          (prev, curr) =>
              curr.currentStep == BookingWizardStep.summary &&
              prev.currentStep != BookingWizardStep.summary,
      listener: (context, state) {
        // Navigator.of(context).push(
        //   MaterialPageRoute<void>(
        //     builder:
        //         (_) => BlocProvider.value(
        //           value: context.read<BookingWizardBloc>(),
        //           child: ServiceDetailsSummaryScreen(id: 0),
        //         ),
        //   ),
        // );
      },
      builder: (context, state) {
        final selectedProviderid =
            state.selectedProviderIds.isNotEmpty
                ? state.selectedProviderIds.first
                : null;

        return SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(0, 0, 0, UI.sizes.bottomPadding),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  UI.spacing.md,
                  12,
                  // topContentPadding,
                  UI.spacing.md,
                  0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Provider list ──────────────────────────────────
                    ProvidersListView(
                      providers: _providers,
                      selectedProviderid: selectedProviderid,
                    ),
                    SizedBox(height: UI.spacing.sm),

                    // ── Frequency card ─────────────────────────────────
                    FrequencyWidget(
                      onFrequencySelected: _showFrequencyBottomSheet,
                    ),
                    SizedBox(height: UI.spacing.lg),

                    // ── Date selector ──────────────────────────────────
                    UIText.h6(
                      'Select date & time please',
                      color: UIColor.balck,
                    ),
                    SizedBox(height: UI.spacing.sm),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        UIText.bodyMedium(
                          'September 2025',
                          color: UIColor.balck,
                        ),
                        SizedBox(width: UI.spacing.xs),
                        UISvg(Assets.icons.arrowBottom, color: UIColor.black),
                      ],
                    ),
                    SizedBox(height: UI.spacing.md),
                    DaysSelector(
                      days: _days,
                      selectedDayIndex: _selectedDayIndex,
                    ),
                    SizedBox(height: UI.spacing.md),

                    // ── Time slot selector ────────────────────────────
                    UIText.h6(
                      'Choose a time from the available options.',
                      fontSize: 14,
                      color: UIColor.balck,
                    ),
                    SizedBox(height: UI.spacing.sm),
                    TimeSelector(
                      times: _times,
                      selectedDayIndex: _selectedDayIndex,
                      days: _days,
                    ),
                    SizedBox(height: UI.spacing.lg),

                    // ── Validation error ──────────────────────────────
                    if (state.step3ValidationError != null)
                      UIText.bodySmall(
                        state.step3ValidationError!,
                        color: UIColor.error,
                      ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: _showCancellationBottomSheet,
                child: WaringSectionWidget(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class TimeSelector extends StatelessWidget {
  const TimeSelector({
    super.key,
    required List<({bool available, String hour, String label})> times,
    required int selectedDayIndex,
    required List<({DateTime date, String day, String weekDay})> days,
  }) : _times = times,
       _selectedDayIndex = selectedDayIndex,
       _days = days;

  final List<({bool available, String hour, String label})> _times;
  final int _selectedDayIndex;
  final List<({DateTime date, String day, String weekDay})> _days;

  @override
  Widget build(BuildContext context) {
    final state = context.read<BookingWizardBloc>().state;
    return Wrap(
      spacing: UI.spacing.xs,
      runSpacing: UI.spacing.sm,
      children: List.generate(_times.length, (index) {
        final slot = _times[index];
        final isSelected =
            state.scheduledAt != null &&
            _selectedDayIndex < _days.length &&
            state.scheduledAt!.hour == int.tryParse(slot.hour.split(':')[0]);

        return TimeSlotChip(
          label: slot.label,
          selected: isSelected,
          enabled: slot.available,
          onTap: () {
            if (!slot.available) return;
            final baseDate = _days[_selectedDayIndex].date;
            final parts = slot.hour.split(':');
            final dt = DateTime(
              baseDate.year,
              baseDate.month,
              baseDate.day,
              int.parse(parts[0]),
              int.parse(parts[1]),
            );
            context.read<BookingWizardBloc>().add(
              SelectScheduledAt(scheduledAt: dt),
            );
          },
        );
      }),
    );
  }
}

class DaysSelector extends StatelessWidget {
  const DaysSelector({
    super.key,
    required List<({DateTime date, String day, String weekDay})> days,
    required int selectedDayIndex,
  }) : _days = days,
       _selectedDayIndex = selectedDayIndex;

  final List<({DateTime date, String day, String weekDay})> _days;
  final int _selectedDayIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UI.sizes.avatarxL,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _days.length,
        separatorBuilder: (_, __) => SizedBox(width: UI.spacing.xs),
        itemBuilder: (context, index) {
          final day = _days[index];
          return DateItemWidget(
            day: day.day,
            weekDay: day.weekDay,
            selected: _selectedDayIndex == index,
            onTap: () {
              // setState(() => _selectedDayIndex = index);
              // // Reset time selection when day changes.
              // context.read<BookingWizardBloc>().add(
              //   SelectScheduledAt(scheduledAt: day.date),
              // );
            },
          );
        },
      ),
    );
  }
}

class FrequencyWidget extends StatelessWidget {
  const FrequencyWidget({super.key, required this.onFrequencySelected});
  final Function onFrequencySelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(UI.spacing.md),
      decoration: BoxDecoration(
        color: UIColor.pink.withValues(alpha: .15),
        borderRadius: BorderRadius.circular(UI.radius.md),
        border: Border.all(color: UIColor.primary.withValues(alpha: .35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: UIText.h6('Frequency', color: UIColor.balck)),
              GestureDetector(
                onTap: () => onFrequencySelected(),
                child: Text(
                  'Change',
                  style: UI.text.bodyMedium.copyWith(
                    color: UIColor.babyBlue,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    decorationColor: UIColor.babyBlue,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: UI.spacing.sm),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: UI.spacing.md,
              vertical: UI.spacing.xs,
            ),
            decoration: BoxDecoration(
              color: UIColor.pink,
              borderRadius: BorderRadius.circular(UI.radius.md),
            ),
            child: UIText.bodyMedium(
              'Repeats Bi-week',
              color: UIColor.background,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class ProvidersListView extends StatelessWidget {
  const ProvidersListView({
    super.key,
    required List<({String id, String name, String rating})> providers,
    required this.selectedProviderid,
  }) : _providers = providers;

  final List<({String id, String name, String rating})> _providers;
  final String? selectedProviderid;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _providers.length,
        separatorBuilder: (_, __) => SizedBox(width: UI.spacing.md),
        itemBuilder: (context, index) {
          final provider = _providers[index];
          return ProviderAvatarItem(
            name: provider.name,
            rating: provider.rating,
            selected: selectedProviderid == provider.id,
            onTap:
                () => context.read<BookingWizardBloc>().add(
                  SelectProvider(providerId: provider.id),
                ),
          );
        },
      ),
    );
  }
}

class NextStepBottomBar extends StatelessWidget {
  const NextStepBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<BookingWizardBloc>().state;
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
                Text(
                  'Total ${state.serviceDetails?.price.newPrice ?? '-'} AED',
                  style: UI.text.bodyMedium.copyWith(
                    color: UIColor.neutral300,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                UIText.h4(
                  '${state.serviceDetails?.price.currentPrice ?? '-'} AED',
                  color: UIColor.balck,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 128,
            child: UIButton.primary(
              label: 'Next',
              expanded: true,
              onPressed:
                  () => context.read<BookingWizardBloc>().add(
                    const ProceedToSummary(),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
