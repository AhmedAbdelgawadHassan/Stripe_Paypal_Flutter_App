import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.isActive,
    required this.image,
  });
  final bool isActive;
  final String image;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      // used Animated Container instead of Container becuase Animated Conatiner gives some Nice Animation
      duration: Duration(milliseconds: 300),
      width: 100,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: isActive ? Colors.green : Colors.black,
          width: isActive ? 3 : 1.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SvgPicture.asset(image, height: 30),
    );
  }
}
