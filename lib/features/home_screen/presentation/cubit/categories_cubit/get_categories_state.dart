part of 'get_categories_cubit.dart';

@immutable
sealed class GetCategoriesState {}

final class GetCategoriesInitial extends GetCategoriesState {}
final class GetCategoriesLoading extends GetCategoriesState {}
final class GetCategoriesSuccess extends GetCategoriesState {
  final List<CategoryModel> categories;
  GetCategoriesSuccess(this.categories);
}
final class GetCategoriesFailed extends GetCategoriesState {
  final String message;
  GetCategoriesFailed(this.message);
}
