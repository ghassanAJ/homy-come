import 'package:design_system/design_system.dart';

class CancellationPolicyModel {
  final String category;
  final String cancellationFee;
  final String reschedulingFee;

  const CancellationPolicyModel({
    required this.category,
    required this.cancellationFee,
    required this.reschedulingFee,
  });
}

final List<CancellationPolicyModel> mockPolicies = [
  CancellationPolicyModel(
    category: '15 minutes after submitting the request',
    cancellationFee: 'No Fees',
    reschedulingFee: 'No Fees',
  ),
  CancellationPolicyModel(
    category: '6 hours or more before the booking time',
    cancellationFee: 'No Fees',
    reschedulingFee: 'No Fees',
  ),
  CancellationPolicyModel(
    category: '6 hours or more before the booking time',
    cancellationFee: '25% of the booking value',
    reschedulingFee: '25% of the booking value',
  ),
  CancellationPolicyModel(
    category: 'Less than 2 hours before the booking time',
    cancellationFee: '50% of the booking value',
    reschedulingFee: '50% of the booking value',
  ),
];

class CancellationSheetContent extends StatelessWidget {
  const CancellationSheetContent({
    super.key,
    this.policies = const [
      CancellationPolicyModel(
        category: '15 minutes after submitting the request',
        cancellationFee: 'No Fees',
        reschedulingFee: 'No Fees',
      ),
      CancellationPolicyModel(
        category: '6 hours or more before the booking time',
        cancellationFee: 'No Fees',
        reschedulingFee: 'No Fees',
      ),
      CancellationPolicyModel(
        category: '6 hours or more before the booking time',
        cancellationFee: '25% of the booking value',
        reschedulingFee: '25% of the booking value',
      ),
      CancellationPolicyModel(
        category: 'Less than 2 hours before the booking time',
        cancellationFee: '50% of the booking value',
        reschedulingFee: '50% of the booking value',
      ),
    ],
  });

  final List<CancellationPolicyModel> policies;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: UIColor.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(UI.radius.lg)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Handle ─────────────────────────────

          // ── Title ─────────────────────────────
          Padding(
            padding: EdgeInsets.symmetric(horizontal: UI.spacing.sm),
            child: UIText.h6(
              'Cancellation and Rescheduling Policy',
              color: UIColor.balck,
            ),
          ),

          SizedBox(height: UI.spacing.md),

          // ── Table Header ──────────────────────
          _HeaderRow(),

          Divider(height: 1),

          // ── Table Rows ────────────────────────
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: policies.length,
              separatorBuilder: (_, __) => Divider(height: 1),
              itemBuilder: (context, index) {
                final item = policies[index];
                return _PolicyRow(item: item);
              },
            ),
          ),

          SizedBox(height: UI.spacing.md),

          // ── Warning Section ───────────────────
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(UI.spacing.md),
            color: UIColor.error.withValues(alpha: 0.08),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline, color: UIColor.error, size: 18),
                SizedBox(width: UI.spacing.xs),
                Expanded(
                  child: UIText.bodySmall(
                    'You can reschedule bookings paid for in cash up to twice.',
                    color: UIColor.error,
                    maxLines: 4,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: UI.spacing.md),

          // ── Button ────────────────────────────
          Padding(
            padding: EdgeInsets.all(0),
            child: UIButton.primary(
              expanded: true,
              label: 'Done',
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}

class _PolicyRow extends StatelessWidget {
  const _PolicyRow({required this.item});

  final CancellationPolicyModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        // horizontal: UI.spacing.md,
        vertical: UI.spacing.sm,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: UIText.bodySmall(
              item.category,
              color: UIColor.grey,
              maxLines: 3,
              fontSize: 12,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 8.0),
              child: UIText.bodySmall(
                item.cancellationFee,
                color: UIColor.grey,
                fontSize: 12,

                maxLines: 3,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 8.0),
              child: UIText.bodySmall(
                item.reschedulingFee,
                // color: UIColor.neutral500,
                fontSize: 12,

                color: UIColor.grey,
                maxLines: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        // horizontal: UI.spacing.md,
        vertical: UI.spacing.sm,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: UIText.bodySmall(
              'Category',
              fontWeight: FontWeight.w400,

              maxLines: 2,
            ),
          ),
          Expanded(
            flex: 3,
            child: UIText.bodySmall(
              'Cancellation Fees',
              maxLines: 2,
              fontWeight: FontWeight.w400,
            ),
          ),
          Expanded(
            flex: 3,
            child: UIText.bodySmall(
              'Rescheduling Fees',
              maxLines: 2,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
