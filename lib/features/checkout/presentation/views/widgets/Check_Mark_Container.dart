import 'package:flutter/material.dart';

class CheckMarkContainer extends StatelessWidget {
  const CheckMarkContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0XFFD9D9D9),
      ),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Color(0xff33A652),
        child: Icon(Icons.check, size: 70, color: Colors.white),
      ),
    );
  }
}
