import 'dart:ui';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/localization/files/ProfileTranslation.i69n.dart';
import 'package:profile/src/presentation/widget/data_user_profile.dart';
import 'package:profile/src/presentation/widget/more_setting_widget.dart';
import 'package:profile/src/presentation/widget/setting_option_profile_widget.dart';
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
              expandedHeight: UI.sizes.appBarHeight,
              backgroundColor: Colors.transparent,
              // collapsedTitle: UIText.bodyLarge('my profile'),
              collapsedTitle: Row(
                children: [
                  CircleAvatar(radius: UI.sizes.statusIcon),
                  SizedBox(width: UI.spacing.xs),
                  UIText.bodyLarge(
                    context.profileTranslation.profile.myProfile,
                  ),
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
                children: [CustomUIAppBarWidget(title: tr.profile.myProfile)],
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: UI.spacing.lg,
                  vertical: UI.spacing.xl,
                ),
                child: Column(
                  children: [
                    UserProfileInfoWidget(context: context),
                    SizedBox(height: UI.spacing.lg), //24

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: UI.spacing.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileSettingWidget(
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
    required this.title,
    this.notification,
    this.search,
  });
  final String title;
  final Function? notification;
  final Function? search;
  @override
  Widget build(BuildContext context) {
    return UIAppBar(
      leading: BackButtonAppBar(),
      variant: UIAppBarVariant.transparent,
      // title: 'my',
      // backgroundColor: Colors.transparent,
      centerTitle: true,
      titleWidget: UIText.h4(title),
      actions: [
        if (notification != null || search != null)
          CustomActionAppBarWidget(notification: notification),
      ],
      // floating: true,
      // snap: true,
    );
  }
}

class CustomActionAppBarWidget extends StatelessWidget {
  const CustomActionAppBarWidget({super.key, required this.notification});

  final Function? notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(right: UI.spacing.lg),
      padding: EdgeInsets.symmetric(
        horizontal: UI.spacing.xs,
        vertical: UI.spacing.xxs,
      ),
      // width: 50,
      height: UI.sizes.iconLg,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(UI.radius.sm),
        color: UIColor.neutral100,
      ),
      child: Column(
        children: [
          if (notification != null) UISvg(icon: Assets.icons.notification),
          SizedBox(width: UI.spacing.sm),
          UISvg(icon: Assets.icons.notification),
        ],
      ),
    );
  }
}
