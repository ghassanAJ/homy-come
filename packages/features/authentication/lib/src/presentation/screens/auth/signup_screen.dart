import 'package:authentication/authentication.dart';
import 'package:authentication/src/presentation/widgets/signup/profile_picture_picker.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:util/util.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  static const _fullNameField = 'full_name';
  static const _countryField = 'country';

  final _formKey = GlobalKey<FormBuilderState>();

  void _onSignupPressed() {
    FocusManager.instance.primaryFocus?.unfocus();
    final isValid = _formKey.currentState?.saveAndValidate() ?? false;
    if (!isValid) return;

    // TODO: Submit signup request.
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.loc<AuthenticationTranslation>();
    final personalInfo = tr.personalInfo;
    final keyboardInset = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: UIColor.background,
      body: AuthEllipseBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: UI.padding.authScrollable.copyWith(bottom: 0),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText.h2(tr.login.signUp),
                  SizedBox(height: UI.spacing.xs),
                  UIText.bodySmall(
                    personalInfo.subtitle,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: UI.spacing.lg),

                  UIText.bodySmall(
                    personalInfo.personalPhoto,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: UI.spacing.xs),
                  ProfilePicturePicker(onPhotoPicked: (_) {}),
                  SizedBox(height: UI.spacing.xl),

                  AppFormBuilderTextField(
                    name: _fullNameField,
                    label: personalInfo.fullName,
                    placeholder: personalInfo.username,
                    prefixIcon: _FieldPrefixIcon(iconPath: Assets.icons.user),
                    validator: FormBuilderValidators.required(
                      errorText: personalInfo.fullNameRequired,
                    ),
                  ),
                  SizedBox(height: UI.spacing.md),

                  AppFormBuilderTextField(
                    name: AuthFormFieldNames.email,
                    label: tr.authIdentity.emailTitle,
                    placeholder: personalInfo.emailPlaceholder,
                    prefixIcon: _FieldPrefixIcon(iconPath: Assets.icons.email),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: personalInfo.emailRequired,
                      ),
                      FormBuilderValidators.email(
                        errorText: personalInfo.emailInvalid,
                      ),
                    ]),
                  ),
                  SizedBox(height: UI.spacing.md),

                  AppFormBuilderTextField(
                    name: AuthFormFieldNames.phone,
                    label: tr.login.phoneLabel,
                    placeholder: personalInfo.phonePlaceholder,
                    keyboardType: TextInputType.phone,
                    prefixIcon: _FieldPrefixIcon(iconPath: Assets.icons.call),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: personalInfo.phoneRequired,
                      ),
                      FormBuilderValidators.match(
                        RegExp(r'^\d{10}$'),
                        errorText: personalInfo.phoneInvalid,
                      ),
                    ]),
                  ),
                  SizedBox(height: UI.spacing.md),

                  AppFormBuilderTextField(
                    name: _countryField,
                    label: personalInfo.country,
                    placeholder: personalInfo.countryPlaceholder,
                    prefixIcon: _FieldPrefixIcon(
                      iconPath: Assets.icons.location,
                    ),
                    validator: FormBuilderValidators.required(
                      errorText: personalInfo.countryRequired,
                    ),
                  ),
                  SizedBox(height: UI.spacing.xxl2),
                  Padding(
                    padding: UI.padding.authActions,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        UIButton.primary(
                          label: tr.login.signUp,
                          expanded: true,
                          onPressed: _onSignupPressed,
                        ),
                        SizedBox(height: UI.spacing.lg),
                        GestureDetector(
                          onTap: () => AuthInternalRouter.of(context).toLogin(),
                          child: UIText.bodyMedium(
                            tr.authEntry.loginButton,
                            color: UIColor.successBright,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: UI.spacing.xl),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              Assets.icons.logout,
                              package: 'design_system',
                            ),
                            SizedBox(width: UI.spacing.xs),
                            Text(
                              tr.login.joinAsGuest,
                              style: UI.text.bodySmall.copyWith(
                                color: UIColor.grey,
                                decoration: TextDecoration.underline,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FieldPrefixIcon extends StatelessWidget {
  final String iconPath;

  const _FieldPrefixIcon({required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: UI.spacing.md),
        SvgPicture.asset(iconPath, package: 'design_system'),
        SizedBox(width: UI.spacing.md),
        Container(width: 1, height: 34, color: UIColor.softgrey),
        SizedBox(width: UI.spacing.xs),
      ],
    );
  }
}
