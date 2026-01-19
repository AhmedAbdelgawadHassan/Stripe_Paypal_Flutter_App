import 'package:flutter/material.dart';
import 'package:payment/core/utils/appStyles.dart';

class PaymentInfoItem extends StatelessWidget {
  const PaymentInfoItem({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Appstyles.style18),
        Text(value, style: Appstyles.styleBold18),
      ],
    );
  }
}
