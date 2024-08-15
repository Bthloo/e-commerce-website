import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeatureMobileLayoutItem extends StatelessWidget {
  const FeatureMobileLayoutItem({
    super.key,
    required this.name,
    required this.description,
    required this.imageUrl,
  });
  final String name;
  final String description;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
    width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: CachedNetworkImageProvider(imageUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.85), BlendMode.darken),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Opacity(
            opacity: 0.9,
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
              fit: BoxFit.cover,
               height: 300.h,
               width: 300.w,
            ),
          ),
          Text(name,
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.h,),
          Text(description,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
              //fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30.h,),
          ElevatedButton(

              onPressed: () {

              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("اشتري الان",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
          )

        ],
      ),
    );
  }
}
