part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}


class CartStarted extends CartEvent {
  // TODO: implement props
  @override
  List<Object?> get props => throw UnimplementedError();
}
class CartProductAdded extends CartEvent{
  final Product product;
  const CartProductAdded(this.product);
  @override
  // TODO: implement props
  List<Object?> get props => [product];
}

class CartProductRemoved extends CartEvent{
  final Product product;
  const CartProductRemoved(this.product);
  @override
  // TODO: implement props
  List<Object?> get props => [product];
}