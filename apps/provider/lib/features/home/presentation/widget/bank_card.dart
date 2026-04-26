import 'package:design_system/design_system.dart';
import 'package:homy_provider/features/home/presentation/widget/finacial_progress_indecator_widget.dart';
import 'package:homy_provider/localization/files/providerTr.i69n.dart';
import 'package:util/util.dart';

class BankCard extends StatelessWidget {
  const BankCard({super.key});

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.sizeOf(context).height;
    final tr = context.loc<ProviderTr>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: UI.spacing.lg),
      child: Container(
        width: double.infinity,
        height: heightScreen * 0.18,

        decoration: BoxDecoration(
          color: const Color(0xFFADD8F7),
          borderRadius: BorderRadius.circular(25),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final parentWidth = constraints.maxWidth;
            final parentHeight = constraints.maxHeight;

            return Stack(
              children: [
                Positioned(
                  top: 2,
                  left: 2,
                  height: parentHeight * 0.3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),

                    child: UIIamge(
                      assetPath: Assets.images.intersect1.path,

                      height: parentHeight * 0.3,
                    ),
                  ),
                ),
                Positioned(
                  right: 1,
                  bottom: 2,

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: UIIamge(
                      assetPath: Assets.images.intersect.path,

                      height: parentHeight * 0.6,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: UI.spacing.lg,
                    horizontal: UI.spacing.lg,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UIText.h4(
                            tr.title.finacial,
                            color: UIColor.background,
                            fontSize: 20,
                          ),
                          SizedBox(height: UI.spacing.sm),

                          UIPriceText(text: UIText.h4('20,304')),
                        ],
                      ),
                      FinancialProgressIndicator(parentWidth: parentWidth),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
