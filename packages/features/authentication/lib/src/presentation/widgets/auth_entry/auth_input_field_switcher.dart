import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AuthInputFieldSwitcher extends StatelessWidget {
  final bool isEmailMode;
  final String? emailHint;
  final String? phoneHint;
  final AutovalidateMode? autovalidateMode;

  const AuthInputFieldSwitcher({
    super.key,
    required this.isEmailMode,
    this.emailHint,
    this.phoneHint,
    this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    if (isEmailMode) {
      return AppFormBuilderTextField(
        name: AuthFormFieldNames.email,
        placeholder: emailHint ?? 'example@gmail.com',
        keyboardType: TextInputType.emailAddress,
        autovalidateMode: autovalidateMode,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.email(),
        ]),
      );
    }
    return UIFormBuilderPhoneField(
      name: AuthFormFieldNames.phone,
      placeholder: phoneHint ?? '50 512 3412',
      defaultSelectedCountryIsoCode: 'AE',
      autovalidateMode: autovalidateMode,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.phoneNumber(),
      ]),
    );
  }
}
