import 'package:authentication/authentication.dart';
import 'package:authentication/src/presentation/widgets/complete_profile/complete_profile_logout_button.dart';
import 'package:design_system/design_system.dart' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:util/util.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  Gender? _selectedGender = Gender.male;

  Future<void> _selectDate(BuildContext context) async {
    await DatePickerHelper.selectDateForFormField(
      context,
      _formKey,
      AuthFormFieldNames.dateOfBirth,
    );
  }

  void _submitProfileUpdate(
    BuildContext context,
    Map<String, dynamic> profileData,
  ) {
    context.read<AuthUserBloc>().add(UpdateProfile(profileData));
  }

  void _continue(BuildContext context) {
    final formData = AuthFormHelpers.validateAndExtractFormData(_formKey);
    if (formData != null) {
      final profileData = AuthFormHelpers.extractProfileData(
        formData,
        gender: _selectedGender?.value,
      );
      _submitProfileUpdate(context, profileData);
    }
  }

  void _logout(BuildContext context) {
    context.read<AuthUserBloc>().add(Logout());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthUserBloc, AuthUserState>(
      listenWhen:
          (_, current) =>
              current is AuthUserStateError &&
              current.stateType == AuthUserErrorStateType.saveProfile,
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

          return Stack(
            children: [
              Scaffold(
                backgroundColor: ui.UIColor.background,
                body: SafeArea(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(ui.UI.spacing.md),
                    child: FormBuilder(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: ui.UI.spacing.md),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ui.UIText.h2('Complete Your Profile'),
                              CompleteProfileLogoutButton(
                                onLogout: () => _logout(context),
                              ),
                            ],
                          ),
                          SizedBox(height: ui.UI.spacing.xs),
                          ui.UIText.bodyMedium(
                            'Please fill in your personal information',
                          ),
                          SizedBox(height: ui.UI.spacing.lg),
                          ui.AppFormBuilderTextField(
                            name: AuthFormFieldNames.username,
                            label: 'Username',
                            placeholder: 'Enter your username',
                            validator: FormBuilderValidators.required(
                              errorText: 'Username is required',
                            ),
                          ),
                          SizedBox(height: ui.UI.spacing.md),
                          ui.AppFormBuilderTextField(
                            name: AuthFormFieldNames.firstName,
                            label: 'First Name',
                            placeholder: 'Enter your first name',
                            validator: FormBuilderValidators.required(
                              errorText: 'First name is required',
                            ),
                          ),
                          SizedBox(height: ui.UI.spacing.md),
                          ui.AppFormBuilderTextField(
                            name: AuthFormFieldNames.lastName,
                            label: 'Last Name',
                            placeholder: 'Enter your last name',
                            validator: FormBuilderValidators.required(
                              errorText: 'Last name is required',
                            ),
                          ),
                          SizedBox(height: ui.UI.spacing.md),
                          GestureDetector(
                            onTap: () => _selectDate(context),
                            child: AbsorbPointer(
                              child: ui.AppFormBuilderTextField(
                                placeholder: 'Select your date of birth',
                                name: AuthFormFieldNames.dateOfBirth,
                                label: 'Date of Birth',
                                suffixIcon: Image.asset(
                                  'assets/calendar.svg',
                                  package: 'authentication',
                                  fit: BoxFit.scaleDown,
                                ),
                                validator: FormBuilderValidators.required(
                                  errorText: 'Date of birth is required',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: ui.UI.spacing.md),
                          ui.UIText.fieldLabel('Gender'),
                          SizedBox(height: ui.UI.spacing.xs),
                          ui.OptionSelector<Gender>(
                            selectedValue: _selectedGender!,
                            onChanged: (gender) {
                              setState(() {
                                _selectedGender = gender;
                              });
                            },
                            options: [
                              ui.SelectorOption(
                                value: Gender.male,
                                label: 'Male',
                                icon: IconsaxPlusLinear.man,
                              ),
                              ui.SelectorOption(
                                value: Gender.female,
                                label: 'Female',
                                icon: IconsaxPlusLinear.woman,
                              ),
                            ],
                          ),
                          SizedBox(height: ui.UI.spacing.xxl),
                          ui.UIButton.primary(
                            expanded: true,
                            label: 'Continue',
                            onPressed: () => _continue(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (isLoading) const ui.MDProgressIndicator(styled: true),
            ],
          );
        },
      ),
    );
  }
}
