import 'package:bn_website/core/general_components/dialog.dart';
import 'package:bn_website/features/cart_screen/presentation/pages/cart_screen.dart';
import 'package:bn_website/features/home_screen/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'image_slider_description_screen.dart';

class ProductDescriptionDesktopLayout extends StatelessWidget {
   ProductDescriptionDesktopLayout({
     super.key,
     required this.product,
   });
  int quantity = 1;
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width >= 1700 ? 1700 * 0.47 : MediaQuery.of(context).size.width * 0.47,
            height: MediaQuery.of(context).size.width >= 1700 ? 1700 * 0.47 : MediaQuery.of(context).size.width * 0.47,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.name??"No Name",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h,),
                Text(
                  product.description??"No Description",
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " ${product.price} جنيه",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 5.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: product.quantity == 0 ? Colors.red : Colors.green,
                      ),
                      child: Text(
                        product.quantity == 0 ? "out of stock" : "in stock",
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
                        if(product.quantity == 0) {
                          return;
                        }else{
                          ScaffoldMessenger.of(context).showMaterialBanner(
                              MaterialBanner(
                                  onVisible: () {
                                    Future.delayed(const Duration(seconds: 3), () {
                                      if(context.mounted){
                                        ScaffoldMessenger.of(context).clearMaterialBanners();
                                      }

                                    });
                                  },
                                  content: Text("تم اضافة المنتج الى السلة",style: TextStyle(
                                    fontSize: 20.sp,
                                  ),),
                                  actions: [
                                    SnackBarAction(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context).clearMaterialBanners();
                                        Navigator.of(context).pushNamed(CartScreen.routeName);
                                      },
                                      label: "الذهاب الى السلة",
                                    ),
                                  ]
                              )
                          );

                        }


                      //  buildShowToast("تم اضافة المنتج الى السلة");
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
                                   if(product.quantity == 0){
                                      return;
                                   }else{
                                     if(quantity >= product.quantity!.toInt()){
                                      // DialogUtilities.showMessage(context, "الكمية المتاحة لهذا المنتج ${product.quantity}",posstiveActionName: "حسنا");
                                       ScaffoldMessenger.of(context).showMaterialBanner(
                                           MaterialBanner(
                                             onVisible: () {
                                               Future.delayed(const Duration(seconds: 3), () {
                                                 if(context.mounted){
                                                   ScaffoldMessenger.of(context).clearMaterialBanners();
                                                 }

                                               });
                                             },
                                               content: Text("الكمية المتاحة لهذا المنتج ${product.quantity}",style: TextStyle(
                                                 fontSize: 20.sp,
                                               ),),

                                               actions: [
                                                  SnackBarAction(
                                                    onPressed: () {
                                                      ScaffoldMessenger.of(context).clearMaterialBanners();

                                                    },
                                                    label: "حسنا",
                                                  ),
                                               ],
                                           )
                                       );


                                     }else{
                                       setState(() {
                                         quantity++;
                                       });
                                     }

                                   }



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
            ),
          ),
          Container(
            color: Colors.grey[100],
              width: MediaQuery.of(context).size.width >= 1700 ? 1700 * 0.47 : MediaQuery.of(context).size.width * 0.47,
              height: MediaQuery.of(context).size.width >= 1700 ? 1700 * 0.47 : MediaQuery.of(context).size.width * 0.47,

              child: ImageSliderDescriptionScreen(
                id: product.id!,
                images: product.images,
                oneImage: product.imageUrl,
              )
          ),
        ],
      ),
    );
  }
}
