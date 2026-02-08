import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import '../../tokens/colors.dart';
import '../../ui.dart';

/// A PIN/Code input component for entering numeric codes
///
/// Displays individual boxes for each digit with proper focus management,
/// animations, and state handling.
///
/// Supports 4 visual states:
/// - Default: Empty box with neutral border
/// - Focus: Active box with primary blue border and cursor
/// - Filled: Box with entered digit
/// - Invalid: Error state with red text
///
/// Example:
/// ```dart
/// PinInput(
///   length: 6,
///   onCompleted: (pin) => print('PIN: $pin'),
///   hasError: false,
/// )
/// ```
class PinInput extends StatefulWidget {
  /// Label text displayed above the PIN input
  final String? label;

  /// Number of PIN digits (default: 6)
  final int length;

  /// Called when all digits are entered
  final ValueChanged<String>? onCompleted;

  /// Called when any digit changes
  final ValueChanged<String>? onChanged;

  /// Controller for the PIN input
  final TextEditingController? controller;

  /// Whether the input has an error state
  final bool hasError;

  /// Error message to display below the input
  final String? errorText;

  /// Helper text displayed below the input when no error
  final String? helperText;

  /// Focus node for managing focus
  final FocusNode? focusNode;

  /// Whether to enable haptic feedback
  final bool enableHapticFeedback;

  /// Whether to enable auto-paste from clipboard
  /// When enabled, checks clipboard on focus and auto-fills if valid code is found
  final bool enableAutoPaste;

  const PinInput({
    super.key,
    this.label,
    this.length = 6,
    this.onCompleted,
    this.onChanged,
    this.controller,
    this.hasError = false,
    this.errorText,
    this.helperText,
    this.focusNode,
    this.enableHapticFeedback = true,
    this.enableAutoPaste = true,
  });

  @override
  State<PinInput> createState() => _PinInputState();
}

class _PinInputState extends State<PinInput> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _isInternalController = false;
  bool _isInternalFocusNode = false;
  bool _hasAutoFilled = false;

  @override
  void initState() {
    super.initState();

    // Setup controller
    if (widget.controller != null) {
      _controller = widget.controller!;
      _isInternalController = false;
    } else {
      _controller = TextEditingController();
      _isInternalController = true;
    }

    // Setup focus node
    if (widget.focusNode != null) {
      _focusNode = widget.focusNode!;
      _isInternalFocusNode = false;
    } else {
      _focusNode = FocusNode();
      _isInternalFocusNode = true;
    }

    // Listen to focus changes for auto-paste
    // if (widget.enableAutoPaste) {
    //   _focusNode.addListener(_onFocusChange);
    //   // Also check clipboard on mount (user might come directly to this screen)
    //   WidgetsBinding.instance.addPostFrameCallback((_) async {
    //     await Future.delayed(const Duration(milliseconds: 400), () {
    //       if (widget.enableAutoPaste && mounted) {
    //         _checkClipboardAndAutoPaste();
    //       }
    //     });
    //   });
    // }
  }

  @override
  void didUpdateWidget(PinInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Handle enableAutoPaste changes
    if (oldWidget.enableAutoPaste != widget.enableAutoPaste) {
      if (widget.enableAutoPaste) {
        _focusNode.addListener(_onFocusChange);
      } else {
        _focusNode.removeListener(_onFocusChange);
      }
    }
  }

  @override
  void dispose() {
    if (widget.enableAutoPaste) {
      _focusNode.removeListener(_onFocusChange);
    }
    if (_isInternalController) {
      _controller.dispose();
    }
    if (_isInternalFocusNode) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  /// Called when focus state changes
  void _onFocusChange() {
    if (widget.enableAutoPaste && _focusNode.hasFocus && !_hasAutoFilled) {
      //    _checkClipboardAndAutoPaste();
    }
  }

  /// Check clipboard and auto-paste if valid code is found
  Future<void> _checkClipboardAndAutoPaste() async {
    // Don't auto-fill if already has content
    if (_controller.text.isNotEmpty) return;

    // Don't auto-fill if already done once
    if (_hasAutoFilled) return;

    try {
      final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
      final clipboardText = clipboardData?.text?.trim();

      if (clipboardText == null || clipboardText.isEmpty) return;

      // Validate clipboard content
      if (_isValidPinCode(clipboardText)) {
        // Auto-fill the code
        _controller.text = clipboardText;
        _hasAutoFilled = true;

        // Trigger haptic feedback
        if (widget.enableHapticFeedback) {
          HapticFeedback.mediumImpact();
        }

        // Call callbacks
        widget.onChanged?.call(clipboardText);
        if (clipboardText.length == widget.length) {
          widget.onCompleted?.call(clipboardText);
        }
      }
    } catch (e) {
      // Silently fail - clipboard access might be restricted
      debugPrint('Auto-paste failed: $e');
    }
  }

  /// Validate if clipboard text is a valid PIN code
  bool _isValidPinCode(String text) {
    // Must contain only digits
    if (!RegExp(r'^\d+$').hasMatch(text)) return false;

    // Must match expected length
    if (text.length != widget.length) return false;

    return true;
  }

  void _onPinCompleted(String pin) {
    if (widget.enableHapticFeedback) {
      HapticFeedback.mediumImpact();
    }
    widget.onCompleted?.call(pin);
  }

  void _onPinChanged(String value) {
    if (widget.enableHapticFeedback && value.isNotEmpty) {
      HapticFeedback.selectionClick();
    }
    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    // Default theme - empty box
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 56,
      textStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: UIColor.textPrimary,
      ),
      decoration: BoxDecoration(
        color: UIColor.turshry,
        // border: Border.all(color: UIColor.border),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    // Focused theme - active box with primary border and cursor
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: widget.hasError ? UIColor.borderError : UIColor.success,
        width: 2,
      ),
      color: UIColor.surface,
    );

    // Submitted theme - filled box
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: UIColor.surface,
        border: Border.all(
          color: widget.hasError ? UIColor.borderError : UIColor.success,
        ),
      ),
      textStyle: defaultPinTheme.textStyle?.copyWith(
        color: widget.hasError ? UIColor.error : UIColor.textPrimary,
      ),
    );

    // Error theme - for invalid state
    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: UIColor.borderError),
      ),
      textStyle: defaultPinTheme.textStyle?.copyWith(color: UIColor.error),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: UI.text.fieldLabel.copyWith(color: UIColor.primaryDark),
          ),
          SizedBox(height: UI.spacing.xxs),
        ],
        Center(
          child: Pinput(
            controller: _controller,
            focusNode: _focusNode,
            length: widget.length,
            onCompleted: _onPinCompleted,
            onChanged: _onPinChanged,
            mainAxisAlignment: MainAxisAlignment.center,
            defaultPinTheme: widget.hasError ? errorPinTheme : defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
            errorPinTheme: errorPinTheme,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            separatorBuilder: (index) => SizedBox(width: 4),
            closeKeyboardWhenCompleted: false,
            cursor: Container(
              width: 2,
              height: 24,
              decoration: BoxDecoration(
                color: UIColor.balck,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ),
        ),
        if (widget.hasError && widget.errorText != null) ...[
          SizedBox(height: UI.spacing.xxs),
          Text(
            widget.errorText!,
            style: UI.text.inputError.copyWith(color: UIColor.error),
          ),
        ],
        if (!widget.hasError && widget.helperText != null) ...[
          SizedBox(height: UI.spacing.xxs),
          Text(
            widget.helperText!,
            style: UI.text.caption.copyWith(color: UIColor.textSecondary),
          ),
        ],
      ],
    );
  }
}
