import 'package:booking/booking.dart';
import 'package:booking/src/presentation/widgets/step_navigation_bar.dart';
import 'package:flutter/services.dart';

class ServiceDetailsScreenStep1 extends StatefulWidget {
  const ServiceDetailsScreenStep1({super.key});

  @override
  State<ServiceDetailsScreenStep1> createState() =>
      _ServiceDetailsScreenStep1State();
}

class _ServiceDetailsScreenStep1State extends State<ServiceDetailsScreenStep1> {
  late final TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    final initialNotes = context.read<BookingWizardBloc>().state.notes;
    _notesController = TextEditingController(text: initialNotes)..addListener(
      () => context.read<BookingWizardBloc>().add(
        UpdateNotes(notes: _notesController.text),
      ),
    );
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  Widget _sectionTitle(String title) =>
      UIText.h6(title, color: UIColor.balck, maxLines: 2);

  @override
  Widget build(BuildContext context) {
    final topContentPadding =
        MediaQuery.paddingOf(context).top + kToolbarHeight + UI.spacing.md;

    return BlocConsumer<BookingWizardBloc, BookingWizardState>(
      listenWhen:
          (prev, curr) =>
              curr.currentStep == BookingWizardStep.popularsAddOn &&
              prev.currentStep != BookingWizardStep.popularsAddOn,
      listener: (context, state) {
        // Navigator.of(context).push(
        //   MaterialPageRoute<void>(
        //     builder:
        //         (_) => BlocProvider.value(
        //           value: context.read<BookingWizardBloc>(),
        //           child: const BaseBookingStep(), //TODO
        //         ),
        //   ),
        // );
      },
      builder: (context, state) {
        return Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(0, 0, 0, UI.sizes.bottomPadding),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      UI.spacing.lg,
                      UI.spacing.lg,
                      UI.spacing.xxs,
                      0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _sectionTitle(
                          'How many hours do you need your professional to stay?',
                        ),
                        SizedBox(height: UI.spacing.sm),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            spacing: UI.spacing.xs,
                            runSpacing: UI.spacing.xs,
                            children: List.generate(
                              7,
                              (index) => CircleNumberOptionWidget(
                                value: index + 1,
                                selected: state.durationHours == index + 1,
                                onTap:
                                    () => context.read<BookingWizardBloc>().add(
                                      UpdateDurationHours(hours: index + 1),
                                    ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: UI.spacing.lg),
                        _sectionTitle('How many professionals do you need?'),
                        SizedBox(height: UI.spacing.sm),
                        Wrap(
                          spacing: UI.spacing.xs,
                          runSpacing: UI.spacing.xs,
                          children: [
                            for (final label in const [
                              'One Professional',
                              '2 to 4',
                              '4 to 6',
                              'More than',
                            ])
                              ChoiceChipButtonWidget(
                                label: label,
                                selected: state.professionalCount == label,
                                onTap:
                                    () => context.read<BookingWizardBloc>().add(
                                      UpdateProfessionalCount(count: label),
                                    ),
                              ),
                          ],
                        ),
                        SizedBox(height: UI.spacing.lg),
                        _sectionTitle('Need cleaning materials?'),
                        SizedBox(height: UI.spacing.sm),
                        Wrap(
                          spacing: UI.spacing.xs,
                          children: [
                            ChoiceChipButtonWidget(
                              label: 'No, I have them',
                              selected: !state.needCleaningMaterials,
                              onTap:
                                  () => context.read<BookingWizardBloc>().add(
                                    const UpdateNeedCleaningMaterials(
                                      value: false,
                                    ),
                                  ),
                            ),
                            ChoiceChipButtonWidget(
                              label: 'Yes please',
                              selected: state.needCleaningMaterials,
                              onTap:
                                  () => context.read<BookingWizardBloc>().add(
                                    const UpdateNeedCleaningMaterials(
                                      value: true,
                                    ),
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(height: UI.spacing.lg),
                        _sectionTitle('Any notes?'),
                        SizedBox(height: UI.spacing.sm),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: UI.spacing.lg),
                    child: TextField(
                      controller: _notesController,
                      maxLines: 4,
                      style: UI.text.bodyMedium.copyWith(color: UIColor.balck),
                      inputFormatters: [LengthLimitingTextInputFormatter(400)],
                      decoration: InputDecoration(
                        hintText: 'Add your notes',
                        hintStyle: UI.text.bodyMedium.copyWith(
                          color: UIColor.grey,
                        ),
                        filled: true,
                        fillColor: UIColor.background,
                        contentPadding: EdgeInsets.all(UI.spacing.md),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(UI.radius.lg),
                          borderSide: BorderSide(color: UIColor.neutral200),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(UI.radius.lg),
                          borderSide: BorderSide(color: UIColor.primary),
                        ),
                      ),
                    ),
                  ),
                  if (state.step1ValidationError != null) ...[
                    SizedBox(height: UI.spacing.sm),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: UI.spacing.lg),
                      child: UIText.bodySmall(
                        state.step1ValidationError!,
                        color: UIColor.error,
                      ),
                    ),
                  ],
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
                  next:
                      () => context.read<BookingWizardBloc>().add(
                        const ProceedToStep2(),
                      ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
