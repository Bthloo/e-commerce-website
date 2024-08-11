import 'package:bn_website/features/home_screen/presentation/component/product_description_desktop_layout.dart';
import 'package:bn_website/features/home_screen/presentation/component/product_details_mobile_layout.dart';
import 'package:flutter/cupertino.dart';

class ProductDetailsLayout extends StatelessWidget {
  const ProductDetailsLayout({
    super.key,
    required this.productKey,
  });
final GlobalKey productKey;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: productKey,
        builder: (context, constraints) {
          if(constraints.maxWidth >= 900){
            return ProductDescriptionDesktopLayout();
          }else{
            return ProductDetailsMobileLayout();
          }
        },
    );
  }
}
