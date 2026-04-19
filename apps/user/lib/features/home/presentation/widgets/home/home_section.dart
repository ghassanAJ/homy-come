import 'package:design_system/design_system.dart';
import 'package:user/features/home/presentation/widgets/home/section_header.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({
    super.key,
    required this.title,
    required this.child,
    this.actionLabel,
    this.onActionTap,
    this.horizontalPadding,
    this.titleBottomSpacing,
    this.sectionTopSpacing,
    this.sectionBottomSpacing,
  });

  final String title;
  final Widget child;
  final String? actionLabel;
  final VoidCallback? onActionTap;
  final EdgeInsetsGeometry? horizontalPadding;
  final double? titleBottomSpacing;
  final double? sectionTopSpacing;
  final double? sectionBottomSpacing;
  bool get _hasAction => actionLabel != null && onActionTap != null;

  @override
  Widget build(BuildContext context) {
    final hp = horizontalPadding ?? UI.padding.startLg;
    final tb = titleBottomSpacing ?? UI.spacing.sm;

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (sectionTopSpacing != null) SizedBox(height: sectionTopSpacing),
          Padding(padding: hp, child: _buildHeader()),
          SizedBox(height: tb),
          child,
          if (sectionBottomSpacing != null)
            SizedBox(height: sectionBottomSpacing),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    if (_hasAction) {
      return SectionHeaderWithAction(
        title: title,
        actionLabel: actionLabel!,
        onActionTap: onActionTap,
      );
    }
    return SectionTitle(title: title);
  }
}
