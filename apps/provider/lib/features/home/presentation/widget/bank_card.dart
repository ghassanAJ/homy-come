import 'dart:math';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:homy_provider/localization/files/providerTr.i69n.dart';
import 'package:util/util.dart';

class BankCard extends StatelessWidget {
  const BankCard({super.key});

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.sizeOf(context).height;
    final tr = context.loc<ProviderTr>();
    return Container(
      width: double.infinity,
      height: heightScreen * 0.18,

      decoration: BoxDecoration(
        color: const Color(0xFFADD8F7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final parentWidth = constraints.maxWidth;
          final parentHeight = constraints.maxHeight;

          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Positioned(
                  top: 2,
                  left: 2,
                  height: parentHeight * 0.3,
                  child: UIIamge(
                    assetPath: Assets.images.intersect1.path,

                    height: parentHeight * 0.3,
                  ),
                ),
                Positioned(
                  right: 1,
                  bottom: 2,

                  child: UIIamge(
                    assetPath: Assets.images.intersect.path,

                    height: parentHeight * 0.6,
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
                          UIText.h4('220,304 AED'),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: parentWidth * 0.1),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: parentWidth * 0.3,
                              height: parentWidth * 0.3,

                              child: Transform.rotate(
                                angle: pi / 2,
                                child: CircularProgressIndicator(
                                  value: 0.75,
                                  color: UIColor.background,

                                  strokeWidth: 12,
                                  backgroundColor: UIColor.bluepal.withAlpha(
                                    102,
                                  ),
                                  strokeCap: StrokeCap.round,
                                ),
                              ),
                            ),
                            UIText.labelCircleProgerss(
                              '75%',
                              color: UIColor.background,
                              fontFamily: UIFontFamily.almarai,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
