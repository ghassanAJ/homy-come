import '../../../design_system.dart';
import 'delete_confirmation_dialog.dart';

class DialogsManager {
  static Future<T?> showAnimatedDialog<T>({
    required BuildContext context,
    required Widget child,
    bool barrierDismissible = true,
    String? barrierLabel,
    Color? barrierColor,
    Duration duration = const Duration(milliseconds: 250),
  }) {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel ?? '',
      barrierColor: barrierColor ?? Colors.black54,
      transitionDuration: duration,
      pageBuilder: (_, __, ___) => Center(child: child),
      transitionBuilder: (_, animation, __, widget) {
        final curve = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
        );

        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(scale: curve, child: widget),
        );
      },
    );
  }

  static Future<bool> showDeleteConfirmation(
    BuildContext context, {
    required String title,
    required String description,
    String? confirmButtonLabel,
    String? cancelButtonLabel,
  }) async {
    return await showAnimatedDialog<bool>(
          context: context,
          child: DeleteConfirmationDialog(
            confirmButtonLabel: confirmButtonLabel,
            cancelButtonLabel: cancelButtonLabel,
            title: title,
            description: description,
          ),
        ) ??
        false;
  }

  static void showLoading(BuildContext context) {
    showAnimatedDialog<void>(
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      context: context,
      child: LoadingDialog(),
    );
  }

  static void hideLoading(BuildContext context) {
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }
}

//
class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: MDProgressIndicator(styled: true));
  }
}

class MDProgressIndicator extends StatelessWidget {
  final Color? color;
  final double opacity;
  final double? width;
  final double? height;
  final bool styled;
  final Color? spinnerColor;

  const MDProgressIndicator({
    super.key,
    this.color,
    this.opacity = 0.5,
    this.width,
    this.height,
    this.styled = false,
    this.spinnerColor,
  });

  @override
  Widget build(BuildContext context) {
    // Default overlay color: white for unstiled, black for styled
    final overlayColor = color ?? (styled ? Colors.black : Colors.white);

    return Container(
      color: overlayColor.withValues(alpha: opacity),
      width: width ?? double.infinity,
      height: height,
      child: AbsorbPointer(
        absorbing: true,
        child: Center(
          child: styled ? _buildStyledSpinner(context) : _buildSimpleSpinner(),
        ),
      ),
    );
  }

  Widget _buildSimpleSpinner() {
    return const CircularProgressIndicator();
  }

  Widget _buildStyledSpinner(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          spinnerColor ?? UIColor.primary,
        ),
        strokeWidth: 3,
      ),
    );
  }
}
