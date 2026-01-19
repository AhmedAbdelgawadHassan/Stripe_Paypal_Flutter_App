import 'package:flutter/material.dart';
import 'package:payment/core/utils/appStyles.dart';

class BarcodeItem extends StatelessWidget {
  const BarcodeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image(image: AssetImage('assets/images/barcode.png'), height: 70),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Color(0xff33A652)),
          ),
          child: Text(
            'PAID',
            style: Appstyles.style25.copyWith(color: Colors.green),
          ),
        ),
      ],
    );
  }
}
