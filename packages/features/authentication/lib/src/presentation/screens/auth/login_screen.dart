import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
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
                    padding: UI.padding.authScrollable,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: UI.spacing.xxl),
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
                  padding: UI.padding.authActions,
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
          UIIconBackground(
            size: 90,
            iconSize: 45,
            backgroundColor: UIColor.softGreen,
            child: UISvg(Assets.icons.phone),
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
        onTap: () => AuthInternalRouter.of(context).toUserHome(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            UISvg(Assets.icons.logOut),
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
