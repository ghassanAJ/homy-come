import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authentication/authentication.dart';
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
    final resolvedProfileImageUrl = user?.profilePicture ?? profileImageUrl;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        UIAppBar(
          toolbarHeight: 60,
          automaticallyImplyLeading: false,
          leadingWidth: 84,
          middleSpacing: UI.spacing.sm,
          leading: CircleAvatar(
            radius: 24,
            backgroundColor: UIColor.black,
            child: ClipOval(
              child: UINetworkIamge(
                imageUrl: resolvedProfileImageUrl,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
                placeholder: UINetworkIamge(
                  imageUrl: profileImageUrl ?? '',
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          titleWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIText.bodySmall(
                user?.fullName ?? '',
                fontWeight: FontWeight.w700,
                color: UIColor.black,
              ),
              SizedBox(height: UI.spacing.xxs),
              Row(
                children: [
                  UIIamge(assetPath: Assets.images.location.path),
                  SizedBox(width: UI.spacing.xxs),
                  Flexible(
                    child: UIText.bodySmall(
                      user?.address?.toString() ?? '',
                      color: UIColor.neutral400,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
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
                    onTap: onSearchTap ?? () {
                      context.go(UserPaths.search);
                    },
                    child: UIIamge(assetPath: Assets.images.search.path),
                  ),
                  SizedBox(width: UI.spacing.sm),
                  GestureDetector(
                    onTap: onNotificationTap ?? () {
                      // TODO: Navigate to notifications screen when route is ready.
                    },
                    child: UIIamge(assetPath: Assets.images.notification.path),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
