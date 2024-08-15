import 'package:bn_website/features/home_screen/presentation/component/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../pages/view_all_screen.dart';

class SaleWidget extends StatelessWidget {
  const SaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "الاكثر مبيعا",
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
              return  const ProductWidget(
                name: "شاحن انكر 30 وات",
                description: "شاحن انكر 30 وات",
                price: 100,
                discount: 20,
                imageUrl: "https://cdn.shopify.com/s/files/1/0493/9834/9974/files/5_5659124f-7fbd-4f6b-868c-91db272a4f6c.png?v=1718964539",
              );
            },
          ),
        )
      ],
    );
  }
}
