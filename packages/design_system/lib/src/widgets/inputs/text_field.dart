import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../tokens/colors.dart';
import '../../ui.dart';
import 'input_utils.dart';

/// A customizable text field component
///
/// Follows the design system specifications for input fields
///
/// Example:
/// ```dart
/// AppTextField(
///   label: 'Email',
///   placeholder: 'Enter your email',
///   onChanged: (value) => print(value),
/// )
/// ```
class AppTextField extends StatefulWidget {
  /// Label displayed above the field
  final String? label;

  /// Placeholder text shown when field is empty
  final String? placeholder;

  /// Helper text displayed below the field
  final String? helperText;

  /// Current value of the text field
  final String? value;

  /// Callback when text changes
  final ValueChanged<String>? onChanged;

  /// Callback when editing is complete
  final VoidCallback? onEditingComplete;

  /// Callback when field is submitted
  // final ValueChanged<String>? onSubmitted;

  /// Callback when field is tapped
  final VoidCallback? onTap;

  /// Controller for the text field
  final TextEditingController? controller;

  /// Error message to display
  final String? error;

  /// Whether the field is enabled
  final bool enabled;

  /// Whether to obscure the text (for passwords)
  final bool obscureText;

  /// Whether the field is read-only
  final bool readOnly;

  /// Keyboard type
  final TextInputType? keyboardType;

  /// Maximum number of lines
  final int maxLines;

  /// Minimum number of lines
  final int? minLines;

  /// Maximum length of text
  final int? maxLength;

  /// Input formatters
  final List<TextInputFormatter>? inputFormatters;

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

  /// Focus node
  final FocusNode? focusNode;

  /// Show clear button when field has text and error
  final bool showClearButton;

  /// Show success icon when field is valid
  final bool showSuccessIcon;

  /// Custom success icon (defaults to green checkmark)
  final Widget? successIcon;

  /// Hint text
  final String? hintText;

  final EdgeInsets? contentPadding;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final FormFieldValidator<String>? validator;
  const AppTextField({
    super.key,
    this.label,
    this.placeholder,
    this.helperText,
    this.value,
    this.onChanged,
    this.onEditingComplete,
    //  this.onSubmitted,
    this.onTap,
    this.controller,
    this.error,
    this.enabled = true,
    this.obscureText = false,
    this.readOnly = false,
    this.keyboardType,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.focusNode,
    this.showClearButton = true,
    this.showSuccessIcon = false,
    this.successIcon,
    this.hintText,
    this.contentPadding,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.validator,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode _focusNode;
  late TextEditingController _controller;
  bool _isFocused = false;
  bool _hasText = false;
  bool _isInternalController = false;

  @override
  void initState() {
    super.initState();

    // Setup focus node
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);

    // Setup controller
    if (widget.controller != null) {
      _controller = widget.controller!;
      _isInternalController = false;
    } else {
      _controller = TextEditingController(text: widget.value);
      _isInternalController = true;
    }

    _hasText = _controller.text.isNotEmpty;
    _controller.addListener(_onTextChange);
  }

  @override
  void didUpdateWidget(AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update controller if value changed from outside
    if (widget.controller == null &&
        widget.value != oldWidget.value &&
        widget.value != _controller.text) {
      _controller.text = widget.value ?? '';
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _controller.removeListener(_onTextChange);

    if (widget.focusNode == null) {
      _focusNode.dispose();
    }

    if (_isInternalController) {
      _controller.dispose();
    }

    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _onTextChange() {
    setState(() {
      _hasText = _controller.text.isNotEmpty;
    });
  }

  void _clearText() {
    _controller.clear();
    widget.onChanged?.call('');
  }

  Color _getBorderColor() {
    return InputUtils.getBorderColor(
      enabled: widget.enabled,
      hasError: widget.error != null,
      isFocused: _isFocused,
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasError = widget.error != null;
    final showClear = widget.showClearButton && hasError && _hasText;
    final showSuccess = widget.showSuccessIcon && !hasError && _hasText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          InputUtils.buildLabel(widget.label!),
          SizedBox(height: UI.spacing.xxs),
        ],
        InputUtils.buildShadowContainer(
          isFocused: _isFocused,
          hasError: hasError,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validator,
            controller: _controller,
            focusNode: _focusNode,
            onChanged: widget.onChanged,
            onEditingComplete: widget.onEditingComplete,
            // onSubmitted: widget.onSubmitted,
            onTap: widget.onTap,
            enabled: widget.enabled,
            readOnly: widget.readOnly,
            obscureText: widget.obscureText,
            keyboardType: widget.keyboardType,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            maxLength: widget.maxLength,
            inputFormatters: widget.inputFormatters,
            autofocus: widget.autofocus,
            textCapitalization: widget.textCapitalization,
            style: UI.text.inputText.copyWith(color: UIColor.textPrimary),
            decoration: InputDecoration(
              hintText: widget.placeholder,
              hintStyle: UI.text.inputPlaceholder.copyWith(
                color: UIColor.textPlaceholder,
              ),
              filled: true,
              fillColor: UIColor.surface,
              contentPadding:
                  widget.contentPadding ??
                  EdgeInsets.symmetric(
                    horizontal:
                        widget.prefixIcon != null
                            ? 8
                            : UI.spacing.inputHorizontal,
                    vertical: UI.spacing.inputVertical,
                  ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(UI.radius.input),
                borderSide: BorderSide(color: _getBorderColor()),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(UI.radius.input),
                borderSide: BorderSide(color: _getBorderColor()),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(UI.radius.input),
                borderSide: BorderSide(color: _getBorderColor(), width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(UI.radius.input),
                borderSide: BorderSide(color: UIColor.borderError),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(UI.radius.input),
                borderSide: BorderSide(color: UIColor.borderError, width: 2),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(UI.radius.input),
                borderSide: BorderSide(color: UIColor.border),
              ),
              prefixIcon: widget.prefixIcon,
              prefixIconConstraints: widget.prefixIconConstraints,
              suffixIconConstraints: widget.suffixIconConstraints,
              suffixIcon:
                  widget.suffixIcon != null
                      ? (widget.onSuffixTap != null
                          ? IconButton(
                            icon: widget.suffixIcon!,
                            onPressed: widget.onSuffixTap,
                          )
                          : widget.suffixIcon)
                      : showSuccess
                      ? Padding(
                        padding: const EdgeInsets.all(12),
                        child:
                            widget.successIcon ?? InputUtils.buildSuccessIcon(),
                      )
                      : showClear
                      ? IconButton(
                        icon: InputUtils.buildClearIcon(),
                        onPressed: _clearText,
                        padding: const EdgeInsets.all(12),
                      )
                      : null,
              counterText: '',
            ),
          ),
        ),
        if (hasError && widget.error != null) ...[
          SizedBox(height: UI.spacing.xxs),
          InputUtils.buildErrorText(widget.error!),
        ],
        if (!hasError && widget.helperText != null) ...[
          SizedBox(height: UI.spacing.xxs),
          InputUtils.buildHelperText(widget.helperText!),
        ],
      ],
    );
  }
}
