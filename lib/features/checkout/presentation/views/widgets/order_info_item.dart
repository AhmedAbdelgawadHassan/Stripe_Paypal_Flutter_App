import 'package:flutter/material.dart';
import 'package:payment/core/utils/appStyles.dart';

class Orderinfoitem extends StatelessWidget {
  const Orderinfoitem({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: Appstyles.style18),
        Spacer(),
        Text(value, style: Appstyles.style18),
      ],
    );
  }
}
