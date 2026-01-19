import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/features/checkout/data/repos/checkout_repo.dart';
import 'package:payment/features/checkout/presentation/manager/cubits/payment_states.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(super.initialState, this.checkoutRepo);
  final CheckoutRepo checkoutRepo;

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(PaymentLoading());

    var data = await checkoutRepo.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    data.fold(
      //
      (l) => emit(PaymentFailure(errorMessage: l.toString())),
      (r) => emit(PaymentSuccess()),
    );
  }
}
