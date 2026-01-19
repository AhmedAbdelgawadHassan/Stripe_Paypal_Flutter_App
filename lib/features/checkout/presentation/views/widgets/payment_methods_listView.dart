import 'package:flutter/material.dart';
import 'package:payment/features/checkout/presentation/views/widgets/payment_method_item.dart';

class PaymentmethodsListview extends StatefulWidget {
  const PaymentmethodsListview({super.key, required this.updatePaymentMethod});
  final Function({required int index}) updatePaymentMethod;

  @override
  State<PaymentmethodsListview> createState() => _PaymentmethodsListviewState();
}

class _PaymentmethodsListviewState extends State<PaymentmethodsListview> {
  List<String> methodsItem = const [
    'assets/images/card.svg',
    'assets/images/paypal.svg',
  ];
  int selectedIndex = 0; // Vairable to select the items

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: methodsItem.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                widget.updatePaymentMethod(index: selectedIndex);
              },
              child: PaymentMethodItem(
                image: methodsItem[index],
                isActive:
                    selectedIndex ==index, // check if the index is equal to the selected index
              ),
            ),
          );
        },
      ),
    );
  }
}
