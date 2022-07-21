import 'package:ecommerce_app_block/Models/product%20model.dart';
import 'package:equatable/equatable.dart';

class Checkout extends Equatable{
final String? fullName;
final String? email;
final String? address;
final String? city;
final String? country;
final String? zipcode;
final String? subTotal;
final String? deliveryFee;
final String? total;
final List<Product>? products;

Checkout({
  required this.fullName,
  required this.products,
  required this.deliveryFee,
  required this.city,
  required this.address,
  required this.total,
  required this.country,
  required this.email,
  required this.subTotal,
  required this.zipcode,
});

  @override
  List<Object?> get props => [
    fullName,
    email,
    address,
    deliveryFee,
    subTotal,
    total,
    zipcode,
    country,
    city,
    products
  ];

  Map<String,Object> toDocument(){
    Map customerAddress = Map();
    customerAddress['address'] = address;
    customerAddress['fullName'] = fullName;
    customerAddress['email'] = email;
    customerAddress['zipcode']= zipcode;
    customerAddress['city'] = city;
    customerAddress['country'] = country;
    customerAddress['total'] = total;
    customerAddress['subTotal'] = subTotal;
    customerAddress['deliveryFee']= deliveryFee;
    return{
      'customerAddress' : customerAddress,
      'customerName' : fullName!,
      'customerEmail' : email!,
      'products': products!.map((products) => products.name).toList(),
      'subtotal' : subTotal!,
      'deliveryFee': deliveryFee!,
      'total': total!
    };
  }

}