part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchLoading extends SearchState {}
final class SearchSuccess extends SearchState {
  final List<ProductEntity>? searchResults;

  SearchSuccess(this.searchResults);
}
final class SearchFailure extends SearchState {
  final String error;

  SearchFailure(this.error);
}