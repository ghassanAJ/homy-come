import '../../../design_system.dart';

class UIPriceText extends StatelessWidget {
  const UIPriceText({
    super.key,
    required this.text,
    this.currency = 'AED',
    this.currencySize = 14,
  });

  final UIText text;
  final double currencySize;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _CurrencyIcon(
          color: text.color ?? UIColor.textPrimary,
          currency: currency,
          size: currencySize,
        ),
        SizedBox(width: 1),
        text,
      ],
    );
  }
}

class _CurrencyIcon extends StatelessWidget {
  const _CurrencyIcon({
    required this.currency,
    required this.size,
    required this.color,
  });

  final String currency;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return switch (currency) {
      'AED' => Image.asset(
        'assets/icons/aed.svg',
        package: 'ui',
        color: color,
        width: size,
        height: size,
        fit: BoxFit.contain,
      ),
      _ => throw UnimplementedError('Currency icon not found for $currency'),
    };
  }
}
