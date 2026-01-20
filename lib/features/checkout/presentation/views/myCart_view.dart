import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:payment/core/utils/appStyles.dart';
import 'package:payment/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:payment/features/checkout/presentation/manager/cubits/payment_cubit.dart';
import 'package:payment/features/checkout/presentation/manager/cubits/payment_states.dart';
import 'package:payment/features/checkout/presentation/views/widgets/custom_button.dart';
import 'package:payment/features/checkout/presentation/views/widgets/order_info_item.dart';
import 'package:payment/features/checkout/presentation/views/widgets/payment_methods_botton_sheet.dart';
import 'package:payment/features/checkout/presentation/views/widgets/total_price_item.dart';

class MycartView extends StatefulWidget {
  const MycartView({super.key});

  @override
  State<MycartView> createState() => _MycartViewState();
}

class _MycartViewState extends State<MycartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Center(
          child: SvgPicture.asset('assets/images/icons/arrow.svg', width: 30),
        ),
        title: Text('My Cart', style: Appstyles.style25),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Gap(20),
            Expanded(
              child: Image(image: AssetImage('assets/images/orderImage.png')),
            ),
            Gap(40),
            Orderinfoitem(title: 'Order Subtitle', value: '\$950'),
            Gap(5),
            Orderinfoitem(title: 'Discount', value: '\$0'),
            Gap(5),
            Orderinfoitem(title: 'Shiping', value: '\$10'),
            Divider(color: Colors.grey, height: 34, indent: 15, endIndent: 15),
            TotalPriceItem(title: 'Total', value: '\$1000'),
            Gap(20),
            CustomButton(
              title: 'Complete Payment',
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BlocProvider(
                      create: (context) =>
                          PaymentCubit(PaymentInitial(), CheckoutRepoImpl()),
                      child: PaymentMethodsBottonSheet(),
                    );
                  },
                );
              },
            ),
            Gap(30),
          ],
        ),
      ),
    );
  }
}
