import 'package:bloc/bloc.dart';
import 'package:bn_website/features/home_screen/data/repository/home_screen_repo_impl.dart';
import 'package:meta/meta.dart';

import '../../data/data_source/home_screen_data_source.dart';
import '../../data/models/ProductModel.dart';
import '../../domain/entity/product_entity.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit() : super(GetProductsInitial());
  List<ProductModel> products = [];
  getProducts() async {
    emit(GetProductsLoading());
    HomeScreenRepoImpl homeScreenRepoImpl = HomeScreenRepoImpl(remoteDataSource: HomeScreenDataSource());
      final data = await homeScreenRepoImpl.getProducts();


      data.fold(
              (l) => emit(GetProductsError(l.message)),
              (r) => emit(GetProductsSuccess(r))

      );



  }
}
