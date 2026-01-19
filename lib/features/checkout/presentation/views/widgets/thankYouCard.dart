import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:payment/core/utils/appStyles.dart';
import 'package:payment/features/checkout/presentation/views/widgets/barcode_item.dart';
import 'package:payment/features/checkout/presentation/views/widgets/cardInfo.dart';
import 'package:payment/features/checkout/presentation/views/widgets/payment_info_item.dart';
import 'package:payment/features/checkout/presentation/views/widgets/total_price_item.dart';

class Thankyoucard extends StatelessWidget {
  const Thankyoucard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFD9D9D9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 75, left: 20, right: 20),
        child: Column(
          children: [
            Text('Thank You!', style: Appstyles.style25),
            Gap(15),
            Text('Your transaction was successful', style: Appstyles.style20),
            Gap(45),
            PaymentInfoItem(title: 'Date', value: '01/24/2023'),
            Gap(25),
            PaymentInfoItem(title: 'Time', value: '10:15 AM'),
            Gap(25),
            PaymentInfoItem(title: 'To', value: 'Sam Louis'),
            Divider(thickness: 1.5, height: 60, color: Colors.grey.shade500),
            TotalPriceItem(title: 'Total', value: '\$50.97'),
            Gap(30),
            Cardinfo(),
            Gap(110),
            BarcodeItem(),
          ],
        ),
      ),
    );
  }
}
