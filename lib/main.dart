import 'package:bn_website/features/cart_screen/presentation/pages/cart_screen.dart';
import 'package:bn_website/features/home_screen/presentation/pages/home_screen.dart';
import 'package:bn_website/features/home_screen/presentation/pages/product_details_screen.dart';
import 'package:bn_website/features/home_screen/presentation/pages/view_all_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/themeing/theme_data.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize:  Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: themeData(context),
        initialRoute: HomeScreen.routeName,
        debugShowCheckedModeBanner: false,
        locale: const Locale('ar'),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('ar'),
          Locale('en'),
        ],

        routes: {
          HomeScreen.routeName: (context) =>  HomeScreen(),
          ViewAllScreen.routeName: (context) =>  const ViewAllScreen(),
          ProductDetailsScreen.routeName: (context) =>  ProductDetailsScreen(),
          CartScreen.routeName: (context) =>  CartScreen(),

        },
      ),
    );
  }
}
