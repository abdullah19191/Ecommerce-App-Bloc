import 'package:ecommerce_app_block/Models/product%20model.dart';



abstract class baseProductRepository {
  Stream<List<Product>> getAllProducts();
}