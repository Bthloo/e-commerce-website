import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../../data/data_source/home_screen_data_source.dart';
import '../../../data/repository/home_screen_repo_impl.dart';
import '../../../domain/entity/product_entity.dart';
part 'special_products_state.dart';

class SpecialProductsCubit extends Cubit<SpecialProductsState> {
  SpecialProductsCubit() : super(SpecialProductsInitial());

  getSpecialProducts() async {
    emit(SpecialProductsLoading());
    HomeScreenRepoImpl homeScreenRepoImpl = HomeScreenRepoImpl(remoteDataSource: HomeScreenDataSource());
    final data = await homeScreenRepoImpl.getSpecialProducts();
    data.fold(
            (l) => emit(SpecialProductsError(l.message)),
            (r) => emit(SpecialProductsSuccess(r))
    );
  }
}