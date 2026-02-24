/// Border radius tokens for the design system
///
/// Access via: UI.radius.md
class UIRadius {
  const UIRadius();

  /// Extra small radius
  /// Used for very small elements like button group select
  double get xs => 4;

  /// Usage: Small elements, chips, Pin input cells
  double get sm => 6;

  /// Usage: Input fields, cards
  double get md => 12;

  /// Usage: input pin , like email or phone number
  double get lg => 16;

  /// Extra large radius: 24px
  ///
  /// Usage: Modal dialogs, bottom sheets , some chips ..etc
  double get xl => 20;

  double get buttonSm => md;
  double get buttonMd => lg;
  double get button => 6; // Default button radius: 16px

  double get input => sm;
}
