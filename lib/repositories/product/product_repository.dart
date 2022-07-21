import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_block/Models/product%20model.dart';
import 'package:ecommerce_app_block/repositories/product/base_product_repository.dart';

class ProductRepository extends baseProductRepository{
  final FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Stream<List<Product>> getAllProducts() {
      return _firebaseFirestore.collection('products').snapshots().map((snapshot){
        return snapshot.docs.map((doc) => Product.GetSnapshot(doc)).toList();
      });
  }
}