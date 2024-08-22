import 'package:bn_website/core/general_components/search_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home_screen/presentation/cubit/search_viewmodel/search_cubit.dart';
import '../../features/home_screen/presentation/pages/product_details_screen.dart';

class ProductSearch extends SearchDelegate {
  //BuildContext context;
  ProductSearch(BuildContext context) : super(
    searchFieldLabel: "Search",
    searchFieldDecorationTheme: const InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      hintStyle: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
    ),
    keyboardType: TextInputType.text,

    textInputAction: TextInputAction.search,
  );


SearchCubit searchCubit = SearchCubit();
@override
  get searchFieldLabel => query;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {
        showResults(context);
      },
          icon: const Icon(Icons.search))
    ];
  }




  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        }, icon: const Icon(Icons.clear)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: BlocProvider(
        create: (context) => SearchCubit()..search(query),
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if(state is SearchLoading){
              return const Center(child: CircularProgressIndicator());
            }else if(state is SearchSuccess){
              if (state.searchResults!.isEmpty) {
                return const Center(child: Text('No Data Found'));
              }else{
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return SearchItem(
                        onTap: (){
                          Navigator.pushNamed(context, ProductDetailsScreen.routeName,
                              arguments: state.searchResults![index]);
                        },
                       product: state.searchResults![index],
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: state.searchResults!.length
                );
              }

            }else if(state is SearchFailure){
              return Center(
                child: Column(
                  children: [
                    Text(state.error.toString()),
                    ElevatedButton(
                        onPressed: (){
                          showResults(context);
                        },
                        child: const Text('Try Again'))
                  ],
                ),
              );
            }else {
              return const Center(child: Text('No Data Found'));
            }

          },
        ),
      ),
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //return Text('');
    searchCubit.search(query);
    if (query.isEmpty) {
      return const Center(child: Text('Please Enter Search Word'));
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: BlocProvider(
          create: (context) => SearchCubit(),
          child: BlocBuilder<SearchCubit, SearchState>(
            bloc: searchCubit,
            builder: (context, state) {
              if(state is SearchLoading){
                return const Center(child: CircularProgressIndicator());
              }else if(state is SearchSuccess){
                if (state.searchResults!.isEmpty || state.searchResults == []) {
                  return const Center(child: Text('No Data Found'));
                }else{
                  return ListView.separated(
                      itemBuilder: (context, index) {
                          return SearchItem(
                            onTap: (){
                              Navigator.pushNamed(context, ProductDetailsScreen.routeName,
                                  arguments: state.searchResults![index]);
                            },
                            product: state.searchResults![index],
                          );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: state.searchResults!.length
                  );
                }

              }else if(state is SearchFailure){
                return Center(
                  child: Column(
                    children: [
                      Text(state.error.toString()),
                      ElevatedButton(
                          onPressed: (){
                            showResults(context);
                          },
                          child: const Text('Try Again'))
                    ],
                  ),
                );
              }
              else {
                return const Center(child: Text('No Data Found'));
              }

            },
          ),
        ),
      );
    }
  }


}