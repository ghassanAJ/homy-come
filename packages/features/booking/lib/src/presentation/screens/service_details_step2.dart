import 'package:booking/booking.dart';

class ServiceDetailsStep2 extends StatelessWidget {
  const ServiceDetailsStep2({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<BookingWizardBloc>().state;
    final allAddOns =
        state.serviceDetails?.addonCategories
            .expand((c) => c.services)
            .toList() ??
        [];

    return Stack(
      children: [
        allAddOns.isEmpty
            ? Center(
              child: UIText.bodyMedium(
                'No add-ons available.',
                color: UIColor.textSecondary,
              ),
            )
            : Padding(
              padding: EdgeInsets.fromLTRB(
                UI.spacing.md,
                0,
                UI.spacing.md,
                UI.sizes.bottomNavigationBarHeight,
              ),
              child: GridView.builder(
                itemCount: allAddOns.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: UI.spacing.sm,
                  mainAxisSpacing: UI.spacing.sm,
                  childAspectRatio: 3 / 5,
                ),
                itemBuilder: (context, i) {
                  final item = allAddOns[i];
                  final isSelected = state.selectedAddOns.contains(item);
                  return AddonServiceCard(
                    title: item.info.name,

                    reviews: '(${item.durationMinutes} min)',
                    price: item.price.currentPrice?.toString() ?? '-',
                    oldPrice: item.price.newPrice?.toString() ?? '-',
                    selected: isSelected,
                    onTap:
                        () => context.read<BookingWizardBloc>().add(
                          ToggleAddOn(addOnId: item),
                        ),
                  );
                },
              ),
            ),
        if (state.step2ValidationError != null)
          Positioned(
            bottom: UI.sizes.bottomNavigationBarHeight + UI.spacing.sm,
            left: UI.spacing.lg,
            right: UI.spacing.lg,
            child: UIText.bodySmall(
              state.step2ValidationError!,
              color: UIColor.error,
              textAlign: TextAlign.center,
            ),
          ),

        // SafeArea(
        //   top: false,
        //   minimum: EdgeInsets.fromLTRB(
        //     UI.spacing.lg,
        //     UI.spacing.sm,
        //     UI.spacing.lg,
        //     UI.spacing.sm,
        //   ),
        //   child: Align(
        //     alignment: Alignment.bottomCenter,
        //     child: StepNavigationBar(
        //       next:
        //           () => context.read<BookingWizardBloc>().add(
        //             const ProceedToStep3(),
        //           ),
        //     ),
        //   ),
        // ),
      ],
    );

    // BlocConsumer<BookingWizardBloc, BookingWizardState>(
    //   listenWhen:
    //       (prev, curr) =>
    //           curr.currentStep == BookingWizardStep.selectDateTimeStep &&
    //           prev.currentStep != BookingWizardStep.selectDateTimeStep,
    //   listener: (context, state) {
    //     Navigator.of(context).push(
    //       MaterialPageRoute<void>(
    //         builder:
    //             (_) => BlocProvider.value(
    //               value: context.read<BookingWizardBloc>(),
    //               child: const ServiceDetailsStep3(),
    //             ),
    //       ),
    //     );
    //   },
    //   builder: (context, state) {
    //     // Flatten all add-on services from every category.
    //     final allAddOns =
    //         state.serviceDetails?.addonCategories
    //             .expand((c) => c.services)
    //             .toList() ??
    //         const <AddOnServiceModel>[];

    //     return UIScaffold(
    //       appBar: UIAppBar(
    //         titleWidget: Column(
    //           children: [
    //             UIText.h6('Popular add-ons', color: UIColor.balck),
    //             UIText.bodySmall('Step 2 of 4', color: UIColor.textSecondary),
    //           ],
    //         ),
    //         leading: GestureDetector(
    //           onTap: () {
    //             if (Navigator.of(context).canPop()) Navigator.of(context).pop();
    //           },
    //           child: const BackButtonAppBar(),
    //         ),
    //       ),
    //       withBackgroundGradient: true,
    //       floatingActionButton: Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
    //         child: StepNavigationBar(
    //           next:
    //               () => context.read<BookingWizardBloc>().add(
    //                 const ProceedToStep3(),
    //               ),
    //         ),
    //       ),
    //       body:

    //   },
    // );
  }
}
