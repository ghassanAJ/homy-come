import '../../../design_system.dart';

class ShimmerBox extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color? color;
  final BoxShape? shape;
  final BoxBorder? border;

  const ShimmerBox({
    super.key,
    required this.width,
    required this.height,
    required this.radius,
    this.color,
    this.border,
    this.shape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration:
          shape == BoxShape.circle
              ? BoxDecoration(
                color: color ?? UIColor.white,
                shape: BoxShape.circle,
                border: border,
              )
              : BoxDecoration(
                color: color ?? UIColor.white,
                border: border,
                borderRadius: BorderRadius.circular(radius),
              ),
    );
  }
}

class Shimmer extends StatefulWidget {
  final Widget child;
  const Shimmer({super.key, required this.child});

  @override
  State<Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              colors: [
                UIColor.neutral100,
                UIColor.neutral25,
                UIColor.white.withOpacity(0.9), //TODO
              ],
              stops: const [0.2, 0.5, 0.8],
              begin: Alignment(-1 - 2 * _controller.value, 0),
              end: Alignment(1 + 2 * _controller.value, 0),
            ).createShader(rect);
          },
          blendMode: BlendMode.srcATop,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
