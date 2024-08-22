import 'package:bloc/bloc.dart';
import 'package:bn_website/features/home_screen/domain/entity/product_entity.dart';
import 'package:meta/meta.dart';

import '../../../data/data_source/home_screen_data_source.dart';
import '../../../data/models/ProductModel.dart';
import '../../../data/repository/home_screen_repo_impl.dart';

part 'get_products_by_categories_state.dart';

class GetProductsByCategoriesCubit extends Cubit<GetProductsByCategoriesState> {
  GetProductsByCategoriesCubit() : super(GetProductsByCategoriesInitial());
  getProductsByCategory({required String category}) async {
    emit(GetProductsByCategoriesLoading());
    HomeScreenRepoImpl homeScreenRepoImpl = HomeScreenRepoImpl(remoteDataSource: HomeScreenDataSource());
    final data = await homeScreenRepoImpl.getProductsByCategory(category: category);
    data.fold(
            (l) => emit(GetProductsByCategoriesFailed(l.message)),
            (r) => emit(GetProductsByCategoriesSuccess(r))
    );
  }
}
