import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_block/Models/category%20model.dart';

import 'base_category_repository.dart';

class CategoryRepository extends baseCategoryRepository{
  final FirebaseFirestore _firebaseFirestore;

  CategoryRepository({FirebaseFirestore? firebaseFirestore})
  : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Category>> getAllCategory() {
     return  _firebaseFirestore.collection('categories').snapshots().map((snapshot) {
       return snapshot.docs.map((doc) => Category.GetSnapshots(doc)).toList();
     });
  }

}