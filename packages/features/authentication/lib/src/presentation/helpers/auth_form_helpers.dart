import 'package:authentication/src/config/auth_ui_constants.dart';
import 'package:authentication/src/presentation/helpers/auth_form_field_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AuthFormHelpers {
  // ============ Validators ============

  /// Validates email format using centralized regex
  /// Returns error message if invalid, null if valid
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AuthUIConstants.fieldRequiredError;
    }

    if (!AuthUIConstants.emailRegex.hasMatch(value)) {
      return AuthUIConstants.invalidEmailError;
    }

    return null;
  }

  // ============ Helper Methods ============

  static String extractUserInput({
    required Map<String, dynamic> formData,
    required bool isEmail,
    String emailFieldName = AuthFormFieldNames.email,
    String phoneFieldName = AuthFormFieldNames.phone,
  }) {
    if (isEmail) {
      return (formData[emailFieldName] as String?)?.trim() ?? '';
    } else {
      final phoneNumber = formData[phoneFieldName] as PhoneNumber?;
      return phoneNumber?.phoneNumber ?? '';
    }
  }

  /// Checks if input is a valid email format
  static bool isEmail(String input) {
    final trimmedInput = input.trim();
    return AuthUIConstants.emailRegex.hasMatch(trimmedInput);
  }

  /// Validates form and returns form data if valid, null otherwise
  static Map<String, dynamic>? validateAndExtractFormData(
    GlobalKey<FormBuilderState> formKey,
  ) {
    final formState = formKey.currentState;
    if (formState == null) return null;

    final isValid = formState.saveAndValidate();
    if (!isValid) return null;

    return formState.value;
  }

  static Map<String, dynamic> extractProfileData(
    Map<String, dynamic> formData, {
    String? gender,
  }) {
    final firstName = formData[AuthFormFieldNames.firstName] as String? ?? '';
    final lastName = formData[AuthFormFieldNames.lastName] as String? ?? '';
    final username = formData[AuthFormFieldNames.username] as String? ?? '';
    final dateOfBirth =
        formData[AuthFormFieldNames.dateOfBirth] as String? ?? '';

    return {
      AuthFormFieldNames.firstName: firstName,
      AuthFormFieldNames.lastName: lastName,
      AuthFormFieldNames.dateOfBirthBackend: dateOfBirth,
      AuthFormFieldNames.username: username,
      if (gender != null) AuthFormFieldNames.gender: gender,
      'status': 'active',
    };
  }
}
