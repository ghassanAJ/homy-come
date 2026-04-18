import 'package:booking/booking.dart';
import 'package:booking/src/presentation/screens/service_details_step1.dart';
import 'package:booking/src/presentation/widgets/booking_step_app_bar.dart';
import 'package:booking/src/presentation/widgets/step_navigation_bar.dart';

class BaseBookingStep extends StatefulWidget {
  const BaseBookingStep({super.key});

  @override
  State<BaseBookingStep> createState() => _BaseBookingStepState();
}

class _BaseBookingStepState extends State<BaseBookingStep> {
  final PageController _pageController = PageController();

  /// Step registry (single source for UI)
  // late final List<BookingWizardStep> _stepsOrder;

  // late final Map<BookingWizardStep, Widget> _stepWidgets;

  final _stepsOrder = const [
    BookingWizardStep.hoursStep,
    // BookingWizardStep.popularsAddOn,
    BookingWizardStep.selectDateTimeStep,
    BookingWizardStep.summary,
  ];

  final _stepWidgets = {
    BookingWizardStep.hoursStep: const ServiceDetailsScreenStep1(),
    // BookingWizardStep.popularsAddOn: const ServiceDetailsStep2(),
    BookingWizardStep.selectDateTimeStep: const ServiceDetailsStep3(), // TODO
    BookingWizardStep.summary: const SizedBox(), // TODO
  };
  @override
  void initState() {
    super.initState();

    // _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingWizardBloc, BookingWizardState>(
      listenWhen: (prev, curr) => prev.currentStep != curr.currentStep,
      listener: (context, state) {
        _animateToStep(state.currentStep);
      },
      builder: (context, state) {
        final currentStep = _getCurrentStep(state);

        return WillPopScope(
          onWillPop: () async {
            final handled = _handleBack(context, state);
            return !handled;
          },
          child: UIScaffold(
            withBackgroundGradient: true,
            appBar: BookingStepAppBar(
              currentStepIndex: 0,
              stepsLength: _stepWidgets.length,
              onBack: () => Navigator.pop(context),
              //  _handleBack(context, state),
              title: state.serviceDetails?.info.name ?? 'Booking',
            ),

            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: StepNavigationBar(
                // currentStep: currentStep,
                next: () => _onNext(context, state),
                // onBack: () => _onBack(context, state),
                // isLoading: state.isSubmitting,
              ),
            ),
            body: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children:
                  _stepsOrder.map((step) {
                    return _stepWidgets[step] ?? const SizedBox();
                  }).toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int _getPageIndex(BookingWizardStep step) {
    return _stepsOrder.indexOf(step);
  }

  BookingWizardStep _getCurrentStep(BookingWizardState state) {
    return state.currentStep;
  }

  void _animateToStep(BookingWizardStep step) {
    final index = _getPageIndex(step);
    if (index == -1) return;

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onNext(BuildContext context, BookingWizardState state) {
    final bloc = context.read<BookingWizardBloc>();

    switch (state.currentStep) {
      // case BookingWizardStep.serviceDetails:
      //   bloc.add(ProceedToStep2());
      //   break;

      case BookingWizardStep.hoursStep:
        bloc.add(ProceedToStep3());
        break;

      case BookingWizardStep.selectDateTimeStep:
        bloc.add(ProceedToSummary());
        break;

      case BookingWizardStep.summary:
        bloc.add(ProceedToSummary());
        break;

      case BookingWizardStep.summary:
        bloc.add(
          SubmitBooking(
            serviceId: state.serviceDetails!.id.toString(),
            customerId: 'TODO',
            addressId: 'TODO',
            addressLatitude: 0,
            addressLongitude: 0,
            addressName: 'TODO',
          ),
        );
        break;

      default:
        break;
    }
  }

  void _onBack(BuildContext context, BookingWizardState state) {
    final bloc = context.read<BookingWizardBloc>();

    switch (state.currentStep) {
      case BookingWizardStep.popularsAddOn:
        bloc.add(const ProceedToStep1());
        break;

      case BookingWizardStep.selectDateTimeStep:
        bloc.add(const ProceedToStep2());
        break;

      case BookingWizardStep.summary:
        bloc.add(const ProceedToStep3());
        break;

      default:
        Navigator.pop(context);
    }
  }

  bool _handleBack(BuildContext context, BookingWizardState state) {
    if (state.currentStep == BookingWizardStep.hoursStep) {
      return true; // don't allow pop
    }

    _onBack(context, state);
    return true;
  }
}
