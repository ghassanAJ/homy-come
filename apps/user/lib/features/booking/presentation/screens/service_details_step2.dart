import 'package:design_system/design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:user/navigation/route.dart';

class ServiceDetailsStep2 extends StatefulWidget {
  const ServiceDetailsStep2({super.key});

  @override
  State<ServiceDetailsStep2> createState() => _ServiceDetailsStep2State();
}

class _ServiceDetailsStep2State extends State<ServiceDetailsStep2> {
  final Set<String> _selectedAddons = {'kitchen'};

  @override
  Widget build(BuildContext context) {
    final topContentPadding =
        MediaQuery.paddingOf(context).top + kToolbarHeight + UI.spacing.md;

    return UIScaffold(
      appBar: UIAppBar(
        titleWidget: Column(
          children: [
            UIText.h3('Popular add one', color: UIColor.balck),
            UIText.bodySmall('Step 2 to 4', color: UIColor.textSecondary),
          ],
        ),
        leading: GestureDetector(
          onTap: () {
            if (context.canPop()) context.pop();
          },
          child: const BackButtonAppBar(),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              UI.spacing.md,
              topContentPadding,
              UI.spacing.md,
              130,
            ),
            child: Row(
              children: [
                Expanded(
                  child: _AddonServiceCard(
                    title: 'Kitchen Cleaning',
                    reviews: '(130 Reviews)',
                    price: '\$150',
                    oldPrice: '\$180',
                    selected: _selectedAddons.contains('kitchen'),
                    onTap: () {
                      setState(() {
                        if (_selectedAddons.contains('kitchen')) {
                          _selectedAddons.remove('kitchen');
                        } else {
                          _selectedAddons.add('kitchen');
                        }
                      });
                    },
                  ),
                ),
                SizedBox(width: UI.spacing.sm),
                Expanded(
                  child: _AddonServiceCard(
                    title: 'Plumber',
                    reviews: '(130 Reviews)',
                    price: '\$150',
                    oldPrice: '\$180',
                    selected: _selectedAddons.contains('plumber'),
                    onTap: () {
                      setState(() {
                        if (_selectedAddons.contains('plumber')) {
                          _selectedAddons.remove('plumber');
                        } else {
                          _selectedAddons.add('plumber');
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            top: false,
            minimum: EdgeInsets.fromLTRB(
              UI.spacing.lg,
              UI.spacing.sm,
              UI.spacing.lg,
              UI.spacing.sm,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(UI.spacing.md),
                decoration: BoxDecoration(
                  color: UIColor.background,
                  borderRadius: BorderRadius.circular(UI.radius.lg),
                  boxShadow: UI.shadows.cardMd,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Total 78.00 AED',
                            style: UI.text.bodyMedium.copyWith(
                              color: UIColor.neutral300,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          UIText.h4('48.00AED', color: UIColor.balck),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 128,
                      child: UIButton.primary(
                        label: 'Next',
                        expanded: true,
                        onPressed: () {
                          context.push(UserPaths.serviceDetails3);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      withBackgroundGradient: true,
    );
  }
}

class _AddonServiceCard extends StatelessWidget {
  const _AddonServiceCard({
    required this.title,
    required this.reviews,
    required this.price,
    required this.oldPrice,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String reviews;
  final String price;
  final String oldPrice;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: UIColor.background,
        borderRadius: BorderRadius.circular(UI.radius.md),
        border: Border.all(color: UIColor.neutral100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(UI.radius.md),
            ),
            child: Container(
              height: 118,
              width: double.infinity,
              color: UIColor.neutral100,
              child: Icon(
                Icons.home_repair_service_outlined,
                size: UI.sizes.iconLg,
                color: UIColor.neutral500,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              UI.spacing.sm,
              UI.spacing.xs,
              UI.spacing.sm,
              UI.spacing.xs,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  size: UI.sizes.iconXs,
                  color: UIColor.babyBlue,
                ),
                SizedBox(width: UI.spacing.xxs),
                Expanded(
                  child: UIText.bodySmall(
                    reviews,
                    color: UIColor.neutral500,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: UI.spacing.sm),
            child: UIText.h3(title, color: UIColor.balck, maxLines: 2),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              UI.spacing.sm,
              UI.spacing.xs,
              UI.spacing.sm,
              UI.spacing.sm,
            ),
            child: Row(
              children: [
                UIText.h3(price, color: UIColor.balck),
                SizedBox(width: UI.spacing.xs),
                Text(
                  oldPrice,
                  style: UI.text.bodyMedium.copyWith(
                    color: UIColor.neutral300,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              UI.spacing.sm,
              0,
              UI.spacing.sm,
              UI.spacing.sm,
            ),
            child:
                selected
                    ? GestureDetector(
                      onTap: onTap,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: UI.spacing.xs),
                        decoration: BoxDecoration(
                          color: UIColor.pink,
                          borderRadius: BorderRadius.circular(UI.radius.md),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle_rounded,
                              color: UIColor.successBright,
                              size: UI.sizes.iconSm,
                            ),
                            SizedBox(width: UI.spacing.xs),
                            UIText.bodyMedium(
                              'Added Service',
                              fontWeight: FontWeight.w600,
                              color: UIColor.background,
                            ),
                          ],
                        ),
                      ),
                    )
                    : UIButton.outlined(
                      label: 'Add',
                      expanded: true,
                      backgroundColor: UIColor.babyBlue,
                      borderColor: UIColor.babyBlue,
                      foregroundColor: UIColor.white,
                      onPressed: onTap,
                    ),
          ),
        ],
      ),
    );
  }
}
