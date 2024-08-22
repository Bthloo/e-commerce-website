import 'package:bn_website/features/home_screen/presentation/cubit/categories_cubit/get_categories_cubit.dart';
import 'package:bn_website/features/home_screen/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../pages/products_in_category_screen.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      GetCategoriesCubit()
        ..getCategories(),
      child: BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
        builder: (context, state) {
          if (state is GetCategoriesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetCategoriesFailed) {
            return Center(
              child: Text(state.message),
            );
          }else if(state is GetCategoriesSuccess){
            if(state.categories.isEmpty){
              return Text("No Categories");
            }else{
              return Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "التصنيفات",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "عرض الكل",
                          style: TextStyle(
                            fontSize: 20.sp,

                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Wrap(
                    children: state.categories.map((category) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(14.r),
                        onTap: () {
                          Navigator.of(context).pushNamed(ProductsInCategoryScreen.routeName, arguments: category.name);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(5.0.r),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0.r),
                              child: Text(
                                category.name,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: "Cairo",

                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              );
            }

          }else{
            return Container();
          }

        },
      ),
    );
  }
}
