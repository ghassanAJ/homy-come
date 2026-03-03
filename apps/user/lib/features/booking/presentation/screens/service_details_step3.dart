import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:user/navigation/route.dart';

class ServiceDetailsStep3 extends StatefulWidget {
  const ServiceDetailsStep3({super.key});

  @override
  State<ServiceDetailsStep3> createState() => _ServiceDetailsStep3State();
}

class _ServiceDetailsStep3State extends State<ServiceDetailsStep3> {
  int _selectedProvider = 0;
  int _selectedDay = 0;
  int _selectedTime = 0;

  final List<({String name, String rating})> _providers = const [
    (name: 'Mera Ali', rating: '5.0'),
    (name: 'Samia Moham...', rating: '5.0'),
    (name: 'Judi Ahmad', rating: '5.0'),
    (name: 'Judi Ahm...', rating: '5.0'),
  ];

  final List<({String day, String weekDay})> _days = const [
    (day: '12', weekDay: 'Thu'),
    (day: '13', weekDay: 'Fri'),
    (day: '14', weekDay: 'Sat'),
    (day: '15', weekDay: 'Sun'),
    (day: '16', weekDay: 'Mon'),
    (day: '13', weekDay: 'Fri'),
  ];

  final List<String> _times = const [
    '9:00 AM',
    '09:30 AM',
    '09:15 AM',
    '10:00 AM',
    '09:45 AM',
  ];

  Future<void> _showFrequencyBottomSheet() async {
    await UIBottomSheet.show<void>(
      context: context,
      showHandleIndicator: false,
      maxHeightFactor: 0.75,
      backgroundColor: UIColor.neutral100,
      contentPadding: EdgeInsets.zero,
      content: const _FrequencyChangeSheetContent(),
    );
  }

  Future<void> _showCancellationBottomSheet() async {
    await UIBottomSheet.show<void>(
      context: context,
      showHandleIndicator: false,
      maxHeightFactor: 0.75,
      backgroundColor: UIColor.neutral100,
      contentPadding: EdgeInsets.zero,
      content: const _CancellationSheetContent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final topContentPadding =
        MediaQuery.paddingOf(context).top + kToolbarHeight + UI.spacing.md;

    return UIScaffold(
      appBar: UIAppBar(
        titleWidget: Column(
          children: [
            UIText.h3('Date & time', color: UIColor.balck),
            UIText.bodySmall('Step 3 to 4', color: UIColor.textSecondary),
          ],
        ),
        leading: GestureDetector(
          onTap: () {
            if (context.canPop()) context.pop();
          },
          child: const BackButtonAppBar(),
        ),
      ),
      withBackgroundGradient: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              UI.spacing.md,
              topContentPadding,
              UI.spacing.md,
              145,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: _providers.length,
                    separatorBuilder: (_, __) => SizedBox(width: UI.spacing.md),
                    itemBuilder: (context, index) {
                      final provider = _providers[index];
                      final selected = index == _selectedProvider;
                      return _ProviderAvatarItem(
                        name: provider.name,
                        rating: provider.rating,
                        selected: selected,
                        onTap: () {
                          setState(() {
                            _selectedProvider = index;
                          });
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: UI.spacing.sm),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(UI.spacing.md),
                  decoration: BoxDecoration(
                    color: UIColor.pink.withValues(alpha: .15),
                    borderRadius: BorderRadius.circular(UI.radius.md),
                    border: Border.all(
                      color: UIColor.primary.withValues(alpha: .35),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: UIText.h3('Frequency', color: UIColor.balck),
                          ),
                          GestureDetector(
                            onTap: _showFrequencyBottomSheet,
                            child: UIText.bodyMedium(
                              'Change',
                              color: UIColor.babyBlue,
                              fontWeight: FontWeight.w600,
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
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: UIText.bodyMedium(
                          'Repeats Bi-week',
                          color: UIColor.background,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: UI.spacing.lg),
                UIText.h3('Select date & time please', color: UIColor.balck),
                SizedBox(height: UI.spacing.sm),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    UIText.h3('September 2025', color: UIColor.balck),
                    SizedBox(width: UI.spacing.xs),
                    Icon(Icons.keyboard_arrow_down, color: UIColor.balck),
                  ],
                ),
                SizedBox(height: UI.spacing.md),
                SizedBox(
                  height: 92,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: _days.length,
                    separatorBuilder: (_, __) => SizedBox(width: UI.spacing.xs),
                    itemBuilder: (context, index) {
                      final day = _days[index];
                      final selected = index == _selectedDay;
                      return _DateItem(
                        day: day.day,
                        weekDay: day.weekDay,
                        selected: selected,
                        onTap: () {
                          setState(() {
                            _selectedDay = index;
                          });
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: UI.spacing.md),
                UIText.h3(
                  'Choose a time from the available options.',
                  color: UIColor.balck,
                ),
                SizedBox(height: UI.spacing.sm),
                Wrap(
                  spacing: UI.spacing.xs,
                  runSpacing: UI.spacing.xs,
                  children: List.generate(_times.length, (index) {
                    final selected = index == _selectedTime;
                    return _TimeSlotChip(
                      label: _times[index],
                      selected: selected,
                      enabled: index == 0,
                      onTap: () {
                        if (index != 0) return;
                        setState(() {
                          _selectedTime = index;
                        });
                      },
                    );
                  }),
                ),
                SizedBox(height: UI.spacing.lg),
                GestureDetector(
                  onTap: _showCancellationBottomSheet,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(UI.spacing.md),
                    color: UIColor.neutral100,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          size: UI.sizes.iconSm,
                          color: UIColor.neutral500,
                        ),
                        SizedBox(width: UI.spacing.xs),
                        Expanded(
                          child: UIText.bodyMedium(
                            'You can cancel your order for free if the cancellation is made 6 hours before the scheduled start time of the booking.',
                            color: UIColor.neutral500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            top: false,
            minimum: EdgeInsets.fromLTRB(
              UI.spacing.lg,
              UI.spacing.sm,
              UI.spacing.lg,
              UI.spacing.sm,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
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
                            'Total 78.00 AED',
                            style: UI.text.bodyMedium.copyWith(
                              color: UIColor.neutral300,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          UIText.h4('48.00AED', color: UIColor.balck),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 128,
                      child: UIButton.primary(
                        label: 'Next',
                        expanded: true,
                        onPressed: () {
                          context.push(UserPaths.serviceDetailsSummarywithid());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FrequencyChangeSheetContent extends StatelessWidget {
  const _FrequencyChangeSheetContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520,
      width: double.infinity,
      decoration: BoxDecoration(
        color: UIColor.neutral100,
        borderRadius: BorderRadius.vertical(top: Radius.circular(UI.radius.xl)),
      ),
    );
  }
}

class _CancellationSheetContent extends StatelessWidget {
  const _CancellationSheetContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520,
      width: double.infinity,
      decoration: BoxDecoration(
        color: UIColor.neutral100,
        borderRadius: BorderRadius.vertical(top: Radius.circular(UI.radius.xl)),
      ),
    );
  }
}

class _ProviderAvatarItem extends StatelessWidget {
  const _ProviderAvatarItem({
    required this.name,
    required this.rating,
    required this.selected,
    required this.onTap,
  });

  final String name;
  final String rating;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 94,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 72,
                  width: 72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: UIColor.pink.withValues(alpha: .35),
                  ),
                  child: Icon(Icons.person, color: UIColor.neutral500),
                ),
                Positioned(
                  right: 2,
                  bottom: 2,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color:
                          selected ? UIColor.successBright : UIColor.background,
                      shape: BoxShape.circle,
                      border: Border.all(color: UIColor.background, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: UI.spacing.xxs),
            UIText.bodySmall(
              name,
              color: UIColor.balck,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, size: 12, color: UIColor.warning),
                SizedBox(width: 2),
                UIText.bodySmall(rating, color: UIColor.warning),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DateItem extends StatelessWidget {
  const _DateItem({
    required this.day,
    required this.weekDay,
    required this.selected,
    required this.onTap,
  });

  final String day;
  final String weekDay;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 56,
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected ? UIColor.softGreen : UIColor.background,
                border: Border.all(
                  color: selected ? UIColor.softGreen : UIColor.neutral200,
                ),
              ),
              alignment: Alignment.center,
              child: UIText.h3(
                day,
                color: selected ? UIColor.background : UIColor.balck,
              ),
            ),
            SizedBox(height: UI.spacing.xxs),
            UIText.bodyMedium(weekDay, color: UIColor.balck),
          ],
        ),
      ),
    );
  }
}

class _TimeSlotChip extends StatelessWidget {
  const _TimeSlotChip({
    required this.label,
    required this.selected,
    required this.enabled,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 110,
        padding: EdgeInsets.symmetric(vertical: UI.spacing.xs),
        decoration: BoxDecoration(
          color:
              selected
                  ? UIColor.pink.withValues(alpha: .22)
                  : UIColor.background,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color:
                selected
                    ? UIColor.primary.withValues(alpha: .5)
                    : UIColor.neutral200,
          ),
        ),
        alignment: Alignment.center,
        child: UIText.bodyMedium(
          label,
          color: enabled ? UIColor.neutral500 : UIColor.neutral300,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
