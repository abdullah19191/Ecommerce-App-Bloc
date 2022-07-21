part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}

class  CategoryLoading extends CategoryInitial {
  @override
  List<Object> get props => [];
}

class  CategoryLoaded extends CategoryInitial {
  final List<Category> categories;

  CategoryLoaded({this.categories = const<Category>[]});

  @override
  List<Object> get props => [categories];
}
