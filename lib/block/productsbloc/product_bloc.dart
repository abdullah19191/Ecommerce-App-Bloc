import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_block/block/category/category_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Models/product model.dart';
import '../../repositories/product/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription?  _productSubscription;
  ProductBloc({required ProductRepository productRepository}) : _productRepository = productRepository, super(ProductLoading()) {
    on<LoadProduct>(_LoadProduct);
    on<UpdateProduct>(_UpdateProduct);
  }
  void _LoadProduct(event, Emitter<ProductState> emit){
    _productSubscription?.cancel();
  _productSubscription = _productRepository.getAllProducts().listen((products)=> add(UpdateProduct(products)));
  }

  void _UpdateProduct(UpdateProduct event, Emitter<ProductState> emit){
   emit(ProductLoaded(products: event.products));
  }

}
