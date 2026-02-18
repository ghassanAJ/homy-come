import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/localization/files/ProfileTranslation.i69n.dart';
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
              leading: backButtonAppBar(),

              centerTitle: true,
              titleWidget: UIText.h4(
                tr.profile.myProfile,
              ),
              pinned: false,
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: UI.spacing.lg,
                  vertical: 37,
                ),
                child: Column(
                  children: [
                    _dataUserProfileWidget(),
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

  Widget _dataUserProfileWidget() {
    final ImagePicker picker = ImagePicker();
    ValueNotifier<XFile?> images = ValueNotifier(XFile(''));
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: UI.spacing.sm,
        horizontal: UI.spacing.md,
      ),
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
                              padding: EdgeInsets.all(UI.spacing.xxs),
                              width: UI.sizes.iconSm,
                              height: UI.sizes.iconSm,
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
              SizedBox(width: UI.spacing.sm), //13
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
                UIText.bodySmallBold(context.profileTranslation.profile.editProfile, color: UIColor.grey),
                SizedBox(width: UI.spacing.xs),
                SvgPicture.asset(
                  Assets.icons.arrowRight,
                  color: UIColor.grey,
                  package: "design_system",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
