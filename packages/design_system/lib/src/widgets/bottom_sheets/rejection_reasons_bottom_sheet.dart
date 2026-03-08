import '../../../design_system.dart';

class ReasonsRejectionBottomSheet extends StatefulWidget {
  const ReasonsRejectionBottomSheet({
    super.key,
    required this.reasons,
    required this.title,
    required this.description,
  });
  final List<String> reasons;
  final String title;
  final String description;
  @override
  State<ReasonsRejectionBottomSheet> createState() =>
      _ReasonsRejectionBottomSheetState();
}

class _ReasonsRejectionBottomSheetState
    extends State<ReasonsRejectionBottomSheet> {
  String? _selectedReason;
  final TextEditingController _customReasonController = TextEditingController();

  @override
  void dispose() {
    _customReasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag handle
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: UIColor.background,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIText.bodyMedium(
                      widget.title,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    UIText.bodySmall(
                      widget.description,
                      color: UIColor.textSecondary,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              // Radio buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children:
                      widget.reasons.map((reason) {
                        return _buildRadioOption(reason);
                      }).toList(),
                ),
              ),
              // Custom reason text field (only shown when "Other" is selected)
              if (_selectedReason == 'Other') ...[
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UIText.bodySmall('Reason', color: UIColor.textSecondary),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: UIColor.border),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          controller: _customReasonController,
                          maxLines: 4,
                          onChanged: (value) {
                            setState(
                              () {},
                            ); // Trigger rebuild to update send button state
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your feedback here...',
                            hintStyle: UI.text.bodySmall.copyWith(
                              color: UIColor.textSecondary,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 24),
              // Action buttons
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: Row(
                  children: [
                    // Cancel button
                    Expanded(
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: UIColor.background,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextButton(
                          onPressed: () => Navigator.of(context).pop(null),
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: UIText.bodyMedium(
                            'Cancel',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Send button
                    Expanded(
                      child: UIButton.primary(label: 'send',onPressed:   _canSend()
                                    ? () {
                                      final reason =
                                          _selectedReason == 'Other'
                                              ? _customReasonController.text
                                                  .trim()
                                              : _selectedReason;
                                      Navigator.of(context).pop(reason);
                                    }
                                    : null, expanded: true),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRadioOption(String reason) {
    final isSelected = _selectedReason == reason;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedReason = reason;
        });
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? UIColor.primary : UIColor.border,
                  width: 2,
                ),
                color: isSelected ? UIColor.primary : Colors.transparent,
              ),
              child:
                  isSelected
                      ? const Icon(Icons.check, size: 12, color: Colors.white)
                      : null,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: UIText.bodyMedium(reason, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  bool _canSend() {
    if (_selectedReason == null) return false;
    if (_selectedReason == 'Other') {
      return _customReasonController.text.trim().isNotEmpty;
    }
    return true;
  }
}
