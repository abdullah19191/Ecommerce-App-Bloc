import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_block/Models/product%20model.dart';
import 'package:equatable/equatable.dart';

import '../../Models/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartStarted>(_onCartload);
    on<CartProductAdded>(_onAddProduct);
    on<CartProductRemoved>(_onRemoveProduct);
  }
  Future<void> _onCartload(event,Emitter<CartState> emit) async {
     emit(CartLoading());
     try{
       await Future<void>.delayed(const Duration(seconds: 1));
       emit(CartLoaded());
     }catch(_){
       emit(CartError());
     }
  }
  void _onAddProduct(CartProductAdded event,Emitter<CartState> emit){
    final state = this.state;
    if(state is CartLoaded){
      try{
        emit(CartLoaded(cart: Cart(products: List.from(state.cart.products)..add(event.product))));
      }on Exception{
      emit(CartError());
      }
    }
  }
  void _onRemoveProduct(CartProductRemoved event,Emitter<CartState> emit){
    final state = this.state;
    if(state is CartLoaded){
      try{
        emit(CartLoaded(cart: Cart(products: List.from(state.cart.products)..remove(event.product))));
      }on Exception{
        emit(CartError());
      }
    }
  }
}
