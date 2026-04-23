import 'dart:developer';

import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:util/util.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, this.isEditMood = false});
  final bool isEditMood;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  static const _fullNameField = 'full_name';
  static const _countryField = 'country';
  Map<String, dynamic> initialValue = const <String, dynamic>{};

  final _formKey = GlobalKey<FormBuilderState>();
  @override
  void initState() {
    initEditMood();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.loc<AuthenticationTranslation>();
    final personalInfo = tr.personalInfo;

    return widget.isEditMood
        ? _buildEditBody(tr, personalInfo, context)
        : _buildScreenContent(tr, personalInfo, context);
  }

  Widget _buildEditBody(
    AuthenticationTranslation tr,
    PersonalInfoAuthenticationTranslation personalInfo,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildForm(tr, personalInfo, context),
            BlocConsumer<AuthUserBloc, AuthUserState>(
              listener: (context, state) {
                if (state is AuthUserStateAuthenticated) {
                  context.pop();
                  ToastificationUtil.success('Profile updated sucssessfully!');
                }
              },
              builder: (context, state) {
                return Container(
                  color: Colors.white,
                  child: UIButton.primary(
                    isLoading: state is AuthUserStateLoading,
                    label: 'Save changes',
                    expanded: true,
                    onPressed: _handleSaveChanges,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  UIScaffold _buildScreenContent(
    AuthenticationTranslation tr,
    PersonalInfoAuthenticationTranslation personalInfo,
    BuildContext context,
  ) {
    return UIScaffold(
      resizeToAvoidBottomInset: true,

      appBar: UIAppBar(title: ''),
      backgroundColor: UIColor.background,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: _buildBody(tr, personalInfo, context),
      ),
    );
  }

  Widget _buildBody(
    AuthenticationTranslation tr,
    PersonalInfoAuthenticationTranslation personalInfo,
    BuildContext context,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.only(bottom: 24),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: _buildForm(tr, personalInfo, context),
            ),
          ),
        );
      },
    );
  }

  Widget _buildForm(
    AuthenticationTranslation tr,
    PersonalInfoAuthenticationTranslation personalInfo,
    BuildContext context, {
    double? height,
  }) {
    return SizedBox(
      height: height,
      child: FormBuilder(
        initialValue: initialValue,
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!widget.isEditMood) ...[
              UIText.h2(tr.login.signUp),
              SizedBox(height: UI.spacing.xs),
              UIText.bodySmall(
                personalInfo.subtitle,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: UI.spacing.lg),
            ],

            SizedBox(height: UI.spacing.xs),

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
            Text(
              'Phone',
              style: UI.text.fieldLabel.copyWith(color: UIColor.primaryDark),
            ),
            SizedBox(height: UI.spacing.xs),

            UIFormBuilderPhoneField(
              name: AuthFormFieldNames.phone,

              placeholder: personalInfo.phonePlaceholder,
              // keyboardType: TextInputType.phone,
              // prefixIcon: _FieldPrefixIcon(iconPath: Assets.icons.call),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                  errorText: personalInfo.phoneRequired,
                ),
              ]),
            ),
            SizedBox(height: UI.spacing.md),

            AppFormBuilderTextField(
              name: AuthFormFieldNames.email,
              label: tr.authIdentity.emailTitle,
              placeholder: personalInfo.emailPlaceholder,
              prefixIcon: _FieldPrefixIcon(iconPath: Assets.icons.email),
              // validator: FormBuilderValidators.compose([
              //   FormBuilderValidators.required(
              //     errorText: personalInfo.emailRequired,
              //   ),
              //   FormBuilderValidators.email(
              //     errorText: personalInfo.emailInvalid,
              //   ),
              // ]),
            ),
            SizedBox(height: 32),

            if (!widget.isEditMood) ...[
              Spacer(),
              BlocBuilder<AuthUserBloc, AuthUserState>(
                builder: (context, state) {
                  return UIButton.primary(
                    isLoading: state is AuthUserStateLoading,
                    label: tr.login.signUp,
                    expanded: true,
                    onPressed: _onSignupPressed,
                  );
                },
              ),
              SizedBox(height: UI.spacing.lg),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UIText.bodySmall('Already have an account?'),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: UIText.buttonText(
                      tr.authEntry.loginButton,
                      color: UIColor.successBright,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              SizedBox(height: UI.spacing.xl),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildBottomAction(
    AuthenticationTranslation tr,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [],
      ),
    );
  }

  void _handleSaveChanges() {
    FocusManager.instance.primaryFocus?.unfocus();

    final formState = _formKey.currentState;

    if (formState == null) return;
    log('hdhhdahdh');

    final isValid = formState.save(); // 🔥 FIX

    // if (!isValid) return;

    final values = formState.value;
    print(values[AuthFormFieldNames.phone]);

    final currentUser = context.read<AppCubit>().state.user!;
    context.read<AuthUserBloc>().add(
      UpdateProfile(
        currentUser.copyWith(
          name: values[_fullNameField],
          phone: values[AuthFormFieldNames.phone],
          email: values[AuthFormFieldNames.email],
        ),
      ),
    );
  }

  void initEditMood() {
    if (!widget.isEditMood) return;
    final currentUserInfo = context.read<AppCubit>().state.user;
    initialValue = {
      _fullNameField: currentUserInfo?.name,
      _countryField: currentUserInfo?.address,
      AuthFormFieldNames.phone: currentUserInfo?.phone,
      AuthFormFieldNames.email: currentUserInfo?.email,
    };
  }

  void _onSignupPressed() {
    FocusManager.instance.primaryFocus?.unfocus();
    final isValid = _formKey.currentState?.saveAndValidate() ?? false;
    // if (!isValid) return;

    context.read<AuthUserBloc>().add(
      SendOTP(
        SendOTPRequestModel(
          deviceId: '',
          phone: _formKey.currentState?.value[AuthFormFieldNames.phone],
          // email:  _formKey.currentState?.value[AuthFormFieldNames.phone],
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
        UISvg(iconPath),
        SizedBox(width: UI.spacing.md),
        Container(width: 1, height: 34, color: UIColor.softgrey),
        SizedBox(width: UI.spacing.xs),
      ],
    );
  }
}
