import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Models/cart_model.dart';
import '../../Models/checkout_model.dart';
import '../../Models/product model.dart';
import '../../repositories/checkout/checkout_repository.dart';
import '../cartblock/cart_bloc.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final Checkoutrepository _checkoutRepository;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _checkoutSubscription;

  CheckoutBloc({
    required Checkoutrepository checkoutRepository,
    required CartBloc cartBloc,
  })
      : _cartBloc = cartBloc,
        _checkoutRepository = checkoutRepository,
        super(cartBloc.state is CartLoaded ? CheckoutLoaded(
          products: (cartBloc.state as CartLoaded).cart.products,
          subTotal: (cartBloc.state as CartLoaded).cart.subtotalString,
          deliveryFee: (cartBloc.state as CartLoaded).cart.deliverFeeString,
          total: (cartBloc.state as CartLoaded).cart.TotalString
      ) : CheckoutLoading()) {
    _cartSubscription = cartBloc.stream.listen((state) {
      if (state is CartLoaded) {
        add(UpdateCheckout(cart: state.cart));
      }
    });
    on<UpdateCheckout>(_onUpdateCheckout);
    on<ConfirmCheckout>(_onConfirmCheckout);
  }
  void _onUpdateCheckout(UpdateCheckout event, Emitter<CheckoutState>emit){
    final state = this.state;
     if(state is CheckoutLoaded){
       emit(CheckoutLoaded(
         email: event.email ?? state.email,
         products: event.cart?.products ?? state.products,
         country: event.country ?? state.country,
         deliveryFee: event.cart?.deliverFeeString ?? state.deliveryFee,
         subTotal: event.cart?.subtotalString ?? state.subTotal,
         fullName: event.fullName ?? state.fullName,
         total: event.cart?.TotalString ?? state.total,
         zipcode: event.zipcode ?? state.zipcode,
         address: event.address?? state.address,
         city: event.city ?? state.city,
       ));
     }
  }

  void _onConfirmCheckout(ConfirmCheckout event,Emitter<CheckoutState> emit) async{
    _checkoutSubscription?.cancel();
    if(state is CheckoutLoaded){
      try{
        await _checkoutRepository.addCheckout(event.checkout);
        emit(CheckoutLoading());
      }catch (_){}
    }
  }
}