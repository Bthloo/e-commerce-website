import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSliderDescriptionScreen extends StatefulWidget {
  const ImageSliderDescriptionScreen({
    super.key,
     this.images,
    this.oneImage,
    required this.id
  });
final List<String>? images;
final String? oneImage;
final String id;
  @override
  State<ImageSliderDescriptionScreen> createState() => _ImageSliderDescriptionScreenState();
}

class _ImageSliderDescriptionScreenState extends State<ImageSliderDescriptionScreen> {
int currentIndex = 0;
CarouselSliderController carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return widget.images!.isEmpty ?
    Hero(
      tag: widget.id,
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1,
          height: MediaQuery.of(context).size.height - 100.h,

          //enlargeStrategy: CenterPageEnlargeStrategy.height,
        ),
        items: [
          CachedNetworkImage(
            imageUrl: widget.oneImage!,
            errorWidget: (context, url, error) {
              return const Center(
                child: Text("حدث خطأ في تحميل الصورة"),
              );
            },
            progressIndicatorBuilder: (context, url, progress) {
              return Center(
                child: CircularProgressIndicator(
                  value: progress.progress,
                ),
              );
            },
          )
        ],
      ),
    ) :

      Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Hero(
          tag: widget.id,
          child: CarouselSlider.builder(
            itemCount: widget.images?.length,
            carouselController: carouselController,
             itemBuilder: (context, index, realIndex) {
               return  CachedNetworkImage(
                 imageUrl: widget.images?[index]?? widget.oneImage!,
                 errorWidget: (context, url, error) {
                   return const Center(
                     child: Text("حدث خطأ في تحميل الصورة"),
                   );
                 },
                 progressIndicatorBuilder: (context, url, progress) {
                   return Center(
                     child: CircularProgressIndicator(
                       value: progress.progress,
                     ),
                   );
                 },
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
                  dotsCount: widget.images!.length,
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
      ],
    );
  }
}
