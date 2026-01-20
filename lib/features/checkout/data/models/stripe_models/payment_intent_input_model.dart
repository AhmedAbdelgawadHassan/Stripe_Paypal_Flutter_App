class PaymentIntentInputModel // make the input of metho (amount,currency) as A Model
{
  final String amount;
  final String currency;
  final String? customerId;

  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
    this.customerId,
  });

  toJson() { // Method to convert the model to json to send it to the api (Request body)
    return {
      "amount":
          "${amount}00", // by Default Stripe Devided the Amount / 100 so i have to multiply mount by 100
      "currency": currency,
      "customer": customerId,
    };
  }
}
