import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/errors/failures.dart';
import 'package:payment/core/utils/stripe_services.dart';
import 'package:payment/features/checkout/data/models/stripe_models/payment_intent_input_model.dart';
import 'package:payment/features/checkout/data/repos/checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  @override
  Future<Either<Failure, void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel,}) async {
    final StripeServices stripeServices = StripeServices();
    try {
      await stripeServices.makePayment(paymentIntentInputModel);
      return right(
        null,
      ); // right means success (does not return any value -->null)
    }
     on StripeException catch(e)
     {
      return left(Failure(message: e.error.message??"oops there was an error"));
     }
    
  }
}
