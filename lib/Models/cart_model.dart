import 'package:ecommerce_app_block/Models/product%20model.dart';
import 'package:ecommerce_app_block/Widgets/products.dart';
import 'package:equatable/equatable.dart';

class Cart extends  Equatable{
  final List<Product> products;
const Cart({this.products = const <Product>[]});
double get subtotal => products.fold(0, (total, current) => total + current.price);
String get subtotalString => subtotal.toStringAsFixed(2);

Map productQuantity(products){
  var quantity = Map();
  products.forEach((products){
    if(!quantity.containsKey(products)){
     quantity[products] = 1;
    }
    else {quantity[products] += 1;}
  });
    return quantity;
  }
double deliveryFee(subtotal) {
  if(subtotal >= 30.0){
    return 0.0;
  }else
    return 10.0;
}

String freeDelivery(subtotal){
  if(subtotal >=30.0){
    return 'You Have Free Delivery';
  }else {
    double missing = 30.0 - subtotal;
    return 'Add \$${missing.toStringAsFixed(2)} for Free Delivery';
  }
}

double total(subtotal,deliveryFee){
  return subtotal + deliveryFee(subtotal);
}
String get SubtotalString => subtotal.toStringAsFixed(2);
String get TotalString => total(subtotal,deliveryFee).toStringAsFixed(2);
String get deliverFeeString => deliveryFee(subtotal).toStringAsFixed(2);
String get FeeDeliveryString => freeDelivery(subtotal);


  @override
  // TODO: implement props
  List<Object?> get props => [products];
}