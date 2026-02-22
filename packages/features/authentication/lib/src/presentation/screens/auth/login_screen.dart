import 'package:authentication/authentication.dart';
import 'package:authentication/src/localization/files/authenticationTranslation.i69n.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:util/util.dart';

/// Login screen: phone number entry for OTP verification.
///
/// Flow: enter phone → Verify → OTP screen (handled by [AuthNavigationListener]).
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final ValueNotifier<bool> _isFormValidNotifier = ValueNotifier(false);

  @override
  void dispose() {
    _isFormValidNotifier.dispose();
    super.dispose();
  }

  void _sendOTP() {
    FocusScope.of(context).unfocus();

    final formState = _formKey.currentState;
    if (formState == null || !formState.saveAndValidate()) return;

    final phone =
        (formState.value[AuthFormFieldNames.phone] as String?)?.trim() ?? '';
    if (phone.isEmpty) return;

    final request = SendOTPRequestModel(
      phone: phone,
      deviceId: AuthenticationConfig.deviceId,
    );

    context.read<AuthUserBloc>().add(SendOTP(request));
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
    return BlocListener<AuthUserBloc, AuthUserState>(
      listenWhen:
          (_, current) =>
              current is AuthUserStateError &&
              current.stateType == AuthUserErrorStateType.sendOTP,
      listener: (context, state) {
        if (state is AuthUserStateError) {
          ToastificationUtil.error(state.error.message);
        }
      },
      child: BlocBuilder<AuthUserBloc, AuthUserState>(
        buildWhen:
            (previous, current) =>
                (previous is AuthUserStateLoading) !=
                (current is AuthUserStateLoading),
        builder: (context, state) {
          final isLoading = state is AuthUserStateLoading;
          return _buildLayout(isLoading, tr);
        },
      ),
    );
  }

  Widget _buildLayout(bool isLoading, AuthenticationTranslation tr) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: UIColor.background,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(
                      UI.spacing.xxl2,
                      150,
                      UI.spacing.xxl2,
                      UI.spacing.md,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeader(tr),
                        SizedBox(height: UI.spacing.xxl),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: FormBuilder(
                            key: _formKey,
                            onChanged: _onFormChanged,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UIText.bodySmall(
                                  tr.login.phoneLabel,
                                  color: UIColor.textSecondary,
                                ),
                                SizedBox(height: UI.spacing.md),
                                UIFormBuilderPhoneField(
                                  name: AuthFormFieldNames.phone,
                                  placeholder: '321456987',
                                  defaultSelectedCountryIsoCode: 'AE',
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.phoneNumber(),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
                            label: tr.login.verifyButton,
                            onPressed: isValid ? _sendOTP : null,
                            expanded: true,
                          );
                        },
                      ),
                      SizedBox(height: UI.spacing.lg),
                      _buildSignUpLink(tr),
                      SizedBox(height: UI.spacing.xl),
                      _buildJoinAsGuestLink(tr),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isLoading) const MDProgressIndicator(styled: true),
      ],
    );
  }

  Widget _buildHeader(AuthenticationTranslation tr) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: const BoxDecoration(
              color: UIColor.softGreen,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: SizedBox(
              width: 45,
              height: 45,
              child: SvgPicture.asset(
                Assets.icons.phone,
                package: 'design_system',
              ),
            ),
          ),
          SizedBox(height: UI.spacing.lg),
          UIText.bodyMedium(
            tr.login.title,
            textAlign: TextAlign.center,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpLink(AuthenticationTranslation tr) {
    return Center(
      child: GestureDetector(
        onTap: () => AuthInternalRouter.of(context).toSignup(),
        child: UIText.buttonText(
          tr.login.signUp,
          color: UIColor.successBright,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildJoinAsGuestLink(AuthenticationTranslation tr) {
    return Center(
      child: GestureDetector(
        onTap: () {
          // TODO: Navigate as guest (e.g. dashboard with limited access)
          // AuthInternalRouter.of(context).goBack(); or go to dashboard
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(Assets.icons.logOut, package: 'design_system'),
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
      ),
    );
  }
}
