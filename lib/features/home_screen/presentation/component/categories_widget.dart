import 'package:bn_website/features/home_screen/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Row(
          children: [
            Text(
              "التصنيفات",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: (){},
              child: Text(
                "عرض الكل",
                style: TextStyle(
                  fontSize: 20.sp,

                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h,),
        Wrap(
          children: categories.map((category) {
            return InkWell(
              borderRadius: BorderRadius.circular(14.r),
              onTap: () {

              },
              child: Padding(
                padding:  EdgeInsets.all(5.0.r),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(8.0.r),
                    child: Text(
                      category.name,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: "Cairo",

                      ),
                    ),
                  ),
                ),
              ),
            );
          } ).toList(),
        ),
      ],
    );
  }
}
