import 'package:bloc/bloc.dart';
import 'package:bn_website/features/home_screen/data/repository/home_screen_repo_impl.dart';
import 'package:meta/meta.dart';
import '../../../data/data_source/home_screen_data_source.dart';
import '../../../data/models/categoty_model.dart';


part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit() : super(GetCategoriesInitial());
  getCategories() async {
    emit(GetCategoriesLoading());
   HomeScreenRepoImpl homeScreenRepoImpl = HomeScreenRepoImpl(remoteDataSource: HomeScreenDataSource());
    final data = await homeScreenRepoImpl.getCategories();
    data.fold(
            (l) => emit(GetCategoriesFailed(l.message)),
            (r) => emit(GetCategoriesSuccess(r))
    );
  }
}
