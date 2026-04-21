import 'package:design_system/design_system.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripePaymentService {
  static Future<void> init() async {
    final stripePublishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY'];
    //for apple pay
    Stripe.merchantIdentifier = dotenv.env['STRIPE_MERCHANT_IDENTIFIER'];
    Stripe.publishableKey = stripePublishableKey ?? '';
    await Stripe.instance.applySettings();
  }

  static Future<void> presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  static Future<void> initPaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret:
            'sk_test_51TNwR7LRLlVtHJNJhyJJC3cC5lVIwiY6sVRLnx792ecs7CSRX69PhUrnooajCYJoOgqXUtoqkvJfHE0LR4ZHG0As0073xbgxn2',
        merchantDisplayName: 'Yalla Come',
        style: ThemeMode.light,
        //TODO need merchant id for apple pay
        // applePay: const PaymentSheetApplePay(merchantCountryCode: 'SA'),
        googlePay: const PaymentSheetGooglePay(
          merchantCountryCode: 'US',
          currencyCode: 'USD', //
          testEnv: true,
        ),
        appearance: PaymentSheetAppearance(
          colors: PaymentSheetAppearanceColors(
            primary: UIColor.primary,
            background: Colors.white,
            componentBackground: Colors.white,
            componentBorder: UIColor.primary,
            componentText: Colors.black,
          ),
        ),
      ),
    );
  }
}
