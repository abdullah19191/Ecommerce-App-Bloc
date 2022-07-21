import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Models/category model.dart';
import '../../repositories/category/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;
  CategoryBloc({ required CategoryRepository categoryRepository}) : _categoryRepository = categoryRepository,
        super(CategoryLoading()) {
    on<LoadCategories>(_onLoadCategories);
    on<UpdateCategories>(_onUpdateCategories);
  }
  void _onLoadCategories(event, Emitter<CategoryState> emit){
    _categorySubscription?.cancel();
    _categorySubscription = _categoryRepository.getAllCategory().listen((categories)=> add(UpdateCategories(categories)));
  }

  void _onUpdateCategories(UpdateCategories event, Emitter<CategoryState> emit){
    emit(CategoryLoaded(categories: event.categories));
  }
}
