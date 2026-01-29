import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../design_system.dart';

class SelectedButtonsInRow extends StatefulWidget {
  const SelectedButtonsInRow({
    super.key,
    required this.values,
    required this.selectedValue,
    required this.onChanged,
    this.radius = 6,
    this.selectedColor = UIColor.background,
    this.unselectedColor = UIColor.neutral200,
    required this.title,
    this.minimum,
    this.maximum,
    this.placeholder = 'Enter amount',
    this.errorText = 'Please enter a valid amount',
    this.fieldTitle = 'Custom Amount',
    this.helperText,
  });

  final List<String> values;
  final String selectedValue;
  final Function(String) onChanged;
  final double radius;
  final Color selectedColor;
  final Color unselectedColor;
  final String title;
  final String placeholder;
  final String errorText;
  final String fieldTitle;
  final String? helperText;
  final double? minimum;
  final double? maximum;

  @override
  State<SelectedButtonsInRow> createState() => _SelectedButtonsInRowState();
}

class _SelectedButtonsInRowState extends State<SelectedButtonsInRow> {
  String? selectedValue;
  bool showCustomAmountInput = false;
  TextEditingController customAmountController = TextEditingController();
  FocusNode customAmountFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedValue;
  }

  @override
  didUpdateWidget(covariant SelectedButtonsInRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedValue != widget.selectedValue) {
      setState(() {
        selectedValue = widget.selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Calculate grid height based on number of rows
    final rowCount = (widget.values.length / 3).ceil();
    final gridHeight =
        (rowCount * 40.0) +
        ((rowCount - 1) * 8.0); // 40px per item + 8px spacing

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        UIText.bodyMedium(widget.title),
        const SizedBox(height: 8),
        SizedBox(
          height: gridHeight,
          child: GridView.builder(
            clipBehavior: Clip.none,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: widget.values.length,
            itemBuilder:
                (context, index) => GestureDetector(
                  onTap: () {
                    if (widget.values[index] == 'other') {
                      setState(() {
                        showCustomAmountInput = true;
                        selectedValue = widget.values[index];

                        FocusScope.of(context).unfocus();
                        Future.delayed(Duration(milliseconds: 100), () {
                          FocusScope.of(
                            context,
                          ).requestFocus(customAmountFocusNode);
                        });
                      });
                      widget.onChanged(selectedValue ?? '');
                      return;
                    } else {
                      setState(() {
                        selectedValue = widget.values[index];
                        showCustomAmountInput = false;
                        customAmountController.clear();

                        widget.onChanged(selectedValue ?? '');
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color:
                          selectedValue == widget.values[index]
                              ? UIColor.secondary
                              : UIColor.neutral200,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color:
                            selectedValue == widget.values[index]
                                ? UIColor.primary
                                : UIColor.neutral200,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: UIText.bodyMedium(
                        widget.values[index],
                        color: UIColor.primaryDark,
                      ),
                    ),
                  ),
                ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          child:
              showCustomAmountInput
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 24),
                      AppTextField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return widget.errorText;
                          }
                          if ((widget.minimum != null &&
                              (double.tryParse(value) ?? 0) <
                                  widget.minimum!)) {
                            return 'Amount must be greater than ${widget.minimum?.toStringAsFixed(0)}';
                          }
                          if (widget.maximum != null &&
                              (double.tryParse(value) ?? 0) > widget.maximum!) {
                            return 'Amount must be less than ${widget.maximum?.toStringAsFixed(0)}';
                          }
                          return null;
                        },
                        prefixIconConstraints: BoxConstraints(
                          maxWidth: 90,
                          maxHeight: 90,
                        ),

                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: SvgPicture.asset(
                            'assets/icons/aed.svg',
                            package: 'top_up',
                            width: 16,
                            height: 16,
                          ),
                        ),
                        label: widget.fieldTitle,
                        focusNode: customAmountFocusNode,
                        controller: customAmountController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}'),
                          ),
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly,
                        ],

                        placeholder: 'Enter amount',
                        onChanged: (value) {
                          widget.onChanged(value);
                        },
                      ),
                      if (widget.helperText != null) ...[
                        const SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: UIText.bodySmall(
                            widget.helperText!,
                            color: UIColor.textSecondary,
                          ),
                        ),
                      ],
                    ],
                  )
                  : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
