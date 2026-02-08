/// Spacing tokens for the design system
///
/// Access via: UI.spacing.md
class UISpacing {
  const UISpacing();

  /// Extra small spacing: 4px
  ///
  /// Usage: Tight spacing between related elements
  double get xxs => 4;

  /// Small spacing: 8px
  ///
  /// Usage: Small gaps, compact layouts
  double get xs => 8;

  /// Usage: Small gaps, compact layouts
  double get sm => 12;

  /// Medium spacing: 16px
  ///
  /// Usage: Standard spacing between elements, default padding
  double get md => 16;

  /// Large spacing: 24px
  ///
  /// Usage: Section spacing, larger gaps
  double get lg => 24;

  /// Extra large spacing: 32px
  ///
  /// Usage: Major section dividers
  double get xl => 32;

  /// Extra extra large spacing: 48px
  ///
  /// Usage: Page-level spacing
  double get xxl => 48;

  // ============================================================================
  // COMPONENT SPACING
  // ============================================================================

  /// Button horizontal padding: 10px
  ///
  /// Usage: Horizontal padding inside buttons
  double get buttonHorizontal => 10;

  /// Button vertical padding: 16px
  ///
  /// Usage: Vertical padding inside primary/secondary buttons without icons
  double get buttonVertical => 16;

  /// Button with icon vertical padding: 12px
  ///
  /// Usage: Vertical padding inside buttons with icons
  double get buttonWithIconVertical => 12;

  /// Input horizontal padding: 16px
  ///
  /// Usage: Horizontal padding inside text fields
  double get inputHorizontal => 16;

  /// Input vertical padding: 14px
  ///
  /// Usage: Vertical padding inside text fields
  double get inputVertical => 14;
}
