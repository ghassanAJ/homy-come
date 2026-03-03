import 'package:design_system/design_system.dart';

class UIScaffold extends StatelessWidget {
  const UIScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.extendBodyBehindAppBar = true,
    this.extendBody = false,
    this.backgroundColor,
    this.appBarTitle,
    this.withBackgroundGradient = true,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.withBackButton = true,
  });
  final bool withBackButton;
  final PreferredSizeWidget? appBar;
  final Widget body;
  final bool extendBodyBehindAppBar;
  final bool extendBody;
  final bool withBackgroundGradient;
  final Color? backgroundColor;
  final String? appBarTitle;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appBarTitle != null && appBar == null
              ? UIAppBar(
                withBackButton: false,
                title: appBarTitle,
                backgroundColor: Colors.transparent,
              )
              : appBar,
      body:
          withBackgroundGradient
              ? Stack(children: [const UIBackground(), body])
              : body,
      backgroundColor: UIColor.background,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      extendBody: extendBody,
    );
  }
}
