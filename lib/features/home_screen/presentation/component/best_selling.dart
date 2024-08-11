import 'package:bn_website/features/home_screen/presentation/component/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../pages/view_all_screen.dart';

class BestSelling extends StatelessWidget {
  const BestSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "تخفيضات",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: (){
                Navigator.of(context).pushNamed(ViewAllScreen.routeName);

              },
              child: Text(
                "عرض الكل",
                style: TextStyle(
                  fontSize: 18.sp,

                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15.h,),
        SizedBox(
          height: 270.h,
          width: double.infinity,
          child: ListView.separated(
           // controller: scrollController,
            separatorBuilder: (context, index) {
              return SizedBox(width: 15.w,);

            },
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return  const ProductWidget();
            },
          ),
        )
      ],
    );
  }
}
