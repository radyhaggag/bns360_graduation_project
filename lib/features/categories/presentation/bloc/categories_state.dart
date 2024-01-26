part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class GetCategoriesLoadingState extends CategoriesState {}

class GetCategoriesSuccessState extends CategoriesState {
  final List<CategoryEntity> categories;

  const GetCategoriesSuccessState({required this.categories});
}

class GetCategoriesErrorState extends CategoriesState {
  final String message;

  const GetCategoriesErrorState({required this.message});
}
