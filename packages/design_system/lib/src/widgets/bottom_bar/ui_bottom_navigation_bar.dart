import '../../../design_system.dart';

class UiBottomNavigationItem {
  const UiBottomNavigationItem({required this.iconAsset, required this.label});

  final String iconAsset;
  final String label;
}

class UiBottomNavigationBar extends StatelessWidget {
  const UiBottomNavigationBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  final List<UiBottomNavigationItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 37, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(UI.radius.lg),
          topRight: Radius.circular(UI.radius.lg),
        ),
        boxShadow: [
          BoxShadow(
            color: UIColor.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(UI.radius.lg)),
        child: BottomNavigationBar(
          selectedLabelStyle: UI.text.bodyXSmall.copyWith(
            color: UIColor.babyBlue,
            fontWeight: FontWeight.w700,
          ),
          unselectedLabelStyle: UI.text.bodyXSmall.copyWith(
            color: UIColor.neutral400,
          ),
          currentIndex: currentIndex,
          onTap: onTap,
          backgroundColor: UIColor.white,
          selectedItemColor: UIColor.babyBlue,
          unselectedItemColor: UIColor.neutral400,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: items.map(_buildNavigationItem).toList(),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavigationItem(UiBottomNavigationItem item) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(bottom: UI.spacing.xs),
        child: Image.asset(
          item.iconAsset,
          width: UI.sizes.iconMd,
          height: UI.sizes.iconMd,
          color: UIColor.neutral400,
          errorBuilder:
              (context, error, stackTrace) =>
                  const Icon(Icons.error, color: UIColor.neutral400),
          package: 'design_system',
        ),
      ),
      activeIcon: Padding(
        padding: EdgeInsets.only(bottom: UI.spacing.xs),
        child: Image.asset(
          item.iconAsset,
          width: UI.sizes.iconMd,
          errorBuilder:
              (context, error, stackTrace) =>
                  const Icon(Icons.error, color: UIColor.babyBlue),

          height: UI.sizes.iconMd,
          color: UIColor.babyBlue,
        ),
      ),
      label: item.label,
    );
  }
}
