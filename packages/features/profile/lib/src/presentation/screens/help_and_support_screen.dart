import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundApp(
        content: CustomScrollView(
          slivers: [
            UISliverAppBar(
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Padding(
                  padding: EdgeInsets.only(left: 32, top: 16),
                  child: Divider(height: 4, color: UIColor.divider),
                ),
              ),
              variant: UISliverAppBarVariant.transparent,
              leading: backButtonAppBar(),
              centerTitle: true,
              titleWidget: UIText.h4('Help and Support'),
            ),
 SliverToBoxAdapter(
  child: Column(
    children: [
      UIText.caption('Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore Et Dolore Magna Aliqua. Ut Enim Ad Minim Veniam, Quis Nostrud Exercitation Ullamco Laboris Nisi Ut Aliquip Ex Ea Commodo Consequat.'),
      

    ],
  ),
 )

          ],
        ),
      ),
    );
  }
}
