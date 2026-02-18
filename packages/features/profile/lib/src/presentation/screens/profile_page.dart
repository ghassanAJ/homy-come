import 'dart:developer';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile/src/presentation/widget/setting_option_profile_widget.dart';
import 'package:profile/src/presentation/widget/setting_profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ValueNotifier<bool> isActiveNotification = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: UIColor.babyBlue,
      // appBar: UIAppBarVariant(),
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
              titleWidget: UIText.h4('My profile'),
              pinned: false,
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 37,
                ),
                child: Column(
                  children: [
                    _dataUserProfileWidget(),
                    SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SettingProfileWidget(
                            isActiveNotification: isActiveNotification,
                          ),
                          SizedBox(height: 17),
                          _MoreSettingWidget(),
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

  Column _MoreSettingWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIText.h5('More'),
        SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.fromLTRB(16, 17, 16, 0),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: UIColor.background,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 44,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              SettingOptionProfileWidget(
                title: 'Help & Support',
                imgUrl: Assets.icons.notification,
                colorIcon: UIColor.grey,
                // descreption: 'FAQ',
                onTap: () {
                  log('pressed on FAQ button');
                },
              ),
              SettingOptionProfileWidget(
                title: 'About App',
                imgUrl: Assets.icons.heart,
                colorIcon: UIColor.grey,
                onTap: () {
                  log('pressed on FAQ button');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container _dataUserProfileWidget() {
    final ImagePicker picker = ImagePicker();
    ValueNotifier<XFile?> images = ValueNotifier(XFile(''));
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      width: double.infinity,
      // height: 89,
      decoration: BoxDecoration(
        boxShadow: UI.shadows.sm,
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          begin: AlignmentGeometry.topCenter,
          end: AlignmentGeometry.bottomCenter,
          colors: [UIColor.borderFocused, UIColor.softYellow],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              ValueListenableBuilder(
                valueListenable: images,
                builder:
                    (context, value, Widget? child) => SizedBox(
                      height: UI.sizes.avatarLg,
                      width: UI.sizes.avatarLg,
                      child: Stack(
                        alignment: AlignmentGeometry.bottomRight,
                        children: [
                          ProfilePictureWidget(
                            imageUrl: value?.path,
                            backgroundColor: UIColor.neutral200,
                            onTap: () async {
                              // Pick an image.
                              final XFile? image = await picker.pickImage(
                                source: ImageSource.gallery,
                              );
                              print(image?.path);
                              images.value = image;
                            },
                            showBorder: true,
                            size: ProfilePictureSize.lg,
                          ),
                          Positioned(
                            child: Container(
                              padding: EdgeInsets.all(4),
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: UIColor.background,
                              ),
                              child: SvgPicture.asset(
                                Assets.icons.carema,
                                package: 'design_system',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              ),
              SizedBox(width: 13),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UIText.bodySmallBold('User name'),
                  UIText.headerBody('+999 123 456 789'),
                ],
              ),
            ],
          ),

          Align(
            alignment: AlignmentGeometry.bottomCenter,
            child: Row(
              children: [
                UIText.bodySmallBold('Edit profile', color: UIColor.grey),
                SizedBox(width: UI.spacing.xs),
                SvgPicture.asset(
                  Assets.icons.arrowRight,
                  color: UIColor.grey,
                  package: "design_system",
                ),
                // Icon(
                //   Icons.arrow_circle_right_outlined
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
