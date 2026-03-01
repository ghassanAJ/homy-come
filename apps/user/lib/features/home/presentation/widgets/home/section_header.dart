import 'package:design_system/design_system.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return UIText.bodyMedium(
      title,
      fontWeight: FontWeight.w700,
      color: UIColor.charcoal,
    );
  }
}

class SectionHeaderWithAction extends StatelessWidget {
  const SectionHeaderWithAction({
    required this.title,
    this.actionLabel = 'See All',
    this.onActionTap,
    super.key,
  });

  final String title;
  final String actionLabel;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SectionTitle(title: title),
        const Spacer(),
        GestureDetector(
          onTap: onActionTap,
          child: Padding(
            padding: UI.padding.userHomeItemStartAndEnd(isFirst: true,),
            child: UIText.bodySmall(
              actionLabel,
              color: UIColor.babyBlue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
