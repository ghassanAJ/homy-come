import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart' as parser;

import '../../tokens/colors.dart';
import '../../ui.dart';

/// A phone number form field with country picker that matches the app's UI design
///
/// This widget integrates with flutter_form_builder and provides:
/// - Country selector with flag and dial code
/// - Phone number input with validation
/// - Consistent UI styling with the design system
///
/// Example:
/// ```dart
/// FormBuilder(
///   key: _formKey,
///   child: UIFormBuilderPhoneField(
///     name: 'phone',
///     placeholder: '50 512 3412',
///     defaultSelectedCountryIsoCode: 'AE',
///     validator: FormBuilderValidators.required(),
///   ),
/// )
/// ```
class UIFormBuilderPhoneField extends FormBuilderFieldDecoration<String> {
  /// Placeholder text shown when field is empty
  final String? placeholder;

  /// Default country ISO code selected in dropdown (default: 'AE')
  final String defaultSelectedCountryIsoCode;

  /// List of priority countries by ISO code
  final List<String>? priorityListByIsoCode;

  /// Filter countries by ISO code
  final List<String>? countryFilterByIsoCode;

  /// Text style for the input
  final TextStyle? style;

  /// Controller for the text field
  final TextEditingController? controller;

  /// Search text hint in country picker dialog
  final String? searchText;

  /// Title for the country picker dialog
  final Text? dialogTitle;

  /// Whether country picker dialog is searchable
  final bool? isSearchable;

  /// Comparator for sorting countries
  final Comparator<Country>? sortComparator;

  /// Creates a UI form builder phone field
  UIFormBuilderPhoneField({
    super.key,
    required super.name,
    super.validator,
    super.initialValue,
    super.onChanged,
    super.valueTransformer,
    super.enabled = true,
    super.onSaved,
    super.autovalidateMode,
    super.onReset,
    super.focusNode,
    this.placeholder,
    this.defaultSelectedCountryIsoCode = 'AE',
    this.priorityListByIsoCode,
    this.countryFilterByIsoCode,
    this.style,
    this.controller,
    this.searchText,
    this.dialogTitle,
    this.isSearchable,
    this.sortComparator,
    super.decoration = const InputDecoration(),
  }) : super(
         builder: (FormFieldState<String?> field) {
           final state = field as _UIFormBuilderPhoneFieldState;
           final hasError = state.hasError;

           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisSize: MainAxisSize.min,
             children: [
               buildField(state, placeholder),
               if (hasError && state.errorText != null) ...[
                 SizedBox(height: UI.spacing.xxs),
                 Text(
                   state.errorText!,
                   style: UI.text.bodySmall.copyWith(color: UIColor.error),
                 ),
               ],
             ],
           );
         },
       );

  static Widget buildField(
    _UIFormBuilderPhoneFieldState state,
    String? placeholder,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildCountryCodeSection(state),
        const SizedBox(width: 8),
        _buildPhoneFieldSection(state, placeholder),
      ],
    );
  }

  static Widget _buildCountryCodeSection(_UIFormBuilderPhoneFieldState state) {
    return GestureDetector(
      // onTap:
      //     state.enabled
      //         ? () {
      //           state.focus();
      //           state._openCountryPickerDialog();
      //         }
      //         : null,
      child: _FieldDecoration(
        hasError: false,
        isFocused: state._isFocused,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(
              state._selectedDialogCountry,
            ),
            const SizedBox(width: 8),
            Text(
              '+${state._selectedDialogCountry.phoneCode}',
              style: UI.text.inputText.copyWith(
                color: UIColor.textPrimary,
                height: 1.0,
              ),
            ),
            // const SizedBox(width: 4),
            // Icon(
            //   Icons.arrow_forward_ios,
            //   color: UIColor.textSecondary,
            //   size: 20,
            // ),
          ],
        ),
      ),
    );
  }

  static Expanded _buildPhoneFieldSection(
    _UIFormBuilderPhoneFieldState state,
    String? placeholder,
  ) {
    return Expanded(
      child: _FieldDecoration(
        hasError: false,
        isFocused: state._isFocused,
        child: TextField(
          enabled: state.enabled,
          style: UI.text.inputText.copyWith(
            color: UIColor.textPrimary,
            height: 1.0,
          ),
          focusNode: state.effectiveFocusNode,
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: placeholder ?? 'xx xxx xxxx',
            hintStyle: UI.text.inputPlaceholder.copyWith(
              color: UIColor.textPlaceholder,
              height: 1.0,
            ),
            filled: false,
            contentPadding: EdgeInsets.zero,
            isDense: true,
          ),
          maxLines: 1,
          keyboardType: TextInputType.phone,
          controller: state._effectiveController,
          autocorrect: false,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(15),
          ],
        ),
      ),
    );
  }

  @override
  FormBuilderFieldDecorationState<UIFormBuilderPhoneField, String>
  createState() => _UIFormBuilderPhoneFieldState();
}

class _FieldDecoration extends StatelessWidget {
  const _FieldDecoration({
    required this.child,
    required this.hasError,
    required this.isFocused,
  });
  final bool hasError;
  final bool isFocused;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: UI.sizes.inputHeight,
      decoration: BoxDecoration(
        color: UIColor.turshry,
        borderRadius: BorderRadius.circular(UI.radius.input),
        border: Border.all(
          color:
              hasError
                  ? UIColor.borderError
                  : isFocused
                  ? UIColor.border
                  : UIColor.turshry,
          width: isFocused ? 2 : 1,
        ),
        boxShadow:
            isFocused
                ? [
                  BoxShadow(
                    color: (hasError
                            ? UIColor.borderError
                            : UIColor.borderFocused)
                        .withValues(alpha: 0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
                : null,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: UI.spacing.inputHorizontal,
          vertical: UI.spacing.inputVertical,
        ),
        child: child,
      ),
    );
  }
}

/// State interface for accessing full phone number
abstract class UIFormBuilderPhoneFieldState {
  /// Returns the full phone number with country code (e.g., +971501234567)
  String get fullNumber;
}

class _UIFormBuilderPhoneFieldState
    extends FormBuilderFieldDecorationState<UIFormBuilderPhoneField, String>
    implements UIFormBuilderPhoneFieldState {
  late TextEditingController _effectiveController;
  late Country _selectedDialogCountry;
  bool _isFocused = false;

  @override
  String get fullNumber {
    final phoneText = _effectiveController.text;
    return phoneText.isNotEmpty
        ? '+${_selectedDialogCountry.phoneCode}$phoneText'
        : '';
  }

  @override
  void initState() {
    super.initState();
    _effectiveController = widget.controller ?? TextEditingController();
    _selectedDialogCountry = CountryPickerUtils.getCountryByIsoCode(
      widget.defaultSelectedCountryIsoCode,
    );
    _parseInitialValue();

    effectiveFocusNode.addListener(_onFocusChange);
    _effectiveController.addListener(_onTextChanged);
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = effectiveFocusNode.hasFocus;
    });
  }

  void _onTextChanged() {
    // Update form value with full number (country code + entered number)
    didChange(fullNumber);
  }

  @override
  void dispose() {
    effectiveFocusNode.removeListener(_onFocusChange);
    _effectiveController.removeListener(_onTextChanged);
    if (widget.controller == null) {
      _effectiveController.dispose();
    }
    super.dispose();
  }

  @override
  void reset() {
    super.reset();
    _effectiveController.removeListener(_onTextChanged);
    _effectiveController = widget.controller ?? TextEditingController();
    _selectedDialogCountry = CountryPickerUtils.getCountryByIsoCode(
      widget.defaultSelectedCountryIsoCode,
    );
    _parseInitialValue();
    _effectiveController.addListener(_onTextChanged);
  }

  /// Parse initial value only (not on every change)
  void _parseInitialValue() {
    final phone = initialValue ?? '';
    if (phone.isNotEmpty) {
      try {
        final parseResult = parser.PhoneNumber.parse(phone);
        final isoCode = parseResult.isoCode.name;
        _selectedDialogCountry = CountryPickerUtils.getCountryByIsoCode(
          isoCode,
        );
        _effectiveController.text = parseResult.nsn;
      } catch (error) {
        // If parsing fails, just strip the + and use as-is
        if (phone.startsWith('+')) {
          _effectiveController.text = phone.substring(1);
        } else {
          _effectiveController.text = phone;
        }
        debugPrint(error.toString());
      }
    }
  }

  void _onCountrySelected(Country country) {
    setState(() {
      _selectedDialogCountry = country;
    });
    // Update form value with new country code
    didChange(fullNumber);
  }

  void _openCountryPickerDialog() {
    showDialog<void>(
      context: context,
      builder: (context) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogTheme: DialogThemeData(backgroundColor: UIColor.surface),
          ),
          child: CountryPickerDialog(
            titlePadding: const EdgeInsets.all(16.0),
            searchCursorColor: UIColor.primary,
            searchInputDecoration: InputDecoration(
              hintText: widget.searchText ?? 'Search...',
              hintStyle: UI.text.inputPlaceholder.copyWith(
                color: UIColor.textPlaceholder,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(UI.radius.input),
                borderSide: BorderSide(color: UIColor.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(UI.radius.input),
                borderSide: BorderSide(color: UIColor.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(UI.radius.input),
                borderSide: BorderSide(color: UIColor.borderFocused, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
            isSearchable: widget.isSearchable ?? true,
            title:
                widget.dialogTitle ??
                Text(
                  'Select Country',
                  style: UI.text.h3.copyWith(color: UIColor.textPrimary),
                ),
            onValuePicked: _onCountrySelected,
            itemFilter:
                widget.countryFilterByIsoCode != null
                    ? (c) => widget.countryFilterByIsoCode!.contains(c.isoCode)
                    : null,
            priorityList:
                widget.priorityListByIsoCode != null
                    ? List.generate(widget.priorityListByIsoCode!.length, (
                      index,
                    ) {
                      return CountryPickerUtils.getCountryByIsoCode(
                        widget.priorityListByIsoCode![index],
                      );
                    })
                    : null,
            itemBuilder: _buildDialogItem,
            sortComparator: widget.sortComparator,
          ),
        );
      },
    );
  }

  Widget _buildDialogItem(Country country) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: CountryPickerUtils.getDefaultFlagImage(country),
      title: Text(
        country.name,
        style: UI.text.bodyMedium.copyWith(color: UIColor.textPrimary),
      ),
      trailing: Text(
        '+${country.phoneCode}',
        style: UI.text.bodyMedium.copyWith(color: UIColor.textSecondary),
      ),
    );
  }
}
