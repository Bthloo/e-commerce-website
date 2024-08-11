import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../component/product_widget.dart';

class ViewAllScreen extends StatelessWidget {
  const ViewAllScreen({super.key});
static const String routeName = 'view_all_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("عرض الكل"),
      ),
      body: GridView.builder(
        itemCount: 10,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300.h,
            mainAxisExtent: 300.w,
          //  childAspectRatio: 3 / 4,
            mainAxisSpacing: 10.w,
            crossAxisSpacing: 10.h,

          ),
          itemBuilder: (context, index) {
            return const Center(child: ProductWidget());
          }
          ),
    );
  }
}
