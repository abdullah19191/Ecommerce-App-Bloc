import '../../Models/checkout_model.dart';

abstract class  BaseCheckoutrepository {
  Future<void> addCheckout(Checkout checkout);
}