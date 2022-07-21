import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_block/Models/checkout_model.dart';
import 'package:ecommerce_app_block/repositories/checkout/base_checkout_repository.dart';

class Checkoutrepository extends BaseCheckoutrepository{
  final FirebaseFirestore _firebaseFirestore;
  Checkoutrepository({FirebaseFirestore? firebaseFirestore}) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Future<void> addCheckout(Checkout checkout){
    return _firebaseFirestore.collection('checkout').add(checkout.toDocument());
  }
}