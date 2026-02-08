import '../../tokens/colors.dart';
import 'package:flutter/material.dart';
import '../../ui.dart';
import 'input_utils.dart';

/// A date input field component that follows the design system
///
/// This component displays a text field with a calendar icon suffix
/// that opens a date picker when tapped.
///
/// Example:
/// ```dart
/// DateField(
///   label: 'Date of birth',
///   onChanged: (date) => print(date),
/// )
/// ```
class DateField extends StatefulWidget {
  /// Label displayed above the field
  final String? label;

  /// Placeholder text shown when field is empty
  final String? placeholder;

  /// Helper text displayed below the field
  final String? helperText;

  /// Initial date value
  final DateTime? initialDate;

  /// Callback when date changes
  final ValueChanged<DateTime?>? onChanged;

  /// Error message to display
  final String? error;

  /// Whether the field is enabled
  final bool enabled;

  /// Whether the field is read-only (hides calendar icon)
  final bool readOnly;

  /// First selectable date (defaults to 100 years ago)
  final DateTime? firstDate;

  /// Last selectable date (defaults to today)
  final DateTime? lastDate;

  /// Date format function (defaults to yyyy-MM-dd)
  final String Function(DateTime)? dateFormatter;

  /// Focus node
  final FocusNode? focusNode;

  /// Controller for the text field
  final TextEditingController? controller;

  const DateField({
    super.key,
    this.label,
    this.placeholder,
    this.helperText,
    this.initialDate,
    this.onChanged,
    this.error,
    this.enabled = true,
    this.readOnly = false,
    this.firstDate,
    this.lastDate,
    this.dateFormatter,
    this.focusNode,
    this.controller,
  });

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  late FocusNode _focusNode;
  late TextEditingController _controller;
  DateTime? _selectedDate;
  bool _isFocused = false;
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
      _controller = TextEditingController();
      _isInternalController = true;
    }

    // Initialize date
    _selectedDate = widget.initialDate;
    if (_selectedDate != null) {
      _controller.text = _formatDate(_selectedDate!);
    }
  }

  @override
  void didUpdateWidget(DateField oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update date if initialDate changed from outside
    if (widget.controller == null &&
        widget.initialDate != oldWidget.initialDate) {
      _selectedDate = widget.initialDate;
      _controller.text =
          _selectedDate != null ? _formatDate(_selectedDate!) : '';
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);

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

  String _formatDate(DateTime date) {
    if (widget.dateFormatter != null) {
      return widget.dateFormatter!(date);
    }
    // Default format: yyyy-MM-dd
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  Future<void> _selectDate() async {
    if (!widget.enabled || widget.readOnly) return;

    final now = DateTime.now();
    final firstDate = widget.firstDate ?? DateTime(now.year - 100);
    final lastDate = widget.lastDate ?? now;

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: UIColor.primary,
              onPrimary: UIColor.onPrimary,
              surface: UIColor.surface,
              onSurface: UIColor.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _controller.text = _formatDate(pickedDate);
      });
      widget.onChanged?.call(pickedDate);
    }
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
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            enabled: widget.enabled,
            readOnly: true, // Always read-only, date is selected via picker
            onTap: _selectDate,
            style: UI.text.inputText.copyWith(color: UIColor.textPrimary),
            decoration: InputDecoration(
              hintText: widget.placeholder ?? 'Select date',
              hintStyle: UI.text.inputPlaceholder.copyWith(
                color: UIColor.textPlaceholder,
              ),
              filled: true,
              fillColor: UIColor.surface,
              contentPadding: EdgeInsets.symmetric(
                horizontal: UI.spacing.inputHorizontal,
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
                borderSide: BorderSide(
                  color: _getBorderColor(),
                  width: 2,
                ),
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
              suffixIcon: !widget.readOnly
                  ? IconButton(
                      icon: Icon(
                        Icons.calendar_today,
                        size: UI.sizes.dateIconSize,
                        color: UIColor.textSecondary,
                      ),
                      onPressed: widget.enabled ? _selectDate : null,
                    )
                  : null,
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
