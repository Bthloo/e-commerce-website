import 'package:bn_website/features/home_screen/presentation/component/sale_wiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'best_selling.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       // const  SaleWidget(),
        SizedBox(height: 20.h,),
        // BestSelling(),
      ],
    );
  }
}
