  import 'package:payment/features/checkout/data/models/amount%20model/amount_model.dart';
import 'package:payment/features/checkout/data/models/amount%20model/details_model.dart';
import 'package:payment/features/checkout/data/models/items_list_model/item.dart';
import 'package:payment/features/checkout/data/models/items_list_model/items_list_model.dart';

({AmountModel amount, List<ItemsListModel> orders}) getTransactionData() {    // method return more than one data type
    var amount = AmountModel(
      total: "100",
      currency: "USD",
      details: DetailsModel(
        subtotal: "100",
        shipping: "0",
        shippingDiscount: 0,
      ),
    );

    List<ItemsListModel> orderItems = [
      ItemsListModel(
        items: [
          Item(
            //40
            name: "Apple",
            quantity: 4,
            price: '10',
            currency: "USD",
          ),
          Item(
            //60
            name: "Pineapple",
            quantity: 5,
            price: '12',
            currency: "USD",
          ),
        ],
      ),
    ];
    return (
      amount: amount,
      orders: orderItems,
    ); // Return more than one return type
  }