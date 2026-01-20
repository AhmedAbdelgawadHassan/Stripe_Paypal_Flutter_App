  import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment/core/utils/api_keys.dart';
import 'package:payment/features/checkout/data/models/paypal_models/amount%20model/amount_model.dart';
import 'package:payment/features/checkout/data/models/paypal_models/items_list_model/items_list_model.dart';
import 'package:payment/features/checkout/presentation/views/thankYou_view.dart';



void executePaypalMethod(
  BuildContext context,
  ({AmountModel amount, List<ItemsListModel> orders}) transactionsData,
) {    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeys.paypalClientId,
          secretKey: ApiKeys.paypalSecretKey,
          transactions: [
            {
              "amount": transactionsData.amount.toJson(),
              "description": "The payment transaction description.",
    
             "item_list": {
  "items": transactionsData.orders.first.items?.map((e) => e.toJson()).toList(),
},
            },
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pushAndRemoveUntil(
              context,
               MaterialPageRoute(builder: (context) => ThankyouView(),),
                (route) {
                  if(route.settings.name=='/'){      // it remove all views in stack except the home View (myCart View) and it's named is "/"
                    return true;
                  }
                  else 
                  {
                    return false;
                  }
                },);
          },
          onError: (error) {
            ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(error.toString())));
          Navigator.pop(context);
           Navigator.pop(context);
           },
          onCancel: () {
              ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Cancelled")));
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
