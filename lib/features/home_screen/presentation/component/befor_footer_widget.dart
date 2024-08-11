import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BeforeFooterWidget extends StatelessWidget {
  const BeforeFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Container(
            width: 200.w,
            // height: 250.h,

            padding: EdgeInsets.all(20.0.r),
            color: Colors.grey[100],
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.local_shipping_outlined,color: Colors.black,),
                SizedBox(height: 10.h,),
                const Text("خدمه التوصيل",style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5.h,),
                const Text("نقدم خدمه التوصيل الي جميع المحافظات المصرية",textAlign: TextAlign.center,),
              ],
            ),
          ),
          Container(
            width: 200.w,
            // height: 250.h,

            padding: EdgeInsets.all(20.0.r),
            color: Colors.grey[100],
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const Icon(CupertinoIcons.cube_box,color: Colors.black,),
                SizedBox(height: 10.h,),
                const Text("توصيل مجاني",style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5.h,),
                const Text("توصيل مجاني للطلبات التي تزيد عن 1000 جنيه",textAlign: TextAlign.center,),
              ],
            ),
          ),
          Container(
            width: 200.w,
            // height: 250.h,

            padding: EdgeInsets.all(20.0.r),
            color: Colors.grey[100],
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.headset_mic_outlined,color: Colors.black,),
                SizedBox(height: 10.h,),
                const Text("خدمه العملاء",style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5.h,),
                const Text("خدمه العملاء متاحه علي مدار الساعه",textAlign: TextAlign.center,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
