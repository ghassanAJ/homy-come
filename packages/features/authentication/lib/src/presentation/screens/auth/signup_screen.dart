import 'package:authentication/authentication.dart';
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
  final _formKey = GlobalKey<FormBuilderState>();
  final ValueNotifier<bool> _isFormValidNotifier = ValueNotifier(false);

  @override
  void dispose() {
    _isFormValidNotifier.dispose();
    super.dispose();
  }

  void _onFormChanged() {
    final isValid = _formKey.currentState?.isValid ?? false;
    if (_isFormValidNotifier.value != isValid) {
      _isFormValidNotifier.value = isValid;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.loc<AuthenticationTranslation>();
    return Scaffold(
      backgroundColor: UIColor.background,
      body: AuthEllipseBackground(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    UI.spacing.lg,
                    UI.spacing.xxl,
                    UI.spacing.lg,
                    UI.spacing.xl,
                  ),
                  child: FormBuilder(
                    key: _formKey,
                    onChanged: _onFormChanged,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UIText.h2(tr.login.signUp),
                        SizedBox(height: UI.spacing.xs),
                        UIText.bodySmall(
                          tr.personalInfo.subtitle,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: UI.spacing.lg),
                        UIText.bodySmall(
                          tr.personalInfo.personalPhoto,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: UI.spacing.xs),
                        Row(
                          children: [
                            Container(
                              width: 57,
                              height: 57,
                              decoration: const BoxDecoration(
                                color: UIColor.textPlaceholder,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: 33,
                                height: 33,
                                child: SvgPicture.asset(
                                  Assets.icons.photoCamera,
                                  package: 'design_system',
                                ),
                              ),
                            ),
                            SizedBox(width: UI.spacing.xs),
                            UIText.bodySmall(
                              tr.personalInfo.addPhoto,
                              color: UIColor.neutral300,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        SizedBox(height: UI.spacing.xl),

                        AppFormBuilderTextField(
                          name: tr.personalInfo.fullName,
                          label: tr.personalInfo.fullName,
                          placeholder: tr.personalInfo.userNamePlaceholder,
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: UI.spacing.md),
                              SvgPicture.asset(
                                Assets.icons.user,
                                package: 'design_system',
                              ),
                              SizedBox(width: UI.spacing.md),
                              Container(
                                width: 1,
                                height: 34,
                                color: UIColor.softgrey,
                              ),
                              SizedBox(width: UI.spacing.xs),
                            ],
                          ),
                          validator: FormBuilderValidators.required(),
                        ),

                        SizedBox(height: UI.spacing.md),
                        AppFormBuilderTextField(
                          name: tr.authIdentity.emailTitle,
                          label: tr.authIdentity.emailTitle,
                          placeholder: tr.personalInfo.emailPlaceholder,
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: UI.spacing.md),
                              SvgPicture.asset(
                                Assets.icons.email,
                                package: 'design_system',
                              ),
                              SizedBox(width: UI.spacing.md),
                              Container(
                                width: 1,
                                height: 34,
                                color: UIColor.softgrey,
                              ),
                              SizedBox(width: UI.spacing.xs),
                            ],
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                          ]),
                        ),
                        SizedBox(height: UI.spacing.md),
                        AppFormBuilderTextField(
                          name: tr.login.phoneLabel,
                          label: tr.login.phoneLabel,
                          placeholder: tr.personalInfo.phonePlaceholder,
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: UI.spacing.md),
                              SvgPicture.asset(
                                Assets.icons.call,
                                package: 'design_system',
                              ),
                              SizedBox(width: UI.spacing.md),
                              Container(
                                width: 1,
                                height: 34,
                                color: UIColor.softgrey,
                              ),
                              SizedBox(width: UI.spacing.xs),
                            ],
                          ),
                          validator: FormBuilderValidators.required(),
                        ),
                        SizedBox(height: UI.spacing.md),
                        AppFormBuilderTextField(
                          name: tr.personalInfo.country,
                          label: tr.personalInfo.country,
                          placeholder: tr.personalInfo.countryPlaceholder,
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: UI.spacing.md),
                              SvgPicture.asset(
                                Assets.icons.location,
                                package: 'design_system',
                              ),
                              SizedBox(width: UI.spacing.md),
                              Container(
                                width: 1,
                                height: 34,
                                color: UIColor.softgrey,
                              ),
                              SizedBox(width: UI.spacing.xs),
                            ],
                          ),
                          validator: FormBuilderValidators.required(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  UI.spacing.xl,
                  UI.spacing.md,
                  UI.spacing.xl,
                  UI.spacing.lg,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ValueListenableBuilder<bool>(
                      valueListenable: _isFormValidNotifier,
                      builder: (context, isValid, _) {
                        return UIButton.primary(
                          label: tr.login.signUp,
                          expanded: true,
                          onPressed: isValid ? () {} : null,
                        );
                      },
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
                          Assets.icons.logOut,
                          package: 'design_system',
                        ),
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
    );
  }
}
