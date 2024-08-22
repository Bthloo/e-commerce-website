part of 'get_products_by_categories_cubit.dart';

@immutable
sealed class GetProductsByCategoriesState {}

final class GetProductsByCategoriesInitial extends GetProductsByCategoriesState {}
final class GetProductsByCategoriesLoading extends GetProductsByCategoriesState {}
final class GetProductsByCategoriesSuccess extends GetProductsByCategoriesState {
  final List<ProductEntity> products;
  GetProductsByCategoriesSuccess(this.products);
}
final class GetProductsByCategoriesFailed extends GetProductsByCategoriesState {
  final String message;
  GetProductsByCategoriesFailed(this.message);
}