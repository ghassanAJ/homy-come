// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:booking/booking.dart';
import 'package:booking/src/presentation/widgets/cancel_lation_sheet_content.dart';
import 'package:booking/src/presentation/widgets/time_slot_chip.dart';
import 'package:booking/src/presentation/widgets/warning_section_widget.dart';

// ─────────────────────────────────────────────────────────────
// MODELS (TEMP UI MODELS – SHOULD COME FROM DOMAIN LAYER)
// ─────────────────────────────────────────────────────────────

class DayModel {
  final String day;
  final String weekDay;
  final DateTime date;

  DayModel({required this.day, required this.weekDay, required this.date});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'day': day,
      'weekDay': weekDay,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory DayModel.fromJson(Map<String, dynamic> map) {
    return DayModel(
      day: map['day'] as String,
      weekDay: map['weekDay'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());
}

class TimeSlotModel {
  final DateTime dateTime;
  final String label;
  final bool available;

  TimeSlotModel({
    required this.dateTime,
    required this.label,
    required this.available,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dateTime': dateTime.millisecondsSinceEpoch,
      'label': label,
      'available': available,
    };
  }

  factory TimeSlotModel.fromJson(Map<String, dynamic> map) {
    return TimeSlotModel(
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      label: map['label'] as String,
      available: map['available'] as bool,
    );
  }

  String toJson() => json.encode(toMap());
}

// ─────────────────────────────────────────────────────────────
// MAIN SCREEN
// ─────────────────────────────────────────────────────────────

class ServiceDetailsStep3 extends StatefulWidget {
  const ServiceDetailsStep3({super.key});

  @override
  State<ServiceDetailsStep3> createState() => _ServiceDetailsStep3State();
}

class _ServiceDetailsStep3State extends State<ServiceDetailsStep3> {
  @override
  void initState() {
    super.initState();
    context.read<BookingWizardBloc>().add(LoadProviders(serviceId: '1'));
    context.read<BookingWizardBloc>().add(LoadAvailableDays(serviceId: '1'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingWizardBloc, BookingWizardState>(
      listenWhen:
          (p, c) =>
              p.currentStep != c.currentStep &&
              c.currentStep == BookingWizardStep.summary,
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(bottom: UI.sizes.bottomPadding),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: UI.spacing.lg),

                  ProvidersSection(state: state),

                  // SizedBox(height: UI.spacing.md),
                  const FrequencySection(),
                  SizedBox(height: UI.spacing.sm),
                  DateSection(state: state),
                  SizedBox(height: UI.spacing.md),

                  TimeSection(state: state),
                  SizedBox(height: UI.spacing.lg),
                ],
              ),

              const CancellationSection(),
              if (state.step3ValidationError != null) ...[
                SizedBox(height: UI.spacing.md),

                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsetsDirectional.all(8.0),

                    decoration: BoxDecoration(
                      color: UIColor.errorLight.withOpacity(0.3),
                    ),
                    child: UIText.bodySmall(
                      state.step3ValidationError!,
                      // color: UIColor.error,
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 120),
            ],
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────
// PROVIDERS SECTION
// ─────────────────────────────────────────────────────────────

class ProvidersSection extends StatelessWidget {
  final BookingWizardState state;

  const ProvidersSection({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.loadingProviders) {
      return ProvidedrsShimmar(); // Replace with empty widget
    }
    if (state.availableDays.isEmpty) {
      return const SizedBox(); // Replace with empty widget
    }

    return SizedBox(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: state.availableProviders.length,
        separatorBuilder: (_, __) => SizedBox(width: UI.spacing.md),
        itemBuilder: (_, index) {
          final provider = state.availableProviders[index];

          final selected = state.selectedProviders.contains(provider);

          return Padding(
            padding:
                index == 0
                    ? EdgeInsetsDirectional.only(start: UI.spacing.md)
                    : EdgeInsets.zero,
            child: ProviderAvatarItem(
              image: provider.image ?? '',
              name: provider.name,
              rating: provider.rating.toString(),
              selected: selected,
              onTap:
                  () => context.read<BookingWizardBloc>().add(
                    SelectProvider(providerId: provider),
                  ),
            ),
          );
        },
      ),
    );
  }
}

class ProvidedrsShimmar extends StatelessWidget {
  const ProvidedrsShimmar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: List.generate(
          4,
          (_) => Padding(
            padding: const EdgeInsetsDirectional.only(end: 8.0),
            child: Column(
              children: [
                ShimmerBox(
                  width: 80,
                  height: 80,
                  radius: 80,
                  shape: BoxShape.circle,
                  color: UIColor.neutral25,
                ),
                SizedBox(height: 10),
                ShimmerBox(
                  width: 80,
                  height: 10,
                  radius: 80,
                  color: UIColor.neutral25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// DATE SECTION
// ─────────────────────────────────────────────────────────────

class DateSection extends StatelessWidget {
  final BookingWizardState state;

  const DateSection({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.availableDays.isEmpty) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16.0),
          child: UIText.h6('Select date & time please', fontSize: 14),
        ),
        SizedBox(height: 12),
        GestureDetector(
          onTap: () {
            // showDatePicker(context: context, firstDate: firstDate, lastDate: lastDate)
          },
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                UIText.h6('September 2025', fontSize: 14),
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ),
        SizedBox(height: UI.spacing.sm),

        DaysSelector(
          days: state.availableDays,
          selectedIndex: state.selectedDayIndex,
          onSelect: (index) {
            context.read<BookingWizardBloc>().add(SelectDay(index));
          },
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
// TIME SECTION
// ─────────────────────────────────────────────────────────────

class TimeSection extends StatelessWidget {
  final BookingWizardState state;

  const TimeSection({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.loadingSlots) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(start: 16.0),
        child: SlotsShimmarWidget(),
      );
    }

    if (state.slotsError != null) {
      return Center(child: Text(state.slotsError!.message));
    }

    if (state.timeSlots.isEmpty) {
      return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16.0),
      child: Wrap(
        spacing: UI.spacing.xs,
        runSpacing: UI.spacing.sm,
        children:
            state.timeSlots.map((slot) {
              final selected =
                  state.scheduledAt != null &&
                  state.scheduledAt == slot.dateTime;

              return TimeSlotChip(
                label: slot.label,
                selected: selected,
                enabled: slot.available,
                onTap: () {
                  if (!slot.available) return;

                  context.read<BookingWizardBloc>().add(
                    SelectScheduledAt(scheduledAt: slot.dateTime),
                  );
                },
              );
            }).toList(),
      ),
    );
  }
}

class SlotsShimmarWidget extends StatelessWidget {
  const SlotsShimmarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 3,
        crossAxisSpacing: 3,
        childAspectRatio: 3.5,
      ),
      children: [
        ...List.generate(
          9,
          (index) => ShimmerBox(
            border: Border.all(color: UIColor.border),
            width: 40,
            height: 1,
            radius: 24,
            color: UIColor.neutral25,
          ),

          // Container(
          //   width: 1 * 0.28,
          //   padding: EdgeInsets.symmetric(vertical: UI.spacing.xs),
          //   decoration: BoxDecoration(
          //     color: UIColor.background,
          //     borderRadius: BorderRadius.circular(24),
          //     border: Border.all(color: UIColor.neutral50),
          //   ),
          //   alignment: Alignment.center,
          // ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
// DAYS SELECTOR
// ─────────────────────────────────────────────────────────────

class DaysSelector extends StatelessWidget {
  final List<DayModel> days;
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  const DaysSelector({
    super.key,
    required this.days,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UI.sizes.avatarxL,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        separatorBuilder: (_, __) => SizedBox(width: UI.spacing.xs),
        itemBuilder: (_, index) {
          final day = days[index];

          return Padding(
            padding:
                index == 0
                    ? const EdgeInsetsDirectional.only(start: 16.0)
                    : EdgeInsets.zero,
            child: DateItemWidget(
              day: day.day,
              weekDay: day.weekDay,
              selected: index == selectedIndex,
              onTap: () => onSelect(index),
            ),
          );
        },
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// FREQUENCY SECTION
// ─────────────────────────────────────────────────────────────

class FrequencySection extends StatelessWidget {
  const FrequencySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: UIColor.babyPink,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: UIColor.pink),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UIText.bodyBold('Frequency'),
              InkWell(
                onTap: () {
                  UIBottomSheet.show(
                    context: context,
                    content: FrequencyChangeSheetContent(
                      initialValue: FrequencyType.oneTime,
                      onSubmit: (value) {},
                    ),
                  );
                },
                child: UIText.bodyBold('Change', color: UIColor.babyBlue),
              ),
            ],
          ),
          SizedBox(height: 14),
          ElevatedButton(
            onPressed: () {},

            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: UIColor.pink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12),
              ),
            ),
            child: UIText.bodyBold('Repeats Bi-week', color: UIColor.white),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// CANCELLATION SECTION
// ─────────────────────────────────────────────────────────────

class CancellationSection extends StatelessWidget {
  const CancellationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        UIBottomSheet.show(
          context: context,
          content: const CancellationSheetContent(),
        );
      },
      child: WaringSectionWidget(),
    );
  }
}
