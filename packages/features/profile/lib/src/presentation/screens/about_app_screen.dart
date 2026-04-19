import 'package:design_system/design_system.dart';
import 'package:profile/src/localization/profile_localization_scope.dart';
// import 'package:profile/profile.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  static const String _aboutPlaceholder =
      'Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore Et Dolore Magna Aliqua. Ut Enim Ad Minim Veniam, Quis Nostrud Exercitation Ullamco Laboris Nisi Ut Aliquip Ex Ea Commodo Consequat.';

  @override
  Widget build(BuildContext context) {
    final topContentPadding =
        MediaQuery.paddingOf(context).top + kToolbarHeight + UI.spacing.md;

    return UIScaffold(
      appBarTitle: context.profileTranslation.option.about,

      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          UI.spacing.lg,
          12,
          UI.spacing.lg,
          UI.spacing.lg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIText.bodyLarge(_aboutPlaceholder, color: UIColor.textSecondary),
            SizedBox(height: UI.spacing.md),
            UIText.bodyLarge(_aboutPlaceholder, color: UIColor.textSecondary),
            SizedBox(height: UI.spacing.md),
            UIText.bodyLarge(_aboutPlaceholder, color: UIColor.textSecondary),
            SizedBox(height: UI.spacing.md),
            UIText.bodyLarge(_aboutPlaceholder, color: UIColor.textSecondary),
            SizedBox(height: UI.spacing.md),
            UIText.bodyLarge(_aboutPlaceholder, color: UIColor.textSecondary),
            SizedBox(height: UI.spacing.md),
            UIText.bodyLarge(_aboutPlaceholder, color: UIColor.textSecondary),
            SizedBox(height: UI.spacing.md),
            UIText.bodyLarge(_aboutPlaceholder, color: UIColor.textSecondary),
            SizedBox(height: UI.spacing.md),
            UIText.bodyLarge(_aboutPlaceholder, color: UIColor.textSecondary),
          ],
        ),
      ),
    );
  }
}
