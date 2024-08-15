import 'package:bn_website/features/home_screen/presentation/pages/product_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductWidget extends StatelessWidget {
   const ProductWidget({
     super.key,
      required this.name,
      required this.description,
      required this.price,
      required this.discount,
      required this.imageUrl,
   });
   final String name;
   final String description;
   final String imageUrl;
   final num price;
   final num discount;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetailsScreen.routeName);
      },

    // hoverColor:  ColorHelper.mainColor,
      child: Tooltip(
        message: "شاحن انكر 30 وات",

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.h,
              width: 200.w,
              decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10.r),
               color: Colors.grey[200],
               // color: Colors.black.withOpacity(0.9),
              ),
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
                imageUrl: imageUrl,
                height: 200.h,
                width: 200.w,
                fit: BoxFit.contain,
              )
              ,
            ),
            SizedBox(height: 5.h,),
            Text(name,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            //SizedBox(height: 5.h,),
            Text(price.toString(),
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
