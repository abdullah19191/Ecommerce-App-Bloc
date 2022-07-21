part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class LoadCategories extends CategoryEvent{

  @override
  List<Object?> get props => throw UnimplementedError();
}

class UpdateCategories extends CategoryEvent{
  final List<Category> categories;

  UpdateCategories(this.categories);

  @override
  List<Object?> get props => [categories];
}