import 'dart:ui';

import 'package:bn_website/features/home_screen/presentation/component/product_widget.dart';
import 'package:bn_website/features/home_screen/presentation/cubit/products_by_category_cubit/get_products_by_categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/general_components/color_helper.dart';
import '../../../cart_screen/presentation/pages/cart_screen.dart';
import '../component/befor_footer_widget.dart';
import '../component/footer.dart';

class ProductsInCategoryScreen extends StatelessWidget {
   ProductsInCategoryScreen({super.key});
static const routeName = 'products-in-category';
  final scaffoldKey = GlobalKey<ScaffoldState>();
   final footerKey = GlobalKey();
   final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final String categoryName = ModalRoute.of(context)!.settings.arguments as String? ??  "sasa" ;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Watt Hub",
          style: TextStyle(
            fontFamily: "Cairo",
            fontSize: 30.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        toolbarHeight: 70.h,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: MediaQuery.of(context).size.width >= 900
            ? [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(CartScreen.routeName);
              },
              icon: const Icon(Icons.shopping_cart_outlined)),


          TextButton(
              onPressed: () {
                Scrollable.ensureVisible(footerKey.currentContext!,
                    duration: const Duration(seconds: 1));
              },
              child: Text(
                "التواصل",
                style:
                TextStyle(color: Colors.white, fontSize: 18.sp),
              )),
          TextButton(
              onPressed: () {
                Scrollable.ensureVisible(footerKey.currentContext!,
                    duration: const Duration(seconds: 1));
              },
              child: Text(
                "من نحن",
                style:
                TextStyle(color: Colors.white, fontSize: 18.sp),
              )),
        ]
            : null,
      ),
      endDrawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                    size: 40,
                  )),
              SizedBox(
                height: 15.h,
              ),

              TextButton(
                  onPressed: () {
                    Scrollable.ensureVisible(footerKey.currentContext!,
                        duration: const Duration(seconds: 1));
                    scaffoldKey.currentState?.closeEndDrawer();
                  },
                  child: Text(
                    "التواصل",
                    style: TextStyle(color: Colors.white, fontSize: 25.sp),
                  )),
              SizedBox(
                height: 15.h,
              ),
              TextButton(
                  onPressed: () {
                    Scrollable.ensureVisible(footerKey.currentContext!,
                        duration: const Duration(seconds: 1));
                    scaffoldKey.currentState?.closeEndDrawer();
                  },
                  child: Text(
                    "من نحن",
                    style: TextStyle(color: Colors.white, fontSize: 25.sp),
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: FloatingActionButton(

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            hoverElevation: 0,
            elevation: 0,
            backgroundColor: ColorHelper.mainColor.withOpacity(.5),
            //ColorHelper.mainColor.withAlpha(150),
            foregroundColor: Colors.white.withAlpha(150),
            hoverColor: ColorHelper.mainColor,
            tooltip: 'Go up',
            onPressed: () {
              scrollController.animateTo(
                0.0,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 500),
              );
            },
            child: const Icon(
              size: 30,
              Icons.arrow_upward,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
             Text(
               categoryName,style: TextStyle(
                fontSize: 25.sp,
             ),
             ),
              SizedBox(
                height: 20.h,
              ),
              BlocProvider(
            create: (context) => GetProductsByCategoriesCubit()..getProductsByCategory(category: categoryName),
            child: BlocBuilder<GetProductsByCategoriesCubit, GetProductsByCategoriesState>(
            builder: (context, state) {
              if(state is GetProductsByCategoriesLoading){
               return const Center(child: CircularProgressIndicator(),);
              }else if(state is GetProductsByCategoriesSuccess){
                if(state.products.isEmpty){
          return const Center(child: Text("No products found"),);
                }else{
          return GridView.builder(
            shrinkWrap: true,
            itemCount: state.products.length,
            gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250.h,
              mainAxisExtent: 270.w,
              //  childAspectRatio: 3 / 4,
              mainAxisSpacing: 10.w,
              crossAxisSpacing: 10.h,
            ),
            itemBuilder: (context, index) {
              return Center(
                child: ProductWidget(
                 product: state.products[index],
                 // id: state.products[index].id,
                ),
              );
            },
          );
                }


              }else if(state is GetProductsByCategoriesFailed){
              return Center(child: Text(state.message),);
              }else{
                return const Text("Unkown state");
              }
            }
          ),
          ),
              SizedBox(
                height: 80.h,
              ),
              const BeforeFooterWidget(),



              Footer(key: footerKey),
            ],
          ),
        ),
      ),
    );
  }
}
