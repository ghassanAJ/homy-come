import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile/profile.dart';

class UserProfileInfoWidget extends StatelessWidget {
  const UserProfileInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AppCubit>().state.user;
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
        borderRadius: BorderRadius.circular(UI.radius.xs),
        gradient: LinearGradient(
          begin: AlignmentGeometry.topCenter,
          end: AlignmentGeometry.bottomCenter,
          colors: UIColorGradient.yelloAndPinkGradiant,
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
                              // print(image?.path);
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
                              child: UISvg(
                                Assets.icons.carema,
                                // package: 'design_system',
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
                  UIText.bodySmallBold(user?.name ?? ''),
                  UIText.headerBody(user?.phone ?? ''),
                ],
              ),
            ],
          ),

          Align(
            alignment: AlignmentGeometry.bottomCenter,
            child: Row(
              children: [
                UIText.bodySmallBold(
                  context.profileTranslation.profile.editProfile,
                  color: UIColor.grey,
                ),
                SizedBox(width: UI.spacing.xs),
                UISvg(Assets.icons.arrowRightSvg, color: UIColor.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
