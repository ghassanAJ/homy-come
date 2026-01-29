import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'text_field.dart';

/// A FormBuilder text field component that integrates with flutter_form_builder
///
/// This widget wraps AppTextField to provide form validation and state management
///
/// Example:
/// ```dart
/// FormBuilder(
///   key: _formKey,
///   child: Column(
///     children: [
///       AppFormBuilderTextField(
///         name: 'email',
///         label: 'Email',
///         placeholder: 'Enter your email',
///         validator: FormBuilderValidators.email(),
///       ),
///     ],
///   ),
/// )
/// ```
class AppFormBuilderTextField extends FormBuilderField<String> {
  /// Label displayed above the field
  final String? label;

  /// Placeholder text shown when field is empty
  final String? placeholder;

  /// Helper text displayed below the field
  final String? helperText;

  /// Keyboard type
  final TextInputType? keyboardType;

  /// Input formatters
  final List<TextInputFormatter>? inputFormatters;

  /// Maximum number of lines
  final int maxLines;

  /// Minimum number of lines
  final int? minLines;

  /// Maximum length of text
  final int? maxLength;

  /// Whether to obscure the text (for passwords)
  final bool obscureText;

  /// Whether the field is read-only
  final bool readOnly;

  /// Prefix icon
  final Widget? prefixIcon;

  /// Suffix icon
  final Widget? suffixIcon;

  /// Callback when suffix icon is tapped
  final VoidCallback? onSuffixTap;

  /// Auto focus
  final bool autofocus;

  /// Text capitalization
  final TextCapitalization textCapitalization;

  /// Focus node for managing focus (uses internal focus node if not provided)
  final FocusNode? fieldFocusNode;

  /// Callback when field is tapped
  final VoidCallback? onTap;

  /// Callback when editing is complete
  final VoidCallback? onEditingComplete;

  /// Callback when field is submitted
  final ValueChanged<String>? onSubmitted;

  /// Show clear button when field has text and error
  final bool showClearButton;

  /// Show success icon when field is valid
  final bool showSuccessIcon;

  /// Custom success icon (defaults to green checkmark)
  final Widget? successIcon;

  final String? hintText;

  AppFormBuilderTextField({
    super.key,
    required super.name,
    this.label,
    this.placeholder,
    this.helperText,
    this.hintText,
    super.initialValue,
    super.enabled = true,
    this.keyboardType,
    this.inputFormatters,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.obscureText = false,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.fieldFocusNode,
    this.onTap,
    this.onEditingComplete,
    this.onSubmitted,
    this.showClearButton = true,
    this.showSuccessIcon = false,
    this.successIcon,
    super.validator,
    super.onChanged,
    super.onSaved,
    super.onReset,
    super.autovalidateMode,
    super.restorationId,
  }) : super(
         builder: (FormFieldState<String?> field) {
           return _AppFormBuilderTextFieldWidget(
             field: field,
             label: label,
             placeholder: placeholder,
             helperText: helperText,
             enabled: enabled,
             keyboardType: keyboardType,
             inputFormatters: inputFormatters,
             maxLines: maxLines,
             minLines: minLines,
             maxLength: maxLength,
             obscureText: obscureText,
             readOnly: readOnly,
             prefixIcon: prefixIcon,
             suffixIcon: suffixIcon,
             onSuffixTap: onSuffixTap,
             autofocus: autofocus,
             textCapitalization: textCapitalization,
             fieldFocusNode: fieldFocusNode,
             onTap: onTap,
             onEditingComplete: onEditingComplete,
             onSubmitted: onSubmitted,
             showClearButton: showClearButton,
             showSuccessIcon: showSuccessIcon,
             successIcon: successIcon,
             onChanged: onChanged,
           );
         },
       );
}

class _AppFormBuilderTextFieldWidget extends StatefulWidget {
  final FormFieldState<String?> field;
  final String? label;
  final String? placeholder;
  final String? helperText;
  final bool enabled;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final bool obscureText;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixTap;
  final bool autofocus;
  final TextCapitalization textCapitalization;
  final FocusNode? fieldFocusNode;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final bool showClearButton;
  final bool showSuccessIcon;
  final Widget? successIcon;
  final ValueChanged<String?>? onChanged;
  final String? hintText;
  const _AppFormBuilderTextFieldWidget({
    required this.field,
    this.label,
    this.placeholder,
    this.helperText,
    this.enabled = true,
    this.keyboardType,
    this.inputFormatters,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.obscureText = false,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.fieldFocusNode,
    this.onTap,
    this.onEditingComplete,
    this.onSubmitted,
    this.showClearButton = true,
    this.showSuccessIcon = false,
    this.successIcon,
    this.onChanged,
    this.hintText,
  });

  @override
  State<_AppFormBuilderTextFieldWidget> createState() =>
      _AppFormBuilderTextFieldWidgetState();
}

class _AppFormBuilderTextFieldWidgetState
    extends State<_AppFormBuilderTextFieldWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.field.value ?? '');
  }

  @override
  void didUpdateWidget(_AppFormBuilderTextFieldWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Only update controller if the field value changed from outside
    if (widget.field.value != _controller.text) {
      _controller.text = widget.field.value ?? '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      label: widget.label,
      placeholder: widget.placeholder,
      helperText: widget.helperText,
      controller: _controller,
      onChanged: (value) {
        widget.field.didChange(value);
        widget.onChanged?.call(value);
      },

      enabled: widget.enabled,
      error: widget.field.errorText,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      obscureText: widget.obscureText,
      readOnly: widget.readOnly,
      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.suffixIcon,
      onSuffixTap: widget.onSuffixTap,
      autofocus: widget.autofocus,
      textCapitalization: widget.textCapitalization,
      focusNode: widget.fieldFocusNode,
      onTap: widget.onTap,
      onEditingComplete: widget.onEditingComplete,
      // onSubmitted: widget.onSubmitted,
      showClearButton: widget.showClearButton,
      showSuccessIcon: widget.showSuccessIcon,
      successIcon: widget.successIcon,
    );
  }
}
