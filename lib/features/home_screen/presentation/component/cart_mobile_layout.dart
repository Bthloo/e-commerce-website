import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/general_components/custom_form_field.dart';
import '../pages/home_screen.dart';

class CartMobileLayout extends StatelessWidget {
  const CartMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey[100],
          height: MediaQuery.of(context).size.height * 0.4,
          child: ListView.separated(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) => const Divider(color: Colors.black,),
            itemCount: specialProducts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(11.0),
                child: Row(
                  children: [
                    IconButton(
                      icon:const Icon(Icons.delete),
                      onPressed: () {},
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(specialProducts[index].name??"No Name"),
                        const Text("X3"),
                        Text('${specialProducts[index].price} جنيه'),
                      ],
                    ),
                    SizedBox(width: 20.w,),
                    CachedNetworkImage(
                      height: 70.w,
                      width: 70.w,
                      imageUrl: specialProducts[index].imageUrl??"",
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: Icon(Icons.keyboard_arrow_up,color: Colors.black,size: 40,)),
              SizedBox(height: 30.h,),
               const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text("اجمالي سعر المنتجات",style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("1250 جنيه",style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 10.h,),
              const Divider(color: Colors.black,),
              SizedBox(height: 10.h,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("الشحن",style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("مجاني",style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 10.h,),
              const Divider(color: Colors.black,),
              SizedBox(height: 10.h,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("المجموع الكلي",style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("1250 جنيه",style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),

              SizedBox(height: 50.h,),
              const Text("الدفع عند الاستلام",style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 10.h,),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.white,
                          child: SizedBox(
                           // width: MediaQuery.of(context).size.width * 0.5,

                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(height: 20.h,),
                                    TextButton.icon(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      label: const Text("الرجوع"),
                                      icon: const Icon(Icons.close),
                                    ),
                                    SizedBox(height: 20.h,),
                                    CustomFormField(
                                      hintText: "الاسم كاملا",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "الرجاء ادخال الاسم";
                                        }
                                        return null;

                                      },
                                      controller: TextEditingController(),
                                      isRTL: true,
                                    ),
                                    SizedBox(height: 20.h,),
                                    CustomFormField(
                                      hintText: "رقم الهاتف",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "الرجاء ادخال الهاتف";
                                        }
                                        return null;

                                      },
                                      controller: TextEditingController(),
                                      isRTL: true,
                                    ),
                                    SizedBox(height: 20.h,),
                                    CustomFormField(
                                      hintText: "المحافظه",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "الرجاء ادخال الهاتف";
                                        }
                                        return null;

                                      },
                                      controller: TextEditingController(),
                                      isRTL: true,
                                    ),
                                    SizedBox(height: 20.h,),
                                    CustomFormField(
                                      hintText: "المدينة",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "الرجاء ادخال الهاتف";
                                        }
                                        return null;

                                      },
                                      controller: TextEditingController(),
                                      isRTL: true,
                                    ) ,
                                    SizedBox(height: 20.h,),
                                    CustomFormField(
                                      hintText: "العنوان بالتفصيل",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "الرجاء ادخال الهاتف";
                                        }
                                        return null;

                                      },
                                      controller: TextEditingController(),
                                      isRTL: true,
                                    ),
                                    SizedBox(height: 20.h,),
                                    CustomFormField(
                                      hintText: "علامه مميزه",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "الرجاء ادخال الهاتف";
                                        }
                                        return null;

                                      },
                                      controller: TextEditingController(),
                                      isRTL: true,
                                    ) ,
                                    SizedBox(height: 20.h,),
                                    CustomFormField(
                                      hintText: "ملاحظات",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "الرجاء ادخال الهاتف";
                                        }
                                        return null;

                                      },
                                      controller: TextEditingController(),
                                      isRTL: true,
                                    ),
                                    SizedBox(height: 30.h,),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("تاكيد الطلب"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Text("انهاء عملية الشراء"),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
