import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/functions/excute_stripe_method.dart';
import 'package:payment/core/functions/execute_paypal_method.dart';
import 'package:payment/core/functions/get_transaction_data.dart';
import 'package:payment/features/checkout/presentation/manager/cubits/payment_cubit.dart';
import 'package:payment/features/checkout/presentation/manager/cubits/payment_states.dart';
import 'package:payment/features/checkout/presentation/views/thankYou_view.dart';
import 'package:payment/features/checkout/presentation/views/widgets/custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key, required this.isPaypal});
  final bool isPaypal;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      builder: (context, state) {
        return CustomButton(
          title: 'Continue',
          isLoading: state is PaymentLoading ? true : false,
          onTap: () {

            if(isPaypal){
                var transactionsData =getTransactionData(); // call method in this variable
            executePaypalMethod(context, transactionsData);
            }
            else {
            executeStripeMethod(context);
         
            
           } },
        );
      },
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ThankyouView()),
          );
        } else if (state is PaymentFailure) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
    );

    
  }

  



}
