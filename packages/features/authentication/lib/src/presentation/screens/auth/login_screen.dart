import 'package:authentication/authentication.dart';
import 'package:authentication/src/localization/files/authenticationTranslation.i69n.dart';
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const DefaultUIAppBarActions().backButton(
                        //   context,
                        //   onPressed: () => context.pop(),
                        // ),
                        // SizedBox(height: UI.spacing.md),
                        _buildHeader(tr),
                        SizedBox(height: UI.spacing.xl),
                        FormBuilder(
                          key: _formKey,
                          onChanged: _onFormChanged,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UIText.bodyMedium(
                                tr.login.phoneLabel,
                                color: UIColor.textPrimary,
                              ),
                              SizedBox(height: UI.spacing.xs),
                              UIFormBuilderPhoneField(
                                name: AuthFormFieldNames.phone,
                                placeholder: '50 512 3412',
                                defaultSelectedCountryIsoCode: 'PK',
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
                        SizedBox(height: UI.spacing.xl),
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
                        SizedBox(height: UI.spacing.xl),
                        _buildSignUpLink(tr),
                        SizedBox(height: UI.spacing.lg),
                        _buildJoinAsGuestLink(tr),
                      ],
                    ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: UIColor.softGreen,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Icon(Icons.smartphone, color: UIColor.textPrimary, size: 28),
        ),
        SizedBox(height: UI.spacing.lg),
        UIText.h1(tr.login.title, textAlign: TextAlign.center),
      ],
    );
  }

  Widget _buildSignUpLink(AuthenticationTranslation tr) {
    return Center(
      child: GestureDetector(
        onTap: () {
          // TODO: Navigate to sign-up flow if different from login
          // For now same screen; can push auth entry or sign-up screen
        },
        child: UIText.bodyMedium(tr.login.signUp, color: UIColor.primary),
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
            Text(
              tr.login.joinAsGuest,
              style: TextStyle(
                color: UIColor.textSecondary,
                decoration: TextDecoration.underline,
                fontSize: 14,
              ),
            ),
            SizedBox(width: UI.spacing.xs),
            Icon(Icons.arrow_forward, size: 16, color: UIColor.textSecondary),
          ],
        ),
      ),
    );
  }
}
