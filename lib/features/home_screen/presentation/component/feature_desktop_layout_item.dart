import 'dart:ui';

import 'package:bn_website/features/home_screen/domain/entity/product_entity.dart';
import 'package:bn_website/features/home_screen/presentation/pages/product_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeatureDesktopLayoutItem extends StatelessWidget {
  const FeatureDesktopLayoutItem({
    super.key,
    required this.product,
  });
final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return  Container(
      //color: Colors.black,
      height: 400.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
       image: DecorationImage(

         image: CachedNetworkImageProvider(product.imageUrl!),
         fit: BoxFit.cover,
         colorFilter:
         //ImageFilter.blur(sigmaX: 5, sigmaY: 5)
         ColorFilter.mode(Colors.black.withOpacity(0.85), BlendMode.darken),
       ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      //  alignment: Alignment.centerLeft,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                product.name!,
                style: TextStyle(
                  fontSize: 29.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.h,),
              Text(
                product.description!,
                style: TextStyle(
                  fontSize: 22.sp,
                  color: Colors.white,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.h,),
              ElevatedButton(

                  onPressed: () {
                    Navigator.of(context).pushNamed(ProductDetailsScreen.routeName,arguments: product);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("اشتري الان",
                      style: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
              )
            ],
          ),
          Opacity(
            opacity: 0.9,
            child: CircleAvatar(
              radius: 200.r,
              backgroundColor: Colors.transparent,

              child:  Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 400.h,
                    width: 400.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(300.r),
                      // color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[800]!,
                          blurRadius:500.0,
                        ),
                      ],
                    ),
                  ),
                  Hero(
                    tag: product.id!,
                    child: CachedNetworkImage(

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

                      imageUrl: product.imageUrl!,
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              ),

            ),
          ),


        ],
      ),
    );
  }
}
