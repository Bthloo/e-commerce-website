part of 'special_products_cubit.dart';

@immutable
sealed class SpecialProductsState {}

final class SpecialProductsInitial extends SpecialProductsState {}
final class SpecialProductsLoading extends SpecialProductsState {}
final class SpecialProductsSuccess extends SpecialProductsState {
  final List<ProductEntity> products;
  SpecialProductsSuccess(this.products);
}
final class SpecialProductsError extends SpecialProductsState {
  final String message;
  SpecialProductsError(this.message);
}
