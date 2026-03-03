import 'package:booking/src/presentation/widgets/add_on_servies_card.dart';
import 'package:booking/src/presentation/widgets/step_navigation_bar.dart';
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
    final width = MediaQuery.of(context).size.width;
    return UIScaffold(
      appBar: UIAppBar(
        titleWidget: Column(
          children: [
            UIText.h6('Popular add one', color: UIColor.balck),
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
              UI.spacing.md,
              UI.spacing.md,
              UI.sizes.bottomNavigationBarHeight,
            ),
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: UI.spacing.sm,
                mainAxisSpacing: UI.spacing.sm,
                childAspectRatio: 3 / 5,
              ),
              itemBuilder:
                  (contexyt, i) => AddonServiceCard(
                    reviews: '(130 Reviews)',
                    title: 'Kitchen Cleaning',
                    price: '150',
                    oldPrice: '180',
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
              child: StepNavigationBar(
                next: () {
                  context.push(UserPaths.serviceDetails3);
                },
              ),
            ),
          ),
        ],
      ),
      withBackgroundGradient: true,
    );
  }
}
