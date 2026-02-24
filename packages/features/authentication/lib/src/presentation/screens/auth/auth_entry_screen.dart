import 'package:authentication/authentication.dart';
import 'package:authentication/src/localization/files/authenticationTranslation.i69n.dart';
import 'package:authentication/src/presentation/widgets/auth_entry/auth_entry_header.dart';
import 'package:authentication/src/presentation/widgets/auth_entry/auth_entry_submit_button.dart';
import 'package:authentication/src/presentation/widgets/auth_entry/auth_method_selector.dart';
import 'package:authentication/src/presentation/widgets/common/auth_terms_and_privacy.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:util/util.dart';

class AuthEntryScreen extends StatefulWidget {
  final UserRole userRole;

  const AuthEntryScreen({super.key, required this.userRole});

  @override
  State<AuthEntryScreen> createState() => _AuthEntryScreenState();
}

class _AuthEntryScreenState extends State<AuthEntryScreen> {
  late AuthMethod _currentMethod;
  final _formKey = GlobalKey<FormBuilderState>();
  final ValueNotifier<String> _pinNotifier = ValueNotifier('');
  final ValueNotifier<bool> _isFormValidNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _currentMethod = AuthenticationConfig.defaultMethodFor(widget.userRole);
  }

  @override
  void dispose() {
    _pinNotifier.dispose();
    _isFormValidNotifier.dispose();
    super.dispose();
  }

  List<AuthMethod> get _allowedMethods =>
      AuthenticationConfig.allowedMethodsFor(widget.userRole);

  List<AuthMethod> get _socialMethods =>
      AuthenticationConfig.socialMethodsFor(widget.userRole);

  bool get _isEmailMode => _currentMethod == AuthMethod.email;
  bool get _isPinMode => _currentMethod == AuthMethod.pin;

  void _switchMethod(AuthMethod method) {
    setState(() {
      _currentMethod = method;
    });
  }

  void _sendOTP() {
    // Unfocus to dismiss keyboard before validation
    FocusScope.of(context).unfocus();

    final formState = _formKey.currentState;
    if (formState == null || !formState.saveAndValidate()) return;

    final formData = formState.value;
    final userInput =
        _isEmailMode
            ? (formData[AuthFormFieldNames.email] as String?)?.trim() ?? ''
            : (formData[AuthFormFieldNames.phone] as String?)?.trim() ?? '';

    if (userInput.isEmpty) return;

    final sendOTPRequest = SendOTPRequestModel(
      phone: _isEmailMode ? null : userInput,
      email: _isEmailMode ? userInput : null,
      deviceId: AuthenticationConfig.deviceId,
    );

    context.read<AuthUserBloc>().add(SendOTP(sendOTPRequest));
  }

  void _loginWithPin() {
    final pin = _pinNotifier.value;
    if (pin.length != AuthenticationConfig.pinLength) return;

    final loginRequest = LoginWithPinRequestModel(
      pin: pin,
      deviceId: AuthenticationConfig.deviceId,
    );

    context.read<AuthUserBloc>().add(LoginWithPin(loginRequest));
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.loc<AuthenticationTranslation>();
    return BlocListener<AuthUserBloc, AuthUserState>(
      listenWhen:
          (_, current) =>
              current is AuthUserStateError &&
              (current.stateType == AuthUserErrorStateType.sendOTP ||
                  current.stateType == AuthUserErrorStateType.loginWithPin),
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
                    padding: UI.padding.allMd,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const DefaultUIAppBarActions().backButton(
                          context,
                          onPressed: () => context.pop(),
                        ),
                        SizedBox(height: UI.spacing.md),
                        AuthEntryHeader(
                          currentMethod: _currentMethod,
                          isChildMode: widget.userRole.isChild,
                        ),
                        _isPinMode
                            ? PinInput(
                              enableAutoPaste: widget.userRole.isChild,
                              key: const ValueKey('pin_input'),
                              label: tr.authEntry.pinLabel,
                              length: AuthenticationConfig.pinLength,
                              onCompleted: (pin) {
                                _pinNotifier.value = pin;
                              },
                              onChanged: (value) {
                                _pinNotifier.value = value;
                              },
                            )
                            : FormBuilder(
                              key: _formKey,
                              onChanged: _onFormChanged,
                              child: AuthInputFieldSwitcher(
                                isEmailMode: _isEmailMode,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ),
                        SizedBox(height: UI.spacing.xl),
                        AuthEntrySubmitButton(
                          isPinMode: _isPinMode,
                          pinNotifier: _pinNotifier,
                          isFormValidNotifier: _isFormValidNotifier,
                          onPinSubmit: _loginWithPin,
                          onOTPSubmit: _sendOTP,
                        ),
                        AuthMethodSelector(
                          availableMethods: _allowedMethods,
                          socialMethods: _socialMethods,
                          currentMethod: _currentMethod,
                          isChildMode: widget.userRole.isChild,
                          onMethodSelected: _switchMethod,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: UI.padding.bottomMd,
                  child: Center(child: AuthTermsAndPrivacy()),
                ),
              ],
            ),
          ),
        ),
        if (isLoading) const MDProgressIndicator(styled: true),
      ],
    );
  }

  void _onFormChanged() {
    final isValid = _formKey.currentState?.isValid ?? false;
    if (_isFormValidNotifier.value != isValid) {
      _isFormValidNotifier.value = isValid;
    }
  }
}
