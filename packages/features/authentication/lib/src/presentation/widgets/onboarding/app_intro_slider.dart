import 'dart:async';

import 'package:authentication/authentication.dart';
import 'package:authentication/src/presentation/widgets/onboarding/onboarding_card.dart';
import 'package:design_system/design_system.dart';

class AppIntroSlider extends StatefulWidget {
  const AppIntroSlider({super.key});

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
    _startAutoScroll();
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

  @override
  Widget build(BuildContext context) {
    final pages = [
      _OnboardingData(
        image: 'assets/onboarding/onboarding-1.png',
        title: 'Slide 1 Title',
        subtitle: 'Slide 1 Subtitle',
      ),
      _OnboardingData(
        image: 'assets/onboarding/onboarding-2.png',
        title: 'Slide 2 Title',
        subtitle: 'Slide 2 Subtitle',
      ),
      _OnboardingData(
        image: 'assets/onboarding/onboarding-3.png',
        title: 'Slide 3 Title',
        subtitle: 'Slide 3 Subtitle',
      ),
    ];
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight / 1.2,
                  maxHeight: constraints.maxHeight / 1.2,
                  minWidth: constraints.maxWidth / 1,
                ),
                child: PageView.builder(
                  controller: _controller,
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                    // Restart auto-scroll when user manually swipes
                    _restartAutoScroll();
                  },
                  itemBuilder: (context, index) {
                    final data = pages[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 16,
                      ),
                      child: MDOnboardingCard(
                        image: data.image,
                        title: data.title,
                        height: constraints.maxHeight / 1.2,
                        subtitle: data.subtitle,
                      ),
                    );
                  },
                ),
              ),

              _buildPageIndicator(pages),
              _buildGetStartedButton(context),
            ],
          ),
        );
      },
    );
  }

  Row _buildPageIndicator(List<_OnboardingData> pages) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pages.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: _currentPage == index ? UIColor.primary : UIColor.border,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Container _buildGetStartedButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      margin: EdgeInsets.only(bottom: 16),
      child: UIButton.primary(
        label: 'Get started',
        onPressed: () {
          AuthInternalRouter.of(context).toLogin();
        },
        expanded: true,
      ),
    );
  }
}

class _OnboardingData {
  final String image;
  final String title;
  final String subtitle;

  _OnboardingData({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}
