import 'package:bn_website/features/home_screen/presentation/component/image_slider_description_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../pages/cart_screen.dart';

class ProductDetailsMobileLayout extends StatelessWidget {
   ProductDetailsMobileLayout({super.key});
int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.grey[100],
          height: MediaQuery.of(context).size.height * 0.6,
            child:const ImageSliderDescriptionScreen()),
        SizedBox(height: 20.h,),
        Text(
          "شاحن 25 وات من انكر",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.h,),
        Text(
          "شاحن 312 25 وات من انكر بتقنية الشحن السريع ايس قابل للطي PPS لسامسونج جالاكسي S23 الترا S23+ S22 S21 S20 نوت 20 10 Z فولد 3+ ضمان محلي لمدة 18 شهر أسود يو اس بي 3 ",
          style: TextStyle(
            fontSize: 18.sp,
          ),
        ),
        SizedBox(height: 20.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(" 250 جنيه",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 5.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: Colors.green,
              ),
              child: Text("in stock",
                style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h,),
        const Divider(color: Colors.black,),
        SizedBox(height: 20.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:  Text("تم اضافة المنتج الى السلة",style: TextStyle(
                        fontSize: 20.sp,
                      ),),
                      padding: const EdgeInsets.all( 20),
                      showCloseIcon: true,
                      backgroundColor: Colors.white,

                      action: SnackBarAction(
                        label: "الذهاب الى السلة",
                        onPressed: () {
                          Navigator.of(context).pushNamed(CartScreen.routeName);
                        },
                      ),
                    )
                );
              },
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 5.0.h),
                child: Text("اضف الى السلة",style: TextStyle(
                  fontSize: 17.sp,
                ),),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(
                  color: Colors.grey,
                ),
                //color:  Colors.grey,
              ),
              child: StatefulBuilder(
                builder: (context, setState) {

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(

                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          child:  Text("+",
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              //fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center,
                          )
                      ),

                      //  const SizedBox(width: 5),
                      Text(
                        "$quantity",
                        style:  TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold

                        ),
                      ),
                      // const SizedBox(width: 5),
                      TextButton(
                          onPressed: () {
                            if(quantity <= 1){
                              return ;
                            }else{
                              setState(() {
                                quantity--;
                              });
                            }

                          },
                          child:  Text("-",

                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              //  fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center,
                          )
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
