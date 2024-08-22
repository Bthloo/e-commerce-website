import 'dart:ui';

import 'package:bn_website/features/home_screen/domain/entity/product_entity.dart';
import 'package:bn_website/features/home_screen/presentation/cubit/special_cubit/special_products_cubit.dart';
import 'package:bn_website/features/home_screen/presentation/pages/home_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'featuer_layout_builder.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int currentIndex = 0;

  CarouselSliderController carouselController = CarouselSliderController();



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocProvider(
  create: (context) => SpecialProductsCubit()..getSpecialProducts(),
  child: BlocBuilder<SpecialProductsCubit, SpecialProductsState>(
  builder: (context, state) {

    if(state is SpecialProductsLoading){
      return  SizedBox(
        height: MediaQuery.of(context).size.height - 100.h,
        child: Shimmer.fromColors(

            baseColor: Colors.black,
            highlightColor: Colors.grey,
            child: FeatureLayoutBuilder(
                product: ProductEntity(
                    id: " ",
                    name: "      ",
                    description: "      ",
                    price: 0,
                    discount: 0,
                    imageUrl: "",
                    tags: "",
                    quantity: 0,
                    category: "",
                    images: []
                )
            )
        ),
      );
    }else if(state is SpecialProductsError) {
      return Center(child: Text(state.message));
    }else if(state is SpecialProductsSuccess) {
      if(state.products.isEmpty){
        return const Center(child: Text("No Special Products"),);
      }else{
        return Stack(
            alignment: AlignmentDirectional.center,
            children: [
              CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: state.products.length,
                  itemBuilder: (context, index, realIndex) {
                    return FeatureLayoutBuilder(
                      product: state.products[index],

                    );
                  },
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    autoPlay: true,
                    enlargeCenterPage: false,

                    enableInfiniteScroll: true,
                    viewportFraction: 1,
                    height: MediaQuery.of(context).size.height - 100.h,

                    //enlargeStrategy: CenterPageEnlargeStrategy.height,
                  )
              ),
              Positioned(
                bottom: 20.h,

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        // color: Colors.transparent,
                        color: Colors.grey.withOpacity(.3),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: DotsIndicator(
                        dotsCount: state.products.length,
                        position: currentIndex,
                        onTap: (index) {
                          carouselController.animateToPage(index);
                          // setState(() {
                          //   currentIndex = index;
                          // });
                        },
                        decorator: DotsDecorator(
                          color:  Colors.grey,
                          activeColor: Colors.white,
                          //const Color(0xffF3F3F3),
                          size: const Size(8.0, 8.0),
                          activeSize: const Size(8.0, 8.0),
                          activeShape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color:  Colors.white,
                              width: 1,
                              strokeAlign: 5,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(

                  right: 20,
                  child: ClipOval(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
                      child: IconButton.filled(
                        color: Colors.transparent,
                        style: ButtonStyle(
                            iconSize:WidgetStatePropertyAll(30.r) ,
                            backgroundColor: WidgetStatePropertyAll(Colors.white.withOpacity(.2))
                        ),
                        onPressed: () {
                          setState(() {
                            carouselController.previousPage();


                          });
                        },
                        icon: const Icon(Icons.arrow_back,color: Colors.white,),
                      ),
                    ),
                  )
              ),
              Positioned(

                  left: 20,
                  child: ClipOval(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
                      child: IconButton.filled(
                        color: Colors.transparent,
                        style: ButtonStyle(
                            iconSize:WidgetStatePropertyAll(30.r) ,
                            backgroundColor: WidgetStatePropertyAll(Colors.white.withOpacity(.2))
                        ),
                        onPressed: () {
                          setState(() {
                            carouselController.nextPage();


                          });
                        },
                        icon: const Icon(Icons.arrow_forward,color: Colors.white,),
                      ),
                    ),
                  )
              ),
            ]
        );
      }


    }else{
      return const SizedBox();
    }


  },
),
),
    );
  }
}
