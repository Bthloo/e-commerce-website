import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeatureDesktopLayoutItem extends StatelessWidget {
  const FeatureDesktopLayoutItem({
    super.key,
    required this.name,
    required this.description,
    required this.imageUrl,
   // required this.price,
   // required this.discount,
  //required this.tags,
  //  required this.quantity,
  });
final String name;
final String description;
final String imageUrl;
//final String price;
//final String discount;
//final String tags;
//final int quantity;
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.black,
      height: 400.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      //  alignment: Alignment.centerLeft,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name,
                style: TextStyle(
                  fontSize: 29.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.h,),
              Text(description,
                style: TextStyle(
                  fontSize: 22.sp,
                  color: Colors.white,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.h,),
              ElevatedButton(

                  onPressed: () {

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
                  CachedNetworkImage(
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
                    fit: BoxFit.contain,
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
