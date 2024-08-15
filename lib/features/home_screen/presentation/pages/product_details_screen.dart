import 'package:bn_website/features/home_screen/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/general_components/color_helper.dart';
import '../../../cart_screen/presentation/pages/cart_screen.dart';
import '../component/befor_footer_widget.dart';
import '../component/footer.dart';
import '../component/product_details_layout.dart';
import '../component/section_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
   ProductDetailsScreen({super.key});
static const String routeName = "product-details";

  final ScrollController scrollController = ScrollController();
  final productKey = GlobalKey();
  final footerKey = GlobalKey();
  final productsKey = GlobalKey();
  final scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                      Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
                    },
                    child: Text("الرئيسية",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.sp
                      ),)
                ),
                SizedBox(height: 15.h,),
                TextButton(
                    onPressed: () {
                      Scrollable.ensureVisible(
                          productKey.currentContext!,
                          duration: const Duration(seconds: 1)
                      );
                      scaffoldKey.currentState?.closeEndDrawer();
                    },
                    child:  Text("عن المنتج",
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
                    child: Text("قد يعجبك ايضا",
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
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1700.w),
          child: CustomScrollView(
              controller: scrollController,
            slivers: [
              SliverAppBar(
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
                floating: true,
                actions: MediaQuery.of(context).size.width >= 900 ?
                [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(CartScreen.routeName);
                      },
                      icon: const Icon(Icons.shopping_cart_outlined)),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
                      },
                      child: Text("الرئيسية",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp
                        ),)
                  ),
                  TextButton(
                      onPressed: () {
                        Scrollable.ensureVisible(
                            productKey.currentContext!,
                            duration: const Duration(seconds: 1)
                        );
                      },
                      child:  Text("عن المنتج",
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
                      child: Text("قد يعجبك ايضا",
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

                surfaceTintColor: Colors.transparent,
                backgroundColor: Colors.black,
               // pinned: true,

              ),
               SliverToBoxAdapter(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Column(
                    children: [

                      ProductDetailsLayout(
                        productKey: productKey,
                      ),

                      SizedBox(height: 80.h,),
                      SectionWidget(
                        key: productsKey,
                      ),
                      SizedBox(height: 80.h,),
                      const BeforeFooterWidget(),
                      Footer(
                        key:  footerKey,
                      ),
                    ],
                  ),

                ),
               )
          ]
          ),
        ),
      )
    );


  }
}
