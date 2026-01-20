import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/features/checkout/data/models/stripe_models/payment_intent_input_model.dart';
import 'package:payment/features/checkout/presentation/manager/cubits/payment_cubit.dart';

void executeStripeMethod(BuildContext context) {
     PaymentIntentInputModel paymentIntentInputModel =
        PaymentIntentInputModel(
          amount: '1000',
          currency: 'USD',
          customerId: 'cus_TlvnmjEFYybI8g',
        );
    BlocProvider.of<PaymentCubit>(context).makePayment(paymentIntentInputModel: paymentIntentInputModel);  // Trigger makePayment method in PaymentCubit
  }