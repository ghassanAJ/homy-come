import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ShimmerScheduleOrderCard extends StatelessWidget {
  const ShimmerScheduleOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        UI.spacing.md,
        UI.spacing.xs,
        UI.spacing.md,
        UI.spacing.sm,
      ),
      margin: const EdgeInsets.only(bottom: 16),
      width: double.infinity,

      decoration: BoxDecoration(
        color: UIColor.white,
        borderRadius: BorderRadius.circular(UI.radius.lg),
        boxShadow: UI.shadows.sm,
      ),
      child: Shimmer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                      Row(children: [
                          ShimmerBox(
                  width: UI.sizes.avatarLg,
                  height: UI.spacing.md,
                  radius: UI.radius.sm,
                ),
                SizedBox(height: UI.spacing.xxs),
                ShimmerBox(
                  width: 32,
                  height: UI.spacing.md,
                  radius: 36,
                ),
                      ],),
                      SizedBox(height:  UI.spacing.md),
                   Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerBox(
                  width: UI.sizes.avatarLg,
                  height: UI.spacing.md,
                  radius: UI.radius.sm,
                ),
                SizedBox(height: UI.spacing.xxs),
                ShimmerBox(
                  width: UI.sizes.bottomNavigationBarHeight,
                  height: UI.spacing.md,
                  radius: UI.radius.sm,
                ),
              ],
            ),
            SizedBox(height: UI.spacing.md),
            //cleaner shimmer
            Row(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ShimmerBox(
                      width: UI.sizes.iconXl,
                      height: UI.sizes.iconXl,
                      radius: 99,
                      shape: BoxShape.circle,
                    ),
                    SizedBox(width: UI.spacing.sm),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerBox(
                          width: UI.sizes.bottomNavigationBarHeight,
                          height: UI.spacing.md,
                          radius: UI.radius.sm,
                        ),
                        SizedBox(height: UI.spacing.xxs),
                        ShimmerBox(
                          width: UI.sizes.avatarLg,
                          height: UI.spacing.md,
                          radius: UI.radius.sm,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: UI.spacing.md),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerBox(
                        width: UI.sizes.avatarLg,
                        height: UI.spacing.md,
                        radius: UI.radius.sm,
                      ),
                      SizedBox(height: UI.spacing.xxs),
                      ShimmerBox(
                        width: UI.sizes.bottomNavigationBarHeight,
                        height: UI.spacing.md,
                        radius: UI.radius.sm,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerBox(
                        width: UI.sizes.avatarLg,
                        height: UI.spacing.md,
                        radius: UI.radius.sm,
                      ),
                      SizedBox(height: UI.spacing.xxs),
                      ShimmerBox(
                        width: UI.sizes.bottomNavigationBarHeight,
                        height: UI.spacing.md,
                        radius: UI.radius.sm,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: UI.spacing.lg),
     
            SizedBox(height: UI.spacing.lg),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShimmerBox(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    height: UI.spacing.xl,
                    radius: UI.radius.sm,
                  ),
                  SizedBox(width: UI.spacing.md),
                  ShimmerBox(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    height: UI.spacing.xl,
                    radius: UI.radius.sm,
                  ),
                ],
              ),
            ),
          ], //////////////////////
        ),
      ),
    );
  }
}
