import 'package:booking/booking.dart';

class HomeDivider extends StatelessWidget {
  const HomeDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        color: UIColor.border,
        height: 10,
        width: double.infinity,
      ),
    );
  }
}
