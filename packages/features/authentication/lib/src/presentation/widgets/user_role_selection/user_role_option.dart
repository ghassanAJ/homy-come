import 'package:design_system/design_system.dart';

/// Animated role option widget for user role selection
///
/// Displays a selectable option with radio button animation
class UserRoleOption extends StatefulWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const UserRoleOption({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<UserRoleOption> createState() => _UserRoleOptionState();
}

class _UserRoleOptionState extends State<UserRoleOption>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    if (widget.isSelected) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(UserRoleOption oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected != oldWidget.isSelected) {
      if (widget.isSelected) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: UIColor.background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: widget.isSelected ? UIColor.primary : UIColor.border,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            // Radio button
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.isSelected ? UIColor.primary : UIColor.border,
                  width: 2,
                ),
                color: Colors.transparent,
              ),
              child: Center(
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: UIColor.primary,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            // Label
            UIText.bodyMedium(widget.label, color: UIColor.textPrimary),
          ],
        ),
      ),
    );
  }
}
