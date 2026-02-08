import 'package:authentication/authentication.dart';
import 'package:authentication/src/localization/files/authenticationTranslation.i69n.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:util/util.dart';

/// Screen for verifying OTP codes sent via email or phone
///
/// Handles the OTP verification flow for authentication, including:
/// - Displaying OTP input field
/// - Resend code functionality with timer
/// - Error handling and validation
class OTPVerificationScreen extends StatefulWidget {
  /// The user's email or phone number where OTP was sent
  final String userInput;

  /// Verification ID returned from OTP request
  final String verificationId;

  const OTPVerificationScreen({
    super.key,
    required this.userInput,
    required this.verificationId,
  });

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  late final ResendTimerController _resendTimer;

  @override
  void initState() {
    super.initState();
    _resendTimer = ResendTimerController(
      durationSeconds: AuthenticationConfig.verificationTimerSeconds,
    );
    _resendTimer.addListener(() => setState(() {}));
    _resendTimer.start();
  }

  @override
  void dispose() {
    _resendTimer.dispose();
    super.dispose();
  }

  /// Request a new OTP code
  void _handleResendCode() {
    final isEmail = AuthFormHelpers.isEmail(widget.userInput);
    final sendOTPRequest = SendOTPRequestModel(
      phone: isEmail ? null : widget.userInput,
      email: isEmail ? widget.userInput : null,
      deviceId: AuthenticationConfig.deviceId,
    );

    context.read<AuthUserBloc>().add(SendOTP(sendOTPRequest));
    _resendTimer.start();
  }

  /// Handle OTP input completion
  void _handleOTPCompleted(String otp) {
    final verifyRequest = UnifiedVerifyOTPRequestModel(
      id: widget.verificationId,
      otp: otp,
    );

    context.read<AuthUserBloc>().add(VerifyOTP(verifyRequest));
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.loc<AuthenticationTranslation>();
    return BlocListener<AuthUserBloc, AuthUserState>(
      listenWhen:
          (_, current) =>
              current is AuthUserStateError &&
              current.stateType == AuthUserErrorStateType.verifyOTP,
      listener: (context, state) {
        if (state is AuthUserStateError) {
          ToastificationUtil.error(state.error.message);
        }
      },
      child: BlocBuilder<AuthUserBloc, AuthUserState>(
        buildWhen:
            (previous, current) =>
                (previous is AuthUserStateLoading) !=
                    (current is AuthUserStateLoading) ||
                (previous is AuthUserStateError) !=
                    (current is AuthUserStateError),
        builder: (context, state) {
          final isLoading = state is AuthUserStateLoading;
          final hasError =
              state is AuthUserStateError &&
              state.stateType == AuthUserErrorStateType.verifyOTP;

          return Stack(
            children: [
              Scaffold(
                backgroundColor: UIColor.background,
                body: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(UI.spacing.md),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const DefaultUIAppBarActions().backButton(
                            context,
                            onPressed: () => context.pop(),
                          ),
                          SizedBox(height: UI.spacing.md),
                          // Header
                          UIText.h2(
                            tr.verification.title,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: UI.spacing.xs),
                          UIText.bodyMedium(
                            tr.verification.description.replaceAll(
                              '{userInput}',
                              widget.userInput,
                            ),
                            color: UIColor.textSecondary,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: UI.spacing.xs),
                          // Description with inline editable chip
                          // Wrap(
                          //   children: [
                          //     EditableInputChip(
                          //       value: widget.userInput,
                          //       onEdit:
                          //           () =>
                          //               AuthInternalRouter.of(context).goBack(),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(height: UI.spacing.lg),
                          // OTP Input
                          PinInput(
                            hasError: hasError,
                            onCompleted: _handleOTPCompleted,
                          ),
                          SizedBox(height: UI.spacing.xxl),

                          Center(
                            child: OTPResendSection(
                              resendTimer: _resendTimer,
                              onResend: _handleResendCode,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (isLoading) const MDProgressIndicator(styled: true),
            ],
          );
        },
      ),
    );
  }
}
