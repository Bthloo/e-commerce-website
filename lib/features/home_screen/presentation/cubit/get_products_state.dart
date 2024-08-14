part of 'get_products_cubit.dart';

@immutable
sealed class GetProductsState {}

final class GetProductsInitial extends GetProductsState {}
final class GetProductsLoading extends GetProductsState {}
final class GetProductsSuccess extends GetProductsState {
  final List<ProductEntity> products;
  GetProductsSuccess(this.products);
}
final class GetProductsError extends GetProductsState {
  final String error;
  GetProductsError(this.error);
}
