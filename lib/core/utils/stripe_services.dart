import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/utils/api_keys.dart';
import 'package:payment/core/utils/api_services.dart';
import 'package:payment/features/checkout/data/models/stripe_models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:payment/features/checkout/data/models/stripe_models/payment_intent_input_model.dart';
import 'package:payment/features/checkout/data/models/stripe_models/payment_intent_model/payment_intent_model.dart';

class StripeServices {
  final ApiServices apiServices = ApiServices();

  /// Steps
  /// 1   Paymentintent Object    Create PaymentIntent (amount , currency, customerid)
  /// 2   createEphemeralKey
  /// 3   Init payment Sheet(MerchantDisplayName,paymentIntentClientSecret,EphemeralKeySecret)
  /// 4   Prenet Payment sheet
  /// Step 1
  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await apiServices.post(
      url:'https://api.stripe.com/v1/payment_intents', // From stripe Doc (paymentIntent)
      body: paymentIntentInputModel.toJson(), // toJson method to convert object to json shape (key : value)
      token: ApiKeys.stripeSecretKey, // store All keys in ApiKeys File and put it's Path in .gitignore file to secure it and not push it to github
      contentType: Headers.formUrlEncodedContentType,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data); // fromJson method to convert json shape to object (parsing)
    return paymentIntentModel;
  }

  /// Step 2
  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    var response = await apiServices.post(
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      body: {'customer': customerId},
      headers: {
        "Authorization": "Bearer ${ApiKeys.stripeSecretKey}",
        "Stripe-Version": "2023-10-16",
      },
      token: ApiKeys.stripeSecretKey,
      contentType: Headers.formUrlEncodedContentType,
    );
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }

  /// Step 3

  Future<void> initPaymentSheet({required paymentIntentClientSecret,required String ephemeralKeySecret,required String customerId}) async {
    // code of this method from Decoumentation
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName:
            'Ahmed Abdelgawad', // name of Service Provider (اسم اللي بيقدم الخدمة . هحط اي اسم وخلاص)
        paymentIntentClientSecret:
            paymentIntentClientSecret, // From PaymentIntent Object (ClientSecret attribute),
        customerEphemeralKeySecret: ephemeralKeySecret,
        customerId: customerId,
      ),
    );
  }

  /// Step 4
  Future<void> displayPaymentSheet() async {  // presentPaymentSheet
    await Stripe.instance.presentPaymentSheet();
  }

  /// additional Step (optional)  /// to make Process of payment in one method Only (by calling makePayment method) instead of calling 4 methods
  Future<void> makePayment(PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel); // call method of step 1
    var ephemeralKeyModel = await createEphemeralKey(customerId: paymentIntentInputModel.customerId!,); // call method of Step 2
    await initPaymentSheet(
      customerId: paymentIntentInputModel.customerId!,
      paymentIntentClientSecret: paymentIntentModel.clientSecret,
         ephemeralKeySecret: ephemeralKeyModel.secret.toString(),
      ); // call method of step 3
    await displayPaymentSheet(); // call method of step 4
  }
}
