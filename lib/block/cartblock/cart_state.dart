part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}
class  CartLoading extends CartInitial {
  @override
  List<Object> get props => [];
}

class  CartLoaded extends CartInitial {
  final Cart cart;
  CartLoaded({this.cart = const Cart()});
  @override
  List<Object> get props => [cart];
}

class  CartError extends CartInitial {
  @override
  List<Object> get props => [];
}