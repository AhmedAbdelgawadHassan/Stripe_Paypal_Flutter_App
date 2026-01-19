class DetailsModel {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  DetailsModel({
    required this.subtotal,
    required this.shipping,
    required this.shippingDiscount,
  });

  factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
    subtotal: json['subtotal'] as String?,
    shipping: json['shipping'] as String?,
    shippingDiscount: json['shipping_discount'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'subtotal': subtotal,
    'shipping': shipping,
    'shipping_discount': shippingDiscount,
  };
}
