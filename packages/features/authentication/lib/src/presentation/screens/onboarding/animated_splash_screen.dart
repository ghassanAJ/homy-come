import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:authentication/src/presentation/widgets/common/onboarding_bubble.dart';
import 'package:design_system/design_system.dart';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({super.key});

  @override
  _AnimatedSplashScreenState createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 400), () {
      if (!mounted) return;
      setState(() {
        _a = true;
      });
    });
    Timer(Duration(milliseconds: 400), () {
      if (!mounted) return;
      setState(() {
        _b = true;
      });
    });
    Timer(Duration(milliseconds: 1300), () {
      if (!mounted) return;

      setState(() {
        _c = true;
      });
    });
    Timer(Duration(milliseconds: 1700), () {
      if (!mounted) return;

      setState(() {
        _e = true;
      });
    });
    Timer(Duration(milliseconds: 3400), () {
      if (!mounted) return;

      setState(() {
        _d = true;
      });
    });
    Timer(Duration(milliseconds: 3850), () {
      // setState(() {
      //   Navigator.of(context).pushReplacement(
      //     ThisIsFadeRoute(
      //       route: OnboardingIntroPage(onGetStarted: () {}),
      //       page: SizedBox(),
      //     ),
      //   );
      // });
    });
  }

  bool _a = false;
  bool _b = false;
  bool _c = false;
  bool _d = false;
  bool _e = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final smallBubbleSize = UI.spacing.sm;
    final largeBubbleSize = UI.spacing.xl + UI.spacing.sm;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox.expand(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [UIColor.babyPink, UIColor.softYellow],
                      ),
                    ),
                  ),
                ),
                OnboardingBubble(
                  spec: OnboardingBubbleSpec(
                    top: 40,
                    right: -18,
                    size: largeBubbleSize,
                  ),
                ),
                Positioned(
                  top: 155,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: OnboardingBubbleDot(size: smallBubbleSize),
                  ),
                ),
                OnboardingBubble(
                  spec: OnboardingBubbleSpec(
                    bottom: 170,
                    left: -2,
                    size: smallBubbleSize,
                  ),
                ),
                OnboardingBubble(
                  spec: OnboardingBubbleSpec(
                    bottom: 104,
                    right: 12,
                    size: smallBubbleSize,
                  ),
                ),
              ],
            ),
          ),

          Center(
            child: Column(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: _d ? 900 : 2500),
                  curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
                  height:
                      _d
                          ? 0
                          : _a
                          ? h / 2
                          : 20,
                  width: 20,
                  // color: Colors.deepPurpleAccent,
                ),
                AnimatedContainer(
                  duration: Duration(
                    seconds:
                        _d
                            ? 1
                            : _c
                            ? 2
                            : 0,
                  ),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height:
                      _d
                          ? h
                          : _c
                          ? 80
                          : 20,
                  width:
                      _d
                          ? w
                          : _c
                          ? 200
                          : 20,
                  decoration: BoxDecoration(
                    color: _b ? UIColor.pink : Colors.transparent,
                    // shape: _c? BoxShape.rectangle : BoxShape.circle,
                    borderRadius:
                        _d ? BorderRadius.only() : BorderRadius.circular(30),
                  ),
                  child: Center(
                    child:
                        _e
                            ? AnimatedTextKit(
                              totalRepeatCount: 1,
                              animatedTexts: [
                                FadeAnimatedText(
                                  'Yalla Come',
                                  duration: Duration(milliseconds: 1700),
                                  textStyle: UI.text.h2.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto',
                                    color: UIColor.white,
                                  ),
                                ),
                              ],
                            )
                            : SizedBox(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ThisIsFadeRoute extends PageRouteBuilder {
  final Widget page;
  final Widget route;

  ThisIsFadeRoute({required this.page, required this.route})
    : super(
        pageBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) => page,
        transitionsBuilder:
            (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) => FadeTransition(opacity: animation, child: route),
      );
}
