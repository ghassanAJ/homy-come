import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:user/features/booking/presentation/widgets/cancel_lation_sheet_content.dart';
import 'package:user/features/booking/presentation/widgets/date_item.dart';
import 'package:user/features/booking/presentation/widgets/frequenct_change_sheet_context.dart';
import 'package:user/features/booking/presentation/widgets/provider_avater_item.dart';
import 'package:user/features/booking/presentation/widgets/step_navigation_bar.dart';
import 'package:user/features/booking/presentation/widgets/time_slot_chip.dart';
import 'package:user/features/booking/presentation/widgets/warning_section_widget.dart';
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

    return UIScaffold(
      appBar: UIAppBar(
        titleWidget: Column(
          children: [
            UIText.h4('Date & time', color: UIColor.balck),
            UIText.bodyMedium('Step 3 to 4', color: UIColor.textSecondary),
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
            padding: EdgeInsets.fromLTRB(0, 0, 0, UI.sizes.bottomPadding),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    UI.spacing.md,
                    topContentPadding,
                    UI.spacing.md,
                    0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 145,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: _providers.length,
                          separatorBuilder:
                              (_, __) => SizedBox(width: UI.spacing.md),
                          itemBuilder: (context, index) {
                            final provider = _providers[index];
                            final selected = index == _selectedProvider;
                            return ProviderAvatarItem(
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
                                  child: UIText.h6(
                                    'Frequency',
                                    color: UIColor.balck,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: _showFrequencyBottomSheet,
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
                                borderRadius: BorderRadius.circular(
                                  UI.radius.md,
                                ),
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
                      SizedBox(
                        height: UI.sizes.avatarxL,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: _days.length,
                          separatorBuilder:
                              (_, __) => SizedBox(width: UI.spacing.xs),
                          itemBuilder: (context, index) {
                            final day = _days[index];
                            final selected = index == _selectedDay;
                            return DateItemWidget(
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
                      UIText.h6(
                        'Choose a time from the available options.',
                        fontSize: 14,
                        color: UIColor.balck,
                      ),
                      SizedBox(height: UI.spacing.sm),
                      Wrap(
                        spacing: UI.spacing.xs,
                        runSpacing: UI.spacing.sm,
                        children: List.generate(_times.length, (index) {
                          final selected = index == _selectedTime;
                          return TimeSlotChip(
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
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: _showCancellationBottomSheet,
                  child: WaringSectionWidget(),
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
              child: StepNavigationBar(
                next: () {
                  context.push(UserPaths.serviceDetailsSummary);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
