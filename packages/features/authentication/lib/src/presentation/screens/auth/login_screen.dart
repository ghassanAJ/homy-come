import 'dart:developer';

import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
      // listenWhen:
      //     (_, current) =>
      //         current is AuthUserStateError &&
      //         current.stateType == AuthUserErrorStateType.sendOTP,
      listener: (context, state) {
        log(state.runtimeType.toString());
        if (state is AuthUserStateError) {
          ToastificationUtil.error(state.error.message);
        }
      },
      child: BlocBuilder<AuthUserBloc, AuthUserState>(
        // buildWhen:
        //     (previous, current) =>
        //         (previous is AuthUserStateLoading) !=
        //         (current is AuthUserStateLoading),
        builder: (context, state) {
          log('build');
          final isLoading = state is AuthUserStateLoading;
          return _buildLayout(isLoading, tr);
        },
      ),
    );
  }

  Widget _buildLayout(bool isLoading, AuthenticationTranslation tr) {
    return UIScaffold(
      resizeToAvoidBottomInset: true, // ✅ IMPORTANT
      backgroundColor: UIColor.background,
      body: SafeArea(
        child: Column(
          children: [
            /// 🔹 Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: FormBuilder(
                  key: _formKey,
                  onChanged: _onFormChanged,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: UI.spacing.xxl),
                      _buildHeader(tr),
                      SizedBox(height: UI.spacing.xxl),

                      UIText.bodySmall(
                        tr.login.phoneLabel,
                        color: UIColor.textSecondary,
                      ),
                      SizedBox(height: UI.spacing.md),

                      UIFormBuilderPhoneField(
                        name: AuthFormFieldNames.phone,
                        placeholder: '555-555-555',
                        defaultSelectedCountryIsoCode: 'AE',
                        autovalidateMode: AutovalidateMode.onUnfocus,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: 'The phone number is required',
                          ),
                          FormBuilderValidators.phoneNumber(
                            errorText: 'phone number not valid',
                          ),
                        ]),
                      ),

                      SizedBox(height: UI.spacing.xl),

                      _buildSignUpLink(tr),

                      if (context.read<AppCubit>().state.userType ==
                          UserRole.user) ...[
                        SizedBox(height: UI.spacing.lg),
                      ],
                      // AuthTermsAndPrivacy(),

                      // SizedBox(height: 100), // 👈 space for button
                    ],
                  ),
                ),
              ),
            ),

            /// 🔹 Sticky Button
            _BottomAction(
              isLoading: isLoading,
              isFormValidNotifier: _isFormValidNotifier,
              onPressed: _sendOTP,
              label: tr.login.verifyButton,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(AuthenticationTranslation tr) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UIIconBackground(
            size: 90,
            iconSize: 45,
            backgroundColor: UIColor.softGreen,
            child: UISvg(Assets.icons.phone),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UIText.bodySmall('Don\'t have an account?'),
        SizedBox(width: 5),
        GestureDetector(
          onTap: () => AuthInternalRouter.of(context).toSignup(),
          child: UIText.buttonText(
            tr.login.signUp,
            color: UIColor.successBright,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildJoinAsGuestLink(AuthenticationTranslation tr) {
    return Center(
      child: GestureDetector(
        onTap: () => AuthInternalRouter.of(context).toUserHome(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            UISvg(Assets.icons.logOut),
            SizedBox(width: 5),
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

class _BottomAction extends StatelessWidget {
  const _BottomAction({
    required this.isLoading,
    required this.isFormValidNotifier,
    required this.onPressed,
    required this.label,
  });

  final bool isLoading;
  final ValueNotifier<bool> isFormValidNotifier;
  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: EdgeInsets.fromLTRB(
        24,
        12,
        24,
        bottomInset > 0 ? bottomInset : 24, // 👈 moves above keyboard
      ),
      decoration: BoxDecoration(
        color: UIColor.white,
        boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.05)),
        ],
      ),
      child: ValueListenableBuilder<bool>(
        valueListenable: isFormValidNotifier,
        builder: (_, isValid, __) {
          return UIButton.primary(
            isLoading: isLoading,
            label: label,
            expanded: true,
            onPressed: isValid ? onPressed : null,
          );
        },
      ),
    );
  }
}

class AuthTermsAndPrivacy extends StatelessWidget {
  final VoidCallback? onTermsTap;
  final VoidCallback? onPrivacyTap;

  const AuthTermsAndPrivacy({super.key, this.onTermsTap, this.onPrivacyTap});

  @override
  Widget build(BuildContext context) {
    final tr = AuthenticationTranslation();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: UI.text.caption.copyWith(color: UIColor.textSecondary),
          children: [
            TextSpan(
              text: '${tr.termsAndPrivacy.agreementText} ',
              style: UI.text.bodySmall.copyWith(color: UIColor.black),
            ),
            TextSpan(
              text: tr.termsAndPrivacy.termsOfUse,
              style: UI.text.bodySmall.copyWith(
                color: UIColor.babyBlue,
                fontWeight: FontWeight.w700,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTermsTap,
            ),
            TextSpan(
              text: ' ${tr.termsAndPrivacy.and} ',
              style: UI.text.bodySmall.copyWith(color: UIColor.black),
            ),
            TextSpan(
              text: tr.termsAndPrivacy.privacyPolicy,
              style: UI.text.bodySmall.copyWith(
                color: UIColor.babyBlue,
                fontWeight: FontWeight.w700,
              ),
              recognizer: TapGestureRecognizer()..onTap = onPrivacyTap,
            ),
            TextSpan(text: '.'),
          ],
        ),
      ),
    );
  }
}
