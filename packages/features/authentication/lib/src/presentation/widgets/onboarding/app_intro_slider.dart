import 'dart:async';

import 'package:authentication/authentication.dart';
import 'package:authentication/src/presentation/widgets/onboarding/onboarding_card.dart';
import 'package:design_system/design_system.dart';
import 'package:util/util.dart';

class AppIntroSlider extends StatefulWidget {
  final VoidCallback onComplete;

  const AppIntroSlider({super.key, required this.onComplete});

  @override
  State<AppIntroSlider> createState() => _AppIntroSliderState();
}

class _AppIntroSliderState extends State<AppIntroSlider> {
  int _currentPage = 0;
  final PageController _controller = PageController();
  Timer? _autoScrollTimer;

  @override
  void initState() {
    super.initState();
    // _startAutoScroll();
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(
      Duration(seconds: AuthenticationConfig.onBoardingAutoScrollPerSeconds),
      (timer) {
        // Will use pages.length from the builder context
        if (_controller.hasClients && _currentPage < 2) {
          _controller.animateToPage(
            (_currentPage + 1),
            duration: Duration(
              milliseconds:
                  AuthenticationConfig
                      .onBoardingAutoScrollDurationPerMilliSeconds,
            ),
            curve: Curves.easeInOut,
          );
        }
      },
    );
  }

  void _stopAutoScroll() {
    _autoScrollTimer?.cancel();
  }

  void _restartAutoScroll() {
    _stopAutoScroll();
    _startAutoScroll();
  }

  Future<void> _onSkip() async {
    _stopAutoScroll();
    widget.onComplete();
  }

  Future<void> _onNext(int pagesLength) async {
    if (_currentPage >= pagesLength - 1) {
      _stopAutoScroll();
      widget.onComplete();
      return;
    }

    await _controller.animateToPage(
      _currentPage + 1,
      duration: Duration(
        milliseconds:
            AuthenticationConfig.onBoardingAutoScrollDurationPerMilliSeconds,
      ),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final topSystemPadding = MediaQuery.paddingOf(context).top;
    final tr = context.loc<AuthenticationTranslation>();
    final pages = [
      _OnboardingData(
        imagePath: Assets.icons.onboarding1,
        title: tr.onboarding.slide1Title,
        subtitle: tr.onboarding.slide1Subtitle,
      ),
      _OnboardingData(
        imagePath: Assets.icons.onboarding2,
        title: tr.onboarding.slide2Title,
        subtitle: tr.onboarding.slide2Subtitle,
      ),
      _OnboardingData(
        imagePath: Assets.icons.onboarding3,
        title: tr.onboarding.slide3Title,
        subtitle: tr.onboarding.slide3Subtitle,
      ),
    ];

    final topPadding =
        topSystemPadding +
        UI.padding.onboardingSliderTopOffset(screenHeight: screenSize.height);
    final availableHeight = screenSize.height - topPadding;
    final sliderHeight = availableHeight * 0.66;

    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: SizedBox(
        width: screenSize.width,
        height: availableHeight,
        child: Column(
          children: [
            SizedBox(
              width: screenSize.width,
              height: sliderHeight,
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                  _restartAutoScroll();
                },
                itemBuilder: (context, index) {
                  final data = pages[index];
                  return MDOnboardingCard(
                    imagePath: data.imagePath,
                    title: data.title,
                    height: sliderHeight,
                    subtitle: data.subtitle,
                  );
                },
              ),
            ),
            SizedBox(height: UI.spacing.lg),
            _buildPageIndicator(pages),
            const Spacer(),
            _buildBottomActions(context, pages.length),
          ],
        ),
      ),
    );
  }

  Row _buildPageIndicator(List<_OnboardingData> pages) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pages.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: UI.spacing.xxs),
          width: UI.spacing.xs,
          height: UI.spacing.xs,
          decoration: BoxDecoration(
            color: _currentPage == index ? UIColor.primary : UIColor.border,
            borderRadius: BorderRadius.circular(UI.radius.sm),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomActions(BuildContext context, int pagesLength) {
    final tr = context.loc<AuthenticationTranslation>();
    final isLastPage = _currentPage == pagesLength - 1;

    return Padding(
      padding: UI.padding.onboardingActions,
      child: Row(
        textDirection: Directionality.of(context),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _onSkip,
            child: Padding(
              padding: UI.padding.verticalSm,
              child: UIText.bodyMedium(
                tr.onboarding.skip,
                color: UIColor.balck,
                fontSize: 17,
              ),
            ),
          ),
          UIButton.primary(
            label: isLastPage ? tr.onboarding.finish : tr.onboarding.next,
            onPressed: () => _onNext(pagesLength),
          ),
        ],
      ),
    );
  }
}

class _OnboardingData {
  final String imagePath;
  final String title;
  final String subtitle;

  _OnboardingData({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });
}
