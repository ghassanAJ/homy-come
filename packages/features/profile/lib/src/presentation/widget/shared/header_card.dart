import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/profile.dart';
import 'package:util/util.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key, this.showRating = false, this.rating = 5.0});

  final bool showRating;
  final double rating;

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AppCubit>().state.user;

    return UICardContainer(
      width: double.infinity,
      child: Padding(
        padding: UI.padding.driverProfileHeaderContent,
        child: Column(
          children: [
            // Avatar(
            //   showName: false,
            //   size: AvatarSize.xlLarge,
            //   imageUrl: user?.profilePicture,
            //   placeholderWidget: Container(
            //     color: UIColor.neutral100,
            //     child: Icon(
            //       Icons.person,
            //       color: UIColor.neutral400,
            //       size: UI.sizes.iconMd,
            //     ),
            //   ),
            // ),
            SizedBox(height: UI.spacing.sm),
            UIText.bodyLarge(
              user?.name ?? '',
              fontWeight: FontWeight.w700,
              color: UIColor.neutral975,
            ),
            if (showRating) ...[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: UI.spacing.xs),
                  UISvg(
                    Assets.icons.starOutline,
                    color: UIColor.orange,
                    size: UI.spacing.sm,
                  ),
                  SizedBox(width: UI.spacing.xxs),
                  UIText.bodyXSmall(
                    rating.toStringAsFixed(1),
                    color: UIColor.softOrange,
                  ),
                ],
              ),
              SizedBox(height: UI.spacing.xxs),
            ],
            UIText.bodySmall(user?.phone ?? '', color: UIColor.neutral975),
            SizedBox(height: UI.spacing.md),
            InkWell(
              onTap: () {
                UIBottomSheet.show(
                  context: StatefulNavigationShell.of(context).context,
                  content: LocalizationProvider<AuthenticationTranslation>(
                    delegate: AuthLocalizationDelegate(),
                    child: SignUpScreen(isEditMood: true),
                  ),
                );
                // Navigator.push(
                //   StatefulNavigationShell.of(context).context,
                //   MaterialPageRoute(
                //     builder:
                //         (c) => LocalizationProvider<AuthenticationTranslation>(
                //           delegate: AuthLocalizationDelegate(),
                //           child: SignUpScreen(isEditMood: true),
                //         ),
                //   ),
                // );
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(UI.radius.sm),
                  border: Border.all(color: UIColor.neutral150),
                ),
                child: Padding(
                  padding: UI.padding.driverProfileHeaderEditButtonContent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UIText.bodySmall(
                        context.profileTranslation.profile.editProfile,
                        color: UIColor.neutral475,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(width: UI.spacing.xs),
                      UISvg(Assets.icons.arrow, color: UIColor.neutral500),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
