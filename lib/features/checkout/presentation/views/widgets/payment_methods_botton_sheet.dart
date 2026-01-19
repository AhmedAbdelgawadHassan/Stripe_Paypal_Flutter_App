import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart' show Gap;
import 'package:payment/features/checkout/presentation/views/widgets/custom_button_bloc_consumer.dart';
import 'package:payment/features/checkout/presentation/views/widgets/payment_methods_listView.dart';

class PaymentMethodsBottonSheet extends StatefulWidget {
  const PaymentMethodsBottonSheet({super.key});

  @override
  State<PaymentMethodsBottonSheet> createState() => _PaymentMethodsBottonSheetState();
}

class _PaymentMethodsBottonSheetState extends State<PaymentMethodsBottonSheet> {
  bool isPaypal=false;
  updatePaymentMethod({required int index}){
 if(index==0){
  isPaypal=false;
 }
 else{
  isPaypal=true;
 }
 setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentmethodsListview(
            updatePaymentMethod: updatePaymentMethod
          ),
          Gap(30),
          CustomButtonBlocConsumer(
            isPaypal: isPaypal,
          ),
        ],
      ),
    );
  }
}
