import 'package:authentication/authentication.dart';
import 'package:authentication/src/localization/files/authenticationTranslation.i69n.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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
  late final TextEditingController _otpController;
  bool _isOtpValid = false;
  bool _isSuccessDialogVisible = false;

  @override
  void initState() {
    super.initState();
    _otpController = TextEditingController();
    _otpController.addListener(_onOtpChanged);

    _resendTimer = ResendTimerController(
      durationSeconds: AuthenticationConfig.verificationTimerSeconds,
    );
    _resendTimer.addListener(() => setState(() {}));
    _resendTimer.start();
  }

  @override
  void dispose() {
    _otpController
      ..removeListener(_onOtpChanged)
      ..dispose();
    _resendTimer.dispose();
    super.dispose();
  }

  void _onOtpChanged() {
    final isValid =
        _otpController.text.trim().length == AuthenticationConfig.otpLength;
    if (_isOtpValid != isValid) {
      setState(() {
        _isOtpValid = isValid;
      });
    }
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

  void _handleVerify() {
    final otp = _otpController.text.trim();
    if (otp.length != AuthenticationConfig.otpLength) {
      return;
    }

    final verifyRequest = UnifiedVerifyOTPRequestModel(
      id: widget.verificationId,
      otp: otp,
    );

    context.read<AuthUserBloc>().add(VerifyOTP(verifyRequest));
  }

  void _handleGoToHome() {
    context.read<AuthUserBloc>().add(CompleteOtpAuthentication());
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.loc<AuthenticationTranslation>();
    return BlocListener<AuthUserBloc, AuthUserState>(
      listenWhen:
          (_, current) =>
              (current is AuthUserStateError &&
                  current.stateType == AuthUserErrorStateType.verifyOTP) ||
              (current is AuthUserStateAuthenticated &&
                  current.context == AuthenticationContext.otpVerification),
      listener: (context, state) {
        if (state is AuthUserStateError) {
          ToastificationUtil.error(state.error.message);
          return;
        }
        if (state is AuthUserStateAuthenticated &&
            state.context == AuthenticationContext.otpVerification) {
          if (_isSuccessDialogVisible || !mounted) return;
          _isSuccessDialogVisible = true;
          DialogsManager.showSuccessDialog(
            context: context,
            title: tr.verification.newUserVerified,
            buttonLabel: tr.common.goToHome,
            onPressed: () {
              Navigator.of(context).pop();
              _handleGoToHome();
            },
          ).whenComplete(() {
            _isSuccessDialogVisible = false;
          });
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
          final otpErrorMessage =
              hasError ? (state as AuthUserStateError).error.message : null;

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
                              // SizedBox(height: UI.spacing.xxxl),
                              Center(
                                child: Container(
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
                                      Assets.icons.message,
                                      package: 'design_system',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: UI.spacing.lg),
                              Center(
                                child: UIText.bodyMedium(
                                  tr.verification.title,
                                  textAlign: TextAlign.center,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: UI.spacing.sm),
                              Center(child: _buildVerificationDescription(tr)),
                              SizedBox(height: 70),
                              PinInput(
                                controller: _otpController,
                                length: AuthenticationConfig.otpLength,
                                hasError: hasError,
                                errorText: otpErrorMessage,
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
                          77,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            UIButton.primary(
                              label: tr.login.verifyButton,
                              expanded: true,
                              onPressed:
                                  (_isOtpValid && !isLoading)
                                      ? _handleVerify
                                      : null,
                            ),
                            SizedBox(height: UI.spacing.lg),
                            if (_resendTimer.canResend)
                              GestureDetector(
                                onTap: _handleResendCode,
                                child: UIText.buttonText(
                                  tr.verification.resendCode,
                                  color: UIColor.successBright,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            else
                              UIText.bodyMedium(
                                '${tr.verification.resendCode} in ${_resendTimer.remainingSeconds} sec',
                                color: UIColor.textPlaceholder,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w500,
                              ),
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
        },
      ),
    );
  }

  Widget _buildVerificationDescription(AuthenticationTranslation tr) {
    const token = '{userInput}';
    final template = tr.verification.description;
    final parts = template.split(token);

    if (parts.length < 2) {
      return UIText.bodySmall(
        template.replaceAll(token, widget.userInput),
        color: UIColor.textSecondary,
        textAlign: TextAlign.center,
      );
    }

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: UI.text.bodySmall.copyWith(color: UIColor.textSecondary),
        children: [
          TextSpan(text: parts.first),
          TextSpan(
            text: widget.userInput,
            style: UI.text.bodySmall.copyWith(
              color: UIColor.grey,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(text: parts.sublist(1).join(token)),
        ],
      ),
    );
  }
}
