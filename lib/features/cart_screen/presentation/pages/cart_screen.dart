import 'package:bn_website/features/home_screen/presentation/component/cart_layout.dart';
import 'package:bn_website/features/home_screen/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/general_components/color_helper.dart';
import '../../../home_screen/presentation/component/befor_footer_widget.dart';
import '../../../home_screen/presentation/component/footer.dart';

class CartScreen extends StatelessWidget {
   CartScreen({super.key});
static const routeName = "cart-screen";
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey footerKey = GlobalKey();
   final ScrollController scrollController = ScrollController();

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
                    scaffoldKey.currentState?.closeEndDrawer();
                  },
                  child:  Text("الرئيسية",
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
                        Navigator.of(context)
                            .pushNamed(CartScreen.routeName);
                      },
                      icon: const Icon(Icons.shopping_cart_outlined)),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(HomeScreen.routeName);
                      },
                      child:Text("الرئيسية",
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
                child: Column(
                  children: [
                    SizedBox(height: 20.h,),
                    const CartLayout(),
                    SizedBox(height: 80.h,),
                    const BeforeFooterWidget(),
                    Footer(key: footerKey),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
