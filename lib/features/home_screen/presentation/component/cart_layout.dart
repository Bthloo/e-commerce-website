import 'package:flutter/material.dart';

import 'cart_desktop_layout.dart';
import 'cart_mobile_layout.dart';

class CartLayout extends StatelessWidget {
  const CartLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxWidth >= 900){
            return const CartDesktopLayout();
          }else{
            return const CartMobileLayout();
          }
        },
    );
  }
}
