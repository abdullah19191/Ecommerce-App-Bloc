part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();
}

class CheckoutLoading extends CheckoutState {
  @override
  List<Object?> get props => [];
}

class CheckoutLoaded extends CheckoutState {
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
  final Checkout checkout;
  CheckoutLoaded({
     this.fullName,
     this.products,
     this.deliveryFee,
     this.city,
     this.address,
     this.total,
     this.country,
     this.email,
     this.subTotal,
     this.zipcode,
  }):checkout = Checkout(fullName: fullName, products: products, deliveryFee: deliveryFee, city: city, address: address, total: total, country: country, email: email, subTotal: subTotal, zipcode: zipcode);

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
}
