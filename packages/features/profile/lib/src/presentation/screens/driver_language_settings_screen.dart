import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/presentation/widget/driver/driver_profile_settings_row.dart';
import 'package:util/util.dart';

class DriverLanguageSettingsScreen extends StatelessWidget {
  const DriverLanguageSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final topContentPadding =
        MediaQuery.paddingOf(context).top + kToolbarHeight + UI.spacing.md;

    return UIScaffold(
      appBar: UIAppBar(
        title: context.profileTranslation.driverProfile.language,
        leading: GestureDetector(
          onTap: () {
            if (context.canPop()) context.pop();
          },
          child: const BackButtonAppBar(),
        ),
      ),
      body: BlocBuilder<LocalizationCubit, Locale>(
        builder: (context, currentLocale) {
          return SingleChildScrollView(
            padding: UI.padding.driverProfileSettingsContent(
              topInset: topContentPadding,
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(color: UIColor.background),
              child: Column(
                children: [
                  SettingsRow(
                    title: 'English',
                    trailing:
                        currentLocale.languageCode == 'en'
                            ? Icon(
                              Icons.check,
                              color: UIColor.softGreen,
                              size: UI.sizes.iconSm,
                            )
                            : const SizedBox.shrink(),
                    onTap: () => _selectLanguage(context, const Locale('en')),
                  ),
                  SettingsRow(
                    title: 'العربية',
                    trailing:
                        currentLocale.languageCode == 'ar'
                            ? Icon(
                              Icons.check,
                              color: UIColor.softGreen,
                              size: UI.sizes.iconSm,
                            )
                            : const SizedBox.shrink(),
                    showDivider: false,
                    onTap: () => _selectLanguage(context, const Locale('ar')),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _selectLanguage(BuildContext context, Locale locale) {
    context.read<LocalizationCubit>().setLocale(locale);
    (context).pop();
  }
}
