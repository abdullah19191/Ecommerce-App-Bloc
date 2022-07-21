part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}

class  ProductLoading extends ProductInitial {
  @override
  List<Object> get props => [];
}

class  ProductLoaded extends ProductInitial {
  final List<Product> products;

  ProductLoaded({this.products = const<Product>[]});

  @override
  List<Object> get props => [products];
}

