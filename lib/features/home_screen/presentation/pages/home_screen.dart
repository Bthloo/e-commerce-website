
import 'package:bn_website/core/general_components/color_helper.dart';
import 'package:bn_website/features/home_screen/domain/entity/product_entity.dart';
import 'package:bn_website/features/home_screen/presentation/component/categories_widget.dart';
import 'package:bn_website/features/home_screen/presentation/component/footer.dart';
import 'package:bn_website/features/home_screen/presentation/component/product_section.dart';

import 'package:bn_website/features/home_screen/presentation/component/slider_widget.dart';
import 'package:bn_website/features/home_screen/presentation/pages/cart_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../component/befor_footer_widget.dart';



class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  static const String routeName = 'home_screen';
final ScrollController scrollController = ScrollController();
final sliderKey = GlobalKey();
final bestSellingKey = GlobalKey();
final categoriesKey = GlobalKey();
final footerKey = GlobalKey();
final productsKey = GlobalKey();
   final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                  icon:const Icon(Icons.shopping_cart_outlined,color: Colors.white,size: 40,)
              ),
              SizedBox(height: 15.h,),
              TextButton(
                  onPressed: () {
                    Scrollable.ensureVisible(
                        categoriesKey.currentContext!,
                        duration: const Duration(seconds: 1)
                    );
                    scaffoldKey.currentState?.closeEndDrawer();
                  },
                  child:  Text("التصنيفات",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.sp

                    ),)
              ),
              SizedBox(height: 15.h,),

              TextButton(
                  onPressed: () {
                    Scrollable.ensureVisible(
                        sliderKey.currentContext!,
                        duration: const Duration(seconds: 1)
                    );
                    scaffoldKey.currentState?.closeEndDrawer();
                  },
                  child: Text("المميزة",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.sp

                    ),)
              ),
              SizedBox(height: 15.h,),

              TextButton(
                  onPressed: () {
                    Scrollable.ensureVisible(
                        productsKey.currentContext!,
                        duration: const Duration(seconds: 1)
                    );
                    scaffoldKey.currentState?.closeEndDrawer();
                  },
                  child: Text("المنتجات",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.sp

                    ),)
              ),
              SizedBox(height: 15.h,),

              TextButton(
                  onPressed: () {
                    Scrollable.ensureVisible(
                        footerKey.currentContext!,
                        duration: const Duration(seconds: 1)
                    );
                    scaffoldKey.currentState?.closeEndDrawer();
                  },
                  child: Text("التواصل",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.sp

                    ),)
              ),
              SizedBox(height: 15.h,),
              TextButton(
                  onPressed: () {
                    Scrollable.ensureVisible(
                        footerKey.currentContext!,
                        duration: const Duration(seconds: 1)
                    );
                    scaffoldKey.currentState?.closeEndDrawer();
                  },
                  child: Text("من نحن",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.sp
                    ),)
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        hoverElevation: 0,
        elevation: 0,
        backgroundColor: ColorHelper.mainColor.withAlpha(150),
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
        child: const Icon(Icons.arrow_upward,color: Colors.white,),
      ),
      extendBodyBehindAppBar: false,
      body:Center(
        child: ConstrainedBox(
          constraints:  BoxConstraints(
            maxWidth: 1700.w,
          ),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverAppBar(

                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
                actions: MediaQuery.of(context).size.width >= 900 ?
                   [
                     IconButton(
                         onPressed: () {
                           Navigator.of(context).pushNamed(CartScreen.routeName);
                         },
                         icon: const Icon(Icons.shopping_cart_outlined)
                     ),
                  TextButton(
                      onPressed: () {
                        Scrollable.ensureVisible(
                            categoriesKey.currentContext!,
                            duration: const Duration(seconds: 1)
                        );
                      },
                      child:  Text("التصنيفات",
                        style: TextStyle(
                        color: Colors.white,
                            fontSize: 18.sp

                        ),)
                  ),
                  TextButton(
                      onPressed: () {
                        Scrollable.ensureVisible(
                            sliderKey.currentContext!,
                            duration: const Duration(seconds: 1)
                        );
                      },
                      child: Text("المميزة",
                        style: TextStyle(
                          color: Colors.white,
                            fontSize: 18.sp

                        ),)
                  ),
                  TextButton(
                      onPressed: () {
                        Scrollable.ensureVisible(
                            productsKey.currentContext!,
                            duration: const Duration(seconds: 1)
                        );
                      },
                      child: Text("المنتجات",
                        style: TextStyle(
                          color: Colors.white,
                            fontSize: 18.sp

                        ),)
                  ),

                  TextButton(
                      onPressed: () {
                        Scrollable.ensureVisible(
                            footerKey.currentContext!,
                            duration: const Duration(seconds: 1)
                        );
                      },
                      child: Text("التواصل",
                        style: TextStyle(
                          color: Colors.white,
                            fontSize: 18.sp

                        ),)
                  ),
                  TextButton(
                      onPressed: () {
                        Scrollable.ensureVisible(
                            footerKey.currentContext!,
                            duration: const Duration(seconds: 1)
                        );
                      },
                      child: Text("من نحن",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp
                        ),)
                  ),
                ] : null,
                floating: true,
            surfaceTintColor: Colors.transparent,
           backgroundColor: Colors.black,
           // backgroundColor: Colors.transparent,
           //  flexibleSpace: ClipRect(
           //    child: BackdropFilter(
           //        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
           //        child: Container(
           //            color:  Colors.transparent
           //        )
           //    ),
           //  ),
            centerTitle: false,
            title:  Text(
              "Electronic Store",
              style:  TextStyle(
                fontFamily: "Cairo",
                fontSize: 30.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),

            ),
          ),
               SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      SizedBox(height: 30.h,),
                     CategoriesWidget(key: categoriesKey),
                     SizedBox(height: 40.h,),
                      SliderWidget(key: sliderKey,),
                      SizedBox(height: 60.h,),
                     ProductSection(key: productsKey),
                      SizedBox(height: 80.h,),
                    const BeforeFooterWidget(),
                      Footer(key: footerKey),

                    ],
              )
                ),
              ),
         ]
        ),
      )

      )
        );
  }
}

List<Category> categories = [
  Category(name: 'شواحن'),
  Category(name: 'فلاشات'),
  Category(name: 'جرابات'),
  Category(name: 'اكسسوارات'),
  Category(name: 'هواتف'),
  Category(name: 'باور بانك'),
  Category(name: 'ساعات ذكيه'),
  Category(name: 'سماعات'),



];
class Category{
  final String name;
  //final String image;
 // final String url;

  Category({required this.name,
   // required this.image, required this.url
  });
}


List<ProductEntity> specialProducts = [
  ProductEntity(
    id: "1",
    name: 'شاحن انكر 30 وات',
    description: 'استمتع بسرعه فائقه في شحن هاتفك',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0493/9834/9974/files/5_5659124f-7fbd-4f6b-868c-91db272a4f6c.png?v=1718964539',
    price: 100,
    discount: 10,
    tags: '',
    quantity: 10,
  ),
  ProductEntity(
    id: "2",
    name: 'اير بودز',
    description: 'استمتع بجوده صوت عاليه',
    imageUrl: 'https://ubkart.in/cdn/shop/products/airpods.png?v=1705066243',
    price: 3200,
    discount: 100,
    tags: '',
    quantity: 10,
  ),
  ProductEntity(
    id: "3",
    name: 'ابل واتش',
    description: 'ابق على اتصال واعرف معلوماتك الصحيه',
    imageUrl: 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MT653_VW_34FR+watch-49-titanium-ultra2_VW_34FR+watch-face-49-ocean-ultra2_VW_34FR?wid=2000&hei=2000&fmt=png-alpha&.v=1694507270905',
    price: 10300,
    discount: 200,
    tags: '',
    quantity: 10,
  ),
];


