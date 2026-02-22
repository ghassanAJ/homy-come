import 'dart:ui';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/localization/files/ProfileTranslation.i69n.dart';
import 'package:profile/src/presentation/widget/data_user_profile.dart';
import 'package:profile/src/presentation/widget/more_setting_widget.dart';
import 'package:profile/src/presentation/widget/setting_profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ValueNotifier<bool> isActiveNotification = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final ProfileTranslation tr = context.profileTranslation;
    return Scaffold(
      // backgroundColor: UIColor.babyBlue,
      // appBar: UIAppBarVariant(),
      body: UIBackground(
        content: CustomScrollView(
          slivers: [
            UIAnimatedSliverAppBarSimple(
              expandedHeight: 60,
              backgroundColor: Colors.transparent,
              // collapsedTitle: UIText.bodyLarge('my profile'),
              collapsedTitle: Row(
                children: [
                  CircleAvatar(radius: 14),
                  SizedBox(width: 8),
                  UIText.bodyLarge(context.profileTranslation.profile.myProfile),
                ],
              ),
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
              scrollController: ScrollController(),
              expandedContent: Stack(
                fit: StackFit.expand,
                children: [
                  CustomUIAppBarWidget(tr: tr),
                ],
              ),
            ),

            // UISliverAppBar(
            //   flexibleSpace: BackdropFilter(
            //     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
            //     child: Container(
            //       decoration: BoxDecoration(
            //         color: Colors.white.withOpacity(
            //           0.2,
            //         ), // Semi-transparent white background
            //       ),
            //     ),
            //   ),
            //   bottom: PreferredSize(
            //     preferredSize: Size.fromHeight(1),
            //     child: Padding(
            //       padding: EdgeInsets.only(
            //         left: UI.spacing.xl,
            //         top: UI.spacing.md,
            //       ),
            //       child: Divider(height: 4, color: UIColor.divider),
            //     ),
            //   ),
            //   variant: UISliverAppBarVariant.transparent,
            //   leading: const backButtonAppBar(),

            //   centerTitle: true,
            //   titleWidget: UIText.h4(tr.profile.myProfile),
            //   pinned: true,
            //   // floating: true,
            //   // snap: true,
            // ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: UI.spacing.lg,
                  vertical: 37,
                ),
                child: Column(
                  children: [
                    DataUserProfileWidget(context: context),
                    SizedBox(height: UI.spacing.lg), //24

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: UI.spacing.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SettingProfileWidget(
                            isActiveNotification: isActiveNotification,
                          ),
                          SizedBox(height: UI.spacing.md),
                          MoreSettingWidget(),
                        ],
                      ),
                    ),
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

class CustomUIAppBarWidget extends StatelessWidget {
  const CustomUIAppBarWidget({
    super.key,
    required this.tr,
  });

  final ProfileTranslation tr;

  @override
  Widget build(BuildContext context) {
    return UIAppBar(
      leading: backButtonAppBar(),
      variant: UIAppBarVariant.transparent,
      // title: 'my',
      // backgroundColor: Colors.transparent,
      centerTitle: true,
      titleWidget: UIText.h4(tr.profile.myProfile),
    
      // floating: true,
      // snap: true,
    );
  }
}
