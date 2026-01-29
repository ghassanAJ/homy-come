import 'package:flutter_svg/svg.dart';

import '../../../design_system.dart';

/// Base abstract class for all request cards (money, withdrawal, etc.)
/// Follows SOLID principles:
/// - Single Responsibility: Handles common card layout and styling
/// - Open/Closed: Open for extension (subclasses), closed for modification
/// - Liskov Substitution: All subclasses can be used interchangeably
/// - Interface Segregation: Only exposes necessary methods
/// - Dependency Inversion: Depends on abstractions (abstract methods)
abstract class BaseRequestCard<T> extends StatelessWidget {
  /// The request model (can be MoneyRequestModel, WithdrawResponseModel, etc.)
  final T request;

  const BaseRequestCard({super.key, required this.request});

  /// Override this method to build card-specific content
  /// This is the Template Method pattern - defines the skeleton of the algorithm
  Widget buildCardContent(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(UI.radius.lg);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        margin: EdgeInsetsDirectional.symmetric(
          horizontal: UI.spacing.md,
          vertical: UI.spacing.xs,
        ),
        decoration: BoxDecoration(
          color: UIColor.surface,
          borderRadius: borderRadius,
          boxShadow: UI.shadows.sm,
        ),
        child: buildCardContent(context),
      ),
    );
  }

  // =========================================================================
  // PROTECTED HELPER METHODS - Available to subclasses
  // =========================================================================

  /// Build a title text with consistent styling
  UIText buildTitle(String title) {
    return UIText.bodyMedium(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w600,
    );
  }

  /// Build status chip with icon and label
  Widget buildStatusChip({
    required String label,
    required UIColor color,
    required String icon,
    required String package,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: UI.spacing.md),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(icon, package: package),
          SizedBox(width: UI.spacing.xxs),
          UIText.bodySmall(label, color: color),
        ],
      ),
    );
  }

  /// Build rejection/reason section
  Widget buildReasonSection(String reason) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: UI.spacing.md),
      child: UIText.bodySmall(
        reason,
        color: UIColor.textSecondary,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  /// Format date to readable string (e.g., "Jan 15")
  String formatDate(String dateString, List<String> monthTranslations) {
    final date = DateTime.tryParse(dateString);
    if (date == null) return '';

    return '${monthTranslations[date.month - 1]} ${date.day.toString().padLeft(2, '0')}';
  }

  /// Format DateTime to readable string
  String formatDateTime(DateTime date, List<String> monthTranslations) {
    return '${monthTranslations[date.month - 1]} ${date.day.toString().padLeft(2, '0')}';
  }

  /// Check if date is today
  bool isToday(String dateString) {
    final date = DateTime.tryParse(dateString);
    if (date == null) return false;

    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  /// Check if DateTime is today
  bool isDateTimeToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }
}
