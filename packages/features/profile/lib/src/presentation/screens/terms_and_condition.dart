import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:profile/profile.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});
  @override
  Widget build(BuildContext context) {
    return InfoAppCommonScreen(
      title: context.profileTranslation.profile.term,
      content:
          'Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore Et Dolore Magna Aliqua. Ut Enim Ad Minim Veniam, Quis Nostrud Exercitation Ullamco Laboris Nisi Ut Aliquip Ex Ea Commodo Consequat.',
    );
  }
}

class InfoAppCommonScreen extends StatelessWidget {
  const InfoAppCommonScreen({
    super.key,
    required this.title,
    required this.content,
  });
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UIBackground(
        content: CustomScrollView(
          slivers: [
            UISliverAppBar(
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: UI.spacing.xl,
                    top: UI.spacing.md,
                  ),
                  child: Divider(height: 4, color: UIColor.divider),
                ),
              ),
              variant: UISliverAppBarVariant.transparent,
              leading: BackButtonAppBar(),
              centerTitle: true,
              titleWidget: UIText.h4(title),
              pinned: false,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  UI.spacing.lg,
                  UI.spacing.md,
                  UI.spacing.md,
                  0,
                ),
                child: Column(
                  children: [
                    UIText.bodyMedium(content, color: UIColor.textSecondary),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
