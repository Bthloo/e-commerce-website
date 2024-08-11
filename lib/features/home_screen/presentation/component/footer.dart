import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Footer extends StatelessWidget {
  const Footer({super.key,required this.footerKey});
final GlobalKey footerKey;
  @override
  Widget build(BuildContext context) {
    return Container(
      key: footerKey,
      color: Colors.black,
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.h,),
            LayoutBuilder(
                builder: (context, constraints) {
                  if(constraints.maxWidth >= 800){
                    return  Wrap(
                      alignment: WrapAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'من نحن',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text("نحن شركة عالمية تقدم خدمات الإلكترونيات والتكنولوجيا ونقدم أحدث وأرقى الأجهزة الإلكترونية المحمولة في الشرق الأوسط. نحن ملتزمون بتزويد العملاء بأفضل تجربة استثنائية من خلال التصميمات الدقيقة والتكنولوجيا الذكية والجودة العالية.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'الدعم',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text("نحن نقدم دعمًا فنيًا على مدار الساعة لجميع عملائنا. يمكنك الاتصال بنا في أي وقت للحصول على المساعدة في حالة وجود أي مشكلة أو استفسار.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                ),
                              ),
                              SizedBox(height: 10),

                              Tooltip(
                                triggerMode: TooltipTriggerMode.tap,
                                onTriggered: () {
                                  Clipboard.setData(const ClipboardData(text: "01111111111"));
                                },
                                message: "اضغط للنسخ",
                                child: Text("01111111111",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                ),),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'التواصل الاجتماعي',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                ),
                              ),
                              SizedBox(height: 10),
                              TextButton.icon(
                                  onPressed: () {

                                  },
                                label: Text("فيسبوك",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                ),),
                                icon: Icon(Icons.facebook,color: Colors.white,),
                              ),
                              TextButton.icon(
                                onPressed: () {

                                },
                                label: Text("واتساب",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                ),),
                                icon: Icon(Icons.explore_outlined,color: Colors.white,),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }else{
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'من نحن',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text("نحن شركة عالمية تقدم خدمات الإلكترونيات والتكنولوجيا ونقدم أحدث وأرقى الأجهزة الإلكترونية المحمولة في الشرق الأوسط. نحن ملتزمون بتزويد العملاء بأفضل تجربة استثنائية من خلال التصميمات الدقيقة والتكنولوجيا الذكية والجودة العالية.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(height: 40),
                        Text(
                          'الدعم',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text("نحن نقدم دعمًا فنيًا على مدار الساعة لجميع عملائنا. يمكنك الاتصال بنا في أي وقت للحصول على المساعدة في حالة وجود أي مشكلة أو استفسار.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(height: 10),
                        Tooltip(
                          onTriggered: () {
                            Clipboard.setData(const ClipboardData(text: "01111111111"));
                          },
                          message: "اضغط للنسخ",

                          child: Text("01111111111",style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                          ),),
                        ),
                        SizedBox(height: 40),
                        Text(
                          'التواصل الاجتماعي',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextButton.icon(
                          onPressed: () {

                          },
                          label: Text("فيسبوك",style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                          ),),
                          icon: Icon(Icons.facebook,color: Colors.white,),
                        ),
                        TextButton.icon(
                          onPressed: () {

                          },
                          label: Text("واتساب",style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                          ),),
                          icon: Icon(Icons.explore_outlined,color: Colors.white,),
                        ),
                      ],
                    );
                  }
                },
            ),

            SizedBox(height: 40.h),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' جميع الحقوق محفوظة'" ©2024",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'سياسة الخصوصية',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
