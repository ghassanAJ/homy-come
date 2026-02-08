import 'package:flutter_svg/svg.dart';

import '../../../design_system.dart';

class AmountWithCurrencyWidget extends StatelessWidget {
  const AmountWithCurrencyWidget({
    super.key,
    required this.rewardAmount,
    this.color,
    this.style,
    this.withMinusSign = false,
    this.extraText = '',
  });

  final String rewardAmount;
  final Color? color;
  final TextStyle? style;
  final bool withMinusSign;

  final String extraText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (withMinusSign) ...[
          SizedBox(width: 5),
          Text(
            '- ',
            style: style ?? UI.text.h3.copyWith(color: UIColor.primary),
          ),
        ],
        SvgPicture.asset(
          'Assets.icons.aed', //TODO
          package: 'task',
          color: color ?? style?.color ?? UIColor.primary,
          width: style?.fontSize,
          height: style?.fontSize,
        ),
        SizedBox(width: 2),
        Text(
          rewardAmount + extraText,
          style: style ?? UI.text.h3.copyWith(color: UIColor.primary),
        ),
      ],
    );
  }
}
