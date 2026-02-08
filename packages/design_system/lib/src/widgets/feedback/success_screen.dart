import 'package:flutter_svg/flutter_svg.dart';

import '../../../design_system.dart';

/// Reusable success dialog/screen with animations
///
/// Displays a success icon with animations, title, optional description,
/// and an action button.
///
/// Example:
/// ```dart
/// SuccessScreen(
///   title: 'Payment Successful',
///   description: 'Your payment has been processed',
///   buttonText: 'Done',
///   onButtonPressed: () => Navigator.pop(context),
/// )
/// ```
class SuccessScreen extends StatefulWidget {
  /// Title text displayed below the icon
  final String title;

  /// Optional description text displayed below the title
  final String? description;

  /// Button text (default: 'Done')
  final String? buttonText;

  /// Optional secondary button text
  final String? secondaryButtonText;

  /// Callback when primary button is pressed
  final VoidCallback? onButtonPressed;

  /// Callback when secondary button is pressed
  final VoidCallback? onSecondaryButtonPressed;

  /// Optional custom icon path (SVG)
  /// If not provided, uses a default success checkmark
  final String? customIconPath;

  /// Package name for the custom icon asset
  final String? iconPackage;

  /// Icon size (default: 96)
  final double iconSize;

  /// Whether to show as a full screen or dialog
  final bool isFullScreen;

  /// Whether to auto-dismiss after showing (default: false)
  final bool autoDismiss;

  /// Duration before auto-dismiss (if enabled)
  final Duration autoDismissDuration;

  const SuccessScreen({
    super.key,
    required this.title,
    this.description,
    this.buttonText,
    this.secondaryButtonText,
    this.onButtonPressed,
    this.onSecondaryButtonPressed,
    this.customIconPath,
    this.iconPackage,
    this.iconSize = 96,
    this.isFullScreen = false,
    this.autoDismiss = false,
    this.autoDismissDuration = const Duration(seconds: 2),
  });

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();

  /// Show as a dialog
  static Future<T?> showDialog<T>(
    BuildContext context, {
    required String title,
    String? description,
    String? buttonText,
    String? secondaryButtonText,
    VoidCallback? onButtonPressed,
    VoidCallback? onSecondaryButtonPressed,
    String? customIconPath,
    String? iconPackage,
    bool barrierDismissible = false,
  }) {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: 'Success',
      pageBuilder: (context, animation, secondaryAnimation) {
        return SuccessScreen(
          title: title,
          description: description,
          buttonText: buttonText,
          secondaryButtonText: secondaryButtonText,
          onButtonPressed: onButtonPressed,
          onSecondaryButtonPressed: onSecondaryButtonPressed,
          customIconPath: customIconPath,
          iconPackage: iconPackage,
          isFullScreen: false,
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.8, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut),
            ),
            child: child,
          ),
        );
      },
    );
  }

  /// Show as a full screen
  static Future<T?> showFullScreen<T>(
    BuildContext context, {
    required String title,
    String? description,
    String? buttonText,
    String? secondaryButtonText,
    VoidCallback? onButtonPressed,
    VoidCallback? onSecondaryButtonPressed,
    String? customIconPath,
    String? iconPackage,
    bool autoDismiss = false,
    Duration autoDismissDuration = const Duration(seconds: 2),
  }) {
    return Navigator.push<T>(
      context,
      MaterialPageRoute(
        builder:
            (context) => SuccessScreen(
              title: title,
              description: description,
              buttonText: buttonText,
              secondaryButtonText: secondaryButtonText,
              onButtonPressed: onButtonPressed,
              onSecondaryButtonPressed: onSecondaryButtonPressed,
              customIconPath: customIconPath,
              iconPackage: iconPackage,
              isFullScreen: true,
              autoDismiss: autoDismiss,
              autoDismissDuration: autoDismissDuration,
            ),
      ),
    );
  }
}

class _SuccessScreenState extends State<SuccessScreen>
    with TickerProviderStateMixin {
  late AnimationController _checkController;
  late AnimationController _fadeController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _buttonFadeAnimation;

  @override
  void initState() {
    super.initState();

    // Icon scale animation
    _checkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _checkController,
      curve: Curves.elasticOut,
    );

    // Fade-in sequence for text + buttons
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    _buttonFadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
    );

    // Play animations in sequence
    _checkController.forward().then((_) {
      _fadeController.forward();

      // Auto-dismiss if enabled
      if (widget.autoDismiss) {
        Future.delayed(widget.autoDismissDuration, () {
          if (mounted) {
            Navigator.of(context).pop();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _checkController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isFullScreen) {
      return Scaffold(
        backgroundColor: UIColor.background,
        body: SafeArea(child: Center(child: _buildContent())),
      );
    }

    return AlertDialog(
      backgroundColor: UIColor.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: const EdgeInsets.all(32),
      content: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        // Animated success icon with pulse glow
        AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, _) {
            final scale = _scaleAnimation.value;
            return Stack(
              alignment: Alignment.center,
              children: [
                // Glow pulse
                Container(
                  width: 140 * scale,
                  height: 140 * scale,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff6ADBDA).withOpacity(0.15 * scale),
                  ),
                ),
                // Icon
                Transform.scale(scale: scale, child: _buildIcon()),
              ],
            );
          },
        ),

        const SizedBox(height: 32),

        // Animated title
        FadeTransition(
          opacity: _fadeAnimation,
          child: UIText.h2(widget.title, textAlign: TextAlign.center),
        ),

        if (widget.description != null) ...[
          const SizedBox(height: 8),
          FadeTransition(
            opacity: _fadeAnimation,
            child: UIText.bodyMedium(
              widget.description!,
              color: UIColor.textSecondary,
              textAlign: TextAlign.center,
            ),
          ),
        ],

        if (widget.buttonText != null ||
            widget.secondaryButtonText != null) ...[
          Spacer(),
          FadeTransition(
            opacity: _buttonFadeAnimation,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _buildButtons(),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildIcon() {
    if (widget.customIconPath != null) {
      return SvgPicture.asset(
        widget.customIconPath!,
        package: widget.iconPackage,
        width: widget.iconSize,
        height: widget.iconSize,
      );
    }

    // Default success icon
    return Container(
      width: widget.iconSize,
      height: widget.iconSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xff6ADBDA),
      ),
      child: Icon(
        Icons.check_rounded,
        color: Colors.white,
        size: widget.iconSize * 0.6,
      ),
    );
  }

  Widget _buildButtons() {
    final hasSecondaryButton = widget.secondaryButtonText != null;

    if (!hasSecondaryButton) {
      // Single button
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: SizedBox(
          width: double.infinity,
          child: UIButton.primary(
            label: widget.buttonText ?? 'Done',
            onPressed:
                widget.onButtonPressed ?? () => Navigator.of(context).pop(),
          ),
        ),
      );
    }

    // Two buttons
    return Column(
      children: [
        UIButton.primary(
          expanded: true,
          label: widget.buttonText ?? 'Done',
          onPressed:
              widget.onButtonPressed ?? () => Navigator.of(context).pop(),
        ),
        const SizedBox(height: 12),

        UIButton.outlined(
          expanded: true,
          label: widget.secondaryButtonText ?? 'Done',
          onPressed:
              widget.onSecondaryButtonPressed ??
              () => Navigator.of(context).pop(),
          borderColor: UIColor.neutral200,
          borderRadius: 16,
        ),
      ],
    );
  }
}
