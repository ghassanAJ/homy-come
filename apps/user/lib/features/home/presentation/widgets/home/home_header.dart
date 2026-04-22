import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user/features/home/presentation/widgets/home/user_home_screen_app_bar.dart';
import 'package:user/navigation/route.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    this.profileImageUrl,
    this.onSearchTap,
    this.onNotificationTap,
  });

  final String? profileImageUrl;
  final VoidCallback? onSearchTap;
  final VoidCallback? onNotificationTap;

  @override
  Widget build(BuildContext context) {
    final user = context.read<AppCubit>().state.user;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SizedBox(width: UI.spacing.md),

          // ProfilePictureWidget(
          //   imageUrl: resolvedProfileImageUrl,
          //   size: ProfilePictureSize.md,
          // ),
          SizedBox(width: UI.spacing.xs),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIText.bodySmall(
                  'Hi, ${user?.phone}' ?? '',
                  fontWeight: FontWeight.w700,
                  color: UIColor.black,
                ),
                SizedBox(height: 2),
                GestureDetector(
                  onTap: () async {
                    final userddressModel =
                        await LocationSetterUtil.pushToSetLocationScreen(
                          context,
                        );
                    if (userddressModel != null) {
                      context.read<AuthUserBloc>().add(
                        UpdateProfile({
                          "latitude": userddressModel.latitude,
                          "longitude": userddressModel.longitude,
                          "address": userddressModel.addressTitle,
                        }),
                      );
                    }
                  },
                  child: Row(
                    children: [
                      UISvg(Assets.icons.location, size: 16),

                      SizedBox(width: UI.spacing.xxs),
                      Flexible(
                        child: UIText.bodySmall(
                          user?.phone ?? 'no phone selected',
                          color: UIColor.neutral400,
                          maxLines: 1,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 16,
                        color: UIColor.neutral400,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: UI.padding.userHomeHeaderActionsMargin,
            padding: UI.padding.userHomeHeaderActionsPadding,
            decoration: BoxDecoration(
              color: UIColor.neutral100,
              borderRadius: BorderRadius.circular(UI.radius.md),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap:
                  // onSearchTap ??
                  () {
                    context.push(UserPaths.search);
                  },
                  child: UISvg(Assets.icons.navSearch, size: 20),
                ),
                SizedBox(width: UI.spacing.sm),
                GestureDetector(
                  onTap:
                      onNotificationTap ??
                      () {
                        context.push(
                          UserPaths.notifications,
                        ); // TODO: Navigate to notifications screen when route is ready.
                      },
                  child: UISvg(Assets.icons.notification, size: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
