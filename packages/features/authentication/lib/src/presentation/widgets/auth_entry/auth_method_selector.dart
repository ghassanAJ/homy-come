import 'package:authentication/authentication.dart';
import 'package:authentication/src/presentation/helpers/auth_method_ui_extension.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthMethodSelector extends StatelessWidget {
  final List<AuthMethod> availableMethods;
  final List<AuthMethod> socialMethods;
  final AuthMethod currentMethod;
  final bool isChildMode;
  final void Function(AuthMethod method) onMethodSelected;
  final VoidCallback? onSocialMethodTap;

  const AuthMethodSelector({
    super.key,
    required this.availableMethods,
    required this.socialMethods,
    required this.currentMethod,
    required this.isChildMode,
    required this.onMethodSelected,
    this.onSocialMethodTap,
  });

  @override
  Widget build(BuildContext context) {
    // Get methods that are not currently selected
    final otherMethods =
        availableMethods.where((method) => method != currentMethod).toList();

    // Combine all alternative methods
    final allAlternativeMethods = [...otherMethods, ...socialMethods];

    if (allAlternativeMethods.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        SizedBox(height: UI.spacing.lg),
        // Divider with text
        Row(
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: UI.spacing.md),
              child: UIText.bodySmall(
                isChildMode ? 'or login with' : 'or continue with',
                color: UIColor.textSecondary,
              ),
            ),
            const Expanded(child: Divider()),
          ],
        ),
        SizedBox(height: UI.spacing.lg),
        ...allAlternativeMethods.map((method) {
          // Social methods need special handling
          if (method.isSocial) {
            return _buildMethodButton(
              method,
              onPressed:
                  onSocialMethodTap ??
                  () {
                    // TODO: Implement social login
                  },
            );
          }
          return _buildMethodButton(
            method,
            onPressed: () => onMethodSelected(method),
          );
        }),
      ],
    );
  }

  Widget _buildMethodButton(AuthMethod method, {VoidCallback? onPressed}) {
    final svgAsset = method.svgAsset;
    final icon = method.icon;

    Widget? leadingWidget;
    if (svgAsset != null) {
      leadingWidget = SvgPicture.asset(
        svgAsset,
        package: 'authentication',
        width: 24,
        height: 24,
      );
    } else if (icon != null) {
      leadingWidget = Icon(icon, size: 24);
    }

    return Column(
      children: [
        UIButton.outlined(
          leadingWidget: leadingWidget,
          label: method.label,
          onPressed: onPressed,
          expanded: true,
          centerLabel: true,
        ),
        SizedBox(height: UI.spacing.md),
      ],
    );
  }
}
