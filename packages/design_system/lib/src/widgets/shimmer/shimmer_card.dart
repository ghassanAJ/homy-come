import '../../../design_system.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Shimmer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Image shimmer
                  ShimmerBox(width: 80, height: 80, radius: 12),
                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title skeleton
                        ShimmerBox(
                          width: double.infinity,
                          height: 16,
                          radius: 6,
                        ),
                        const SizedBox(height: 8),

                        Row(
                          children: [
                            // Reward capsule
                            ShimmerBox(width: 60, height: 22, radius: 8),
                            const Spacer(),
                            // Due label
                            ShimmerBox(width: 50, height: 16, radius: 6),
                          ],
                        ),

                        const SizedBox(height: 8),
                        // Additional info
                        ShimmerBox(width: 120, height: 14, radius: 6),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Footer buttons skeleton
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  ShimmerBox(width: 80, height: 36, radius: 8),
                  const SizedBox(width: 8),
                  ShimmerBox(width: 80, height: 36, radius: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
