import 'dart:math';

import 'package:authentication/authentication.dart';
import 'package:booking/booking.dart';
import 'package:booking/src/presentation/screens/service_details_step1.dart';
import 'package:booking/src/presentation/widgets/booking_step_app_bar.dart';
import 'package:booking/src/presentation/widgets/price_row_widget.dart';
import 'package:booking/src/presentation/widgets/step_navigation_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
    BookingWizardStep.selectDateTimeStep,
    BookingWizardStep.summary,
  ];

  final _stepWidgets = {
    BookingWizardStep.hoursStep: const ServiceDetailsScreenStep1(),
    BookingWizardStep.selectDateTimeStep: const ServiceDetailsStep3(), // TODO
    BookingWizardStep.summary: SummaryStep(),
  };

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingWizardBloc, BookingWizardState>(
      listenWhen:
          (prev, curr) =>
              prev.currentStep != curr.currentStep ||
              prev.isSubmitting != curr.isSubmitting,
      listener: (context, state) {
        if (state.submitSuccess) {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (c) => SubmitSuccessScreen()),
            // (_) => false,
          );
          context.read<BookingWizardBloc>().add(ResetWizard());
        }
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
              step: currentStep,
              currentStepIndex: currentStep.index + 2,
              // +
              //1, //+1 beciuase the service details screen is the first step
              stepsLength: _stepWidgets.length,
              onBack:
                  () =>
                  // Navigator.pop(context),
                  _handleBack(context, state),
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

  void _onNext(BuildContext context, BookingWizardState state) async {
    final bloc = context.read<BookingWizardBloc>();

    switch (state.currentStep) {
      // case BookingWizardStep.serviceDetails:
      //   bloc.add(ProceedToStep2());
      //   break;

      case BookingWizardStep.hoursStep:
        FocusScope.of(context).unfocus();
        bloc.add(ProceedToStep3());
        break;

      case BookingWizardStep.selectDateTimeStep:
        bloc.add(ProceedToSummary());
        break;

      case BookingWizardStep.summary:
        await _makePayment(context);
        // bloc.add(
        //   SubmitBooking(
        //     serviceId: '',
        //     customerId: '',
        //     addressId: '',
        //     addressLatitude: 0,
        //     addressLongitude: 0,
        //     addressName: '',
        //   ),
        // );
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

  Future<void> _makePayment(BuildContext context) async {
    // await StripePaymentService.initPaymentSheet(
    //   'pi_test_51FakeSecretClientSecretFromStripeTestMode',
    // );
    // await StripePaymentService.presentPaymentSheet();

    final WebViewController controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                // Update loading bar.
              },
              onPageStarted: (String url) {},
              onPageFinished: (String url) {},
              onHttpError: (HttpResponseError error) {},
              onWebResourceError: (WebResourceError error) {},
              onNavigationRequest: (NavigationRequest request) {
                if (request.url.startsWith('https://www.youtube.com/')) {
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(
            Uri.parse('https://book.stripe.com/test_eVqbJ274G1dV8nj7SeejK00'),
          );
    await UIBottomSheet.show(
      context: context,
      content: SizedBox(
        height: MediaQuery.sizeOf(context).height * .8,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onVerticalDragStart: (_) {}, // 👈 important hack
          child: WebViewWidget(controller: controller),
        ),
      ),
    );
    // showSuccessDialog();
  }

  void _onBack(BuildContext context, BookingWizardState state) {
    final bloc = context.read<BookingWizardBloc>();

    switch (state.currentStep) {
      case BookingWizardStep.popularsAddOn:
        bloc.add(const ProceedToStep1());
        break;

      case BookingWizardStep.selectDateTimeStep:
        bloc.add(const ProceedToStep1()); //TODO
        break;

      case BookingWizardStep.summary:
        bloc.add(const ProceedToStep3());
        break;

      default:
        Navigator.pop(context);
    }
  }

  bool _handleBack(BuildContext context, BookingWizardState state) {
    print('step is ${state.currentStep}');
    if (state.currentStep == BookingWizardStep.hoursStep) {
      Navigator.pop(context);
      return true; // don't allow pop
    }

    _onBack(context, state);
    return true;
  }
}

class SummaryStep extends StatelessWidget {
  const SummaryStep({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<BookingWizardBloc>().state;
    final selectedProvider = state.selectedProviders.first;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 145),
      child: Column(
        children: [
          SizedBox(height: UI.spacing.sm),

          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey.withOpacity(0.12),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(UI.spacing.lg, 12, UI.spacing.lg, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIText.h4('Service Details', color: UIColor.balck),
                SizedBox(height: UI.spacing.sm),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: UIColor.background,
                    borderRadius: BorderRadius.circular(UI.radius.md),
                    border: Border.all(color: UIColor.softgrey),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(UI.spacing.sm),
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: UIColor.babyPink,
                              ),
                              child: UINetworkImage(
                                imageUrl: selectedProvider.image,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(width: UI.spacing.sm),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  UIText.h3(
                                    selectedProvider.name,
                                    color: UIColor.balck,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: UI.sizes.iconXs,
                                        color: UIColor.warning,
                                      ),
                                      SizedBox(width: UI.spacing.xxs),
                                      UIText.bodySmall(
                                        selectedProvider.rating.toStringAsFixed(
                                          2,
                                        ),
                                        color: UIColor.warning,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 1, color: UIColor.softgrey),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(UI.spacing.sm),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  UIText.bodyXSmall(
                                    'Date',
                                    color: UIColor.grey,
                                  ),
                                  SizedBox(height: 2),
                                  UIText.bodySmall(
                                    _formatDate(state.scheduledAt) ?? '',
                                    color: UIColor.balck,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 50,
                            color: UIColor.softgrey,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(UI.spacing.sm),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  UIText.bodyXSmall(
                                    'Start Time',
                                    color: UIColor.grey,
                                  ),
                                  SizedBox(height: 2),
                                  UIText.bodySmall(
                                    ' ${state.scheduledAt?.hour}:00 AM',
                                    color: UIColor.balck,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(height: 1, color: UIColor.softgrey),
                      Padding(
                        padding: EdgeInsets.all(UI.spacing.sm),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UIText.bodyXSmall('Address', color: UIColor.grey),
                            SizedBox(height: 2),
                            UIText.bodySmall(
                              '${context.read<AppCubit>().state.user?.address}',
                            ),
                            SizedBox(height: UI.spacing.sm),
                            ClipRRect(
                              //TODO
                              borderRadius: BorderRadiusGeometry.circular(6),
                              child: SizedBox(
                                height: 80,
                                width: double.infinity,
                                child: GoogleMap(
                                  myLocationButtonEnabled: false,
                                  zoomControlsEnabled: false,
                                  zoomGesturesEnabled: false,
                                  scrollGesturesEnabled: false,
                                  rotateGesturesEnabled: false,
                                  tiltGesturesEnabled: false,
                                  compassEnabled: false,
                                  initialCameraPosition: CameraPosition(
                                    target: LatLng(
                                      context
                                              .read<AppCubit>()
                                              .state
                                              .user
                                              ?.latitude ??
                                          33.5,
                                      context
                                              .read<AppCubit>()
                                              .state
                                              .user
                                              ?.longitude ??
                                          44.2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: UI.spacing.lg),
                PriceRow(title: 'Working Hour', amount: '10'),
                PriceRow(title: 'Service Charge', amount: '${getTotal(state)}'),
                PriceRow(title: 'Deep Cleaning', amount: '20'),
                PriceRow(title: 'Fee', amount: '30'),
                PriceRow(
                  title: 'Total',
                  amount: (getTotal(state) ?? 0 + 30.0).toString(),
                  isTotal: true,
                ),
                SizedBox(height: UI.spacing.sm),
              ],
            ),
          ),
          SizedBox(height: UI.spacing.sm),

          CancellationSection(),
        ],
      ),
    );
  }

  num? getTotal(BookingWizardState state) {
    return state.selectedAddOns
        .map((addOn) => addOn.price.currentPrice)
        .toList()
        .reduce((a, b) => (a ?? 0) + (b ?? 0));
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    // Default format: yyyy-MM-dd
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}

class SubmitSuccessScreen extends StatelessWidget {
  const SubmitSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: BackButton(),
      //   backgroundColor: Colors.transparent,
      // ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.topCenter,
            end: AlignmentGeometry.bottomCenter,
            colors: [UIColor.pink, UIColor.softYellow],
          ),
        ),
        child: Center(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentGeometry.center,
            children: [
              Positioned(
                // right: -32,
                // top: -300,
                bottom: -100,
                left: -4,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: UIColor.softGreen,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                right: -32,
                top: -200,

                child: Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    color: UIColor.softGreen,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                left: -32,
                top: -300,

                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: UIColor.softGreen,
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              _buildTitles(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildButtons(context),
    );
  }

  Padding _buildButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0, right: 32, left: 32),
      child: Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        children: [
          UIButton.primary(
            leadingWidget: UISvg(Assets.icons.call, color: UIColor.vividGreen),
            label: 'Call Support',
            onPressed: () {},
            expanded: true,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: UIText.bodyMedium('Back to home'),
          ),
        ],
      ),
    );
  }

  Column _buildTitles() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedSuccessIcon(),
        SizedBox(height: 24),

        UIText.bodyLarge(
          'Your reservation has been completed successfully',
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 16),
        Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            text:
                'Your service was booked and payment was successfully processed at ',
            style: UI.text.h5,

            children: [
              TextSpan(
                text: '1:00 PM on Friday, December 24, 2025.',
                style: UI.text.h5.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AnimatedSuccessIcon extends StatefulWidget {
  const AnimatedSuccessIcon({super.key});

  @override
  State<AnimatedSuccessIcon> createState() => _AnimatedSuccessIconState();
}

class _AnimatedSuccessIconState extends State<AnimatedSuccessIcon>
    with TickerProviderStateMixin {
  late final AnimationController _mainController;
  late final AnimationController _floatingController;

  late final Animation<double> _scale;
  late final Animation<double> _fade;
  late final Animation<double> _rotation;

  @override
  void initState() {
    super.initState();

    // Main entrance animation
    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // Floating stars loop
    _floatingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _scale = CurvedAnimation(parent: _mainController, curve: Curves.elasticOut);

    _fade = CurvedAnimation(parent: _mainController, curve: Curves.easeIn);

    _rotation = Tween<double>(
      begin: 0,
      end: pi / 4,
    ).animate(CurvedAnimation(parent: _mainController, curve: Curves.easeOut));

    _mainController.forward();
  }

  @override
  void dispose() {
    _mainController.dispose();
    _floatingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: ScaleTransition(
        scale: _scale,
        child: SizedBox(
          width: 200,
          height: 200,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              // ⭐ Floating stars
              _buildFloatingStar(top: 0, left: 20, size: 28, delay: 0),
              _buildFloatingStar(bottom: 40, left: 10, size: 22, delay: .3),
              _buildFloatingStar(top: 20, right: 10, size: 18, delay: .6),
              _buildFloatingStar(bottom: 20, right: 20, size: 26, delay: .9),

              // 🔄 Rotating background
              AnimatedBuilder(
                animation: _rotation,
                builder: (_, child) {
                  return Transform.rotate(angle: _rotation.value, child: child);
                },
                child: Container(
                  height: 110,
                  width: 110,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: UIColor.babyBlue,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: UIColor.background),
                  ),
                ),
              ),

              // ✅ Main success icon
              UISvg(Assets.icons.sucessWithBorder),
            ],
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  // Floating Star Widget
  // ─────────────────────────────────────────────

  Widget _buildFloatingStar({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double size = 24,
    double delay = 0,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: AnimatedBuilder(
        animation: _floatingController,
        builder: (_, child) {
          final value = sin((_floatingController.value + delay) * 2 * pi);

          return Transform.translate(
            offset: Offset(0, value * 6), // floating effect
            child: Transform.scale(
              scale: 0.9 + (value * 0.1), // breathing
              child: child,
            ),
          );
        },
        child: UISvg(Assets.icons.starSuccess, size: size),
      ),
    );
  }
}
