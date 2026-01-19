import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/utils/api_keys.dart';
import 'package:payment/features/checkout/presentation/views/myCart_view.dart';

void main() {
  Stripe.publishableKey = ApiKeys.striePublishableKey;
  runApp(DevicePreview(
    enabled: false,
    builder:(context) => Checkout()));
}

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: MycartView(),
    );
  }
}

///Main Steps for Stripe
/// PaymentIntentModel create paymentIntent(amount, currency, customerId)
/// KeySecret createEphemeralKey(customerId)
/// initPaymentSheet(MerchantDisplayName,paymentIntentClientSecret,EphemeralKeySecret)
/// presentPaymentSheet()
