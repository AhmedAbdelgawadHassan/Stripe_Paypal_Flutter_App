import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/features/checkout/presentation/views/widgets/Check_Mark_Container.dart';
import 'package:payment/features/checkout/presentation/views/widgets/thankYouCard.dart';

class ThankyouView extends StatelessWidget {
  const ThankyouView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Center(
              child: SvgPicture.asset(
                'assets/images/icons/arrow.svg',
                width: 30,
              ),
            ),
          ),
        ),
        body: Transform.translate(
          // this widget is to move the container up to cut the AppBar (widgets move the widgets on x or y axis)
          offset: Offset(0, -5), // moving in x and y axis
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Thankyoucard(), //big container
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.55,
                  left: -20,
                  child: drawCircle(40, Colors.white),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.55,
                  right: -20,
                  child: drawCircle(40, Colors.white),
                ),
                Positioned(
                  top: -40,
                  left: 0,
                  right: 0,
                  child: CheckMarkContainer(),
                ),
                Positioned(
                  top:
                      MediaQuery.of(context).size.height * 0.55 +
                      20, // to make it in middle of circles
                  left: 35,
                  right: 35,
                  child: DottedLine(
                    // use Dotted Line Package to can draw dotted line
                    dashLength: 6,
                    dashGapLength: 5,
                    lineThickness: 2,
                    dashColor: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Container drawCircle(double raduis, Color color) // Method Draws a Circle
{
  return Container(
    width: raduis,
    height: raduis,
    decoration: BoxDecoration(shape: BoxShape.circle, color: color),
  );
}
