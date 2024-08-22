import 'package:bn_website/features/home_screen/domain/entity/product_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_source/home_screen_data_source.dart';
import '../../../data/repository/home_screen_repo_impl.dart';


part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
   search(String query) async {
     if(query.isEmpty || query.length<3){
       return;
     }else{
       emit(SearchLoading());
       HomeScreenRepoImpl homeScreenRepoImpl = HomeScreenRepoImpl(remoteDataSource: HomeScreenDataSource());
       final data = await homeScreenRepoImpl.searchProducts(query: query);
       debugPrint("searchCubit: ${data}");
       data.fold(
             (l) => emit(SearchFailure(l.message)),
             (r) => emit(SearchSuccess(r??[]
           //.where((element) => element.name!.toLowerCase().contains(query.toLowerCase())).toList()
         )
         ),
       );
     }

  }

}
