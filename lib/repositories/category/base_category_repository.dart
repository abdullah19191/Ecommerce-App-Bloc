import '../../Models/category model.dart';

abstract class baseCategoryRepository {
  Stream<List<Category>> getAllCategory();
}