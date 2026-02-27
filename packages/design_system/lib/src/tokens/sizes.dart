import 'package:design_system/design_system.dart';

/// Size tokens for the design system
///
/// Access via: UI.sizes.iconSm
class UISizes {
  const UISizes();

  // ============================================================================
  // ICON SIZES
  // ============================================================================

  /// Extra small icon: 16px
  ///
  /// Usage: Small decorative icons, inline icons
  double get iconXs => 16;

  /// Small icon: 20px
  double get iconXXs => 13;

  /// Usage: Button icons, form field icons
  double get iconSm => 20;

  /// Medium icon: 24px
  ///
  /// Usage: Standard icons, navigation icons
  double get iconMd => 24;

  /// Large icon: 32px
  ///
  /// Usage: Feature icons, prominent actions
  double get iconLg => 32;

  double get iconXl => 38;
  // ============================================================================
  // INPUT FIELD SIZES
  // ============================================================================

  /// Standard input field height: 52px
  ///
  /// Usage: Text fields, phone fields, date fields
  double get inputHeight => 52;

  /// Date field calendar icon size: 16.67px
  ///
  /// Usage: Calendar icon in date picker fields
  double get dateIconSize => 16.67;

  // ============================================================================
  // LOADING INDICATOR SIZES
  // ============================================================================

  /// Small loading indicator: 20px
  ///
  /// Usage: Button loading states
  double get loadingIndicatorSm => 20;

  /// Loading indicator stroke width: 2px
  ///
  /// Usage: CircularProgressIndicator stroke
  double get loadingIndicatorStroke => 2;

  // ============================================================================
  // SUCCESS/ERROR ICON SIZES
  // ============================================================================

  /// Success/Error icon container size: 24px
  ///
  /// Usage: Success checkmark, error close icons in input fields
  double get statusIconContainer => 24;

  /// Success/Error icon size: 16px
  ///
  /// Usage: Icon size inside status containers
  double get statusIcon => 16;

  // ============================================================================
  // AVATAR SIZES
  // ============================================================================

  /// Small avatar size: 32px
  ///
  /// Usage: Compact avatars in lists, comments, inline usage
  double get avatarSm => 32;

  /// Medium avatar size: 48px
  ///
  /// Usage: Default avatar size for most use cases
  double get avatarMd => 48;

  /// Large avatar size: 64px
  ///
  /// Usage: Prominent avatars in profiles, headers, detail views
  double get avatarLg => 64;
  double get avatarxL => 94;
  /// Avatar border width for selected state: 3px
  ///
  /// Usage: Border width when avatar is in selected state
  double get avatarBorderWidth => 3;

  /// Bottom navigation bar height: 87px
  ///
  /// Usage: Bottom navigation bar height
  double get bottomNavigationBarHeight => 87;
  double get bottomPadding => 130;
  // ============================================================================
  // AppBar SIZES
  // ============================================================================

  double get appBarHeight => 60;




  
  // ============================================================================
  // track oUtlined SIZES
  // ============================================================================

  double get trackOUtLined => 10;



  
  // ============================================================================
  // TimeShotChip  SIZES
  // ============================================================================

  double get timeShotChipW => 110;



}

// extension spacerCustom on UISizes{

//   SizedBox get sizedH=> SizedBox(
//     height: this.,
//   );
// }
