import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:payment/core/utils/appStyles.dart';

class Cardinfo extends StatelessWidget {
  const Cardinfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/masterCard.png', height: 20),
          Gap(20),
          Column(
            children: [
              Text('Credit Card', style: Appstyles.styleBold18),
              Gap(5),
              Text('Mastercard **78', style: Appstyles.style18),
            ],
          ),
        ],
      ),
    );
  }
}
