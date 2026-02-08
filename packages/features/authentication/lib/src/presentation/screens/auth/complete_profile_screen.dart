import 'package:authentication/authentication.dart';
import 'package:authentication/src/presentation/widgets/complete_profile/complete_profile_logout_button.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
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
    final tr = context.loc<AuthenticationTranslation>();
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
                backgroundColor: UIColor.background,
                body: SafeArea(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(UI.spacing.md),
                    child: FormBuilder(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: UI.spacing.md),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              UIText.h2(tr.personalInfo.title),
                              CompleteProfileLogoutButton(
                                onLogout: () => _logout(context),
                              ),
                            ],
                          ),
                          SizedBox(height: UI.spacing.xs),
                          UIText.bodyMedium(tr.personalInfo.subtitle),
                          SizedBox(height: UI.spacing.lg),
                          AppFormBuilderTextField(
                            name: AuthFormFieldNames.username,
                            label: tr.personalInfo.username,
                            placeholder: tr.personalInfo.usernamePlaceholder,
                            validator: FormBuilderValidators.required(
                              errorText: tr.personalInfo.usernameRequired,
                            ),
                          ),
                          SizedBox(height: UI.spacing.md),
                          AppFormBuilderTextField(
                            name: AuthFormFieldNames.firstName,
                            label: tr.personalInfo.firstName,
                            placeholder: tr.personalInfo.firstNamePlaceholder,
                            validator: FormBuilderValidators.required(
                              errorText: tr.personalInfo.firstNameRequired,
                            ),
                          ),
                          SizedBox(height: UI.spacing.md),
                          AppFormBuilderTextField(
                            name: AuthFormFieldNames.lastName,
                            label: tr.personalInfo.lastName,
                            placeholder: tr.personalInfo.lastNamePlaceholder,
                            validator: FormBuilderValidators.required(
                              errorText: tr.personalInfo.lastNameRequired,
                            ),
                          ),
                          SizedBox(height: UI.spacing.md),
                          GestureDetector(
                            onTap: () => _selectDate(context),
                            child: AbsorbPointer(
                              child: AppFormBuilderTextField(
                                placeholder:
                                    tr.personalInfo.dateOfBirthPlaceholder,
                                name: AuthFormFieldNames.dateOfBirth,
                                label: tr.personalInfo.dateOfBirth,
                                suffixIcon: SvgPicture.asset(
                                  Assets.icons.calendar,
                                  package: 'authentication',
                                  fit: BoxFit.scaleDown,
                                ),
                                validator: FormBuilderValidators.required(
                                  errorText:
                                      tr.personalInfo.dateOfBirthRequired,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: UI.spacing.md),
                          UIText.fieldLabel(tr.personalInfo.gender),
                          SizedBox(height: UI.spacing.xs),
                          OptionSelector<Gender>(
                            selectedValue: _selectedGender!,
                            onChanged: (gender) {
                              setState(() {
                                _selectedGender = gender;
                              });
                            },
                            options: [
                              SelectorOption(
                                value: Gender.male,
                                label: tr.personalInfo.male,
                                icon: IconsaxPlusLinear.man,
                              ),
                              SelectorOption(
                                value: Gender.female,
                                label: tr.personalInfo.female,
                                icon: IconsaxPlusLinear.woman,
                              ),
                            ],
                          ),
                          SizedBox(height: UI.spacing.xxl),
                          UIButton.primary(
                            expanded: true,
                            label: tr.common.continueLabel,
                            onPressed: () => _continue(context),
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
