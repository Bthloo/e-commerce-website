import 'package:bn_website/features/home_screen/presentation/component/product_description_desktop_layout.dart';
import 'package:bn_website/features/home_screen/presentation/component/product_details_mobile_layout.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/entity/product_entity.dart';

class ProductDetailsLayout extends StatelessWidget {
  const ProductDetailsLayout({
    super.key,
    required this.product
  });

final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxWidth >= 900){
            return ProductDescriptionDesktopLayout(
              product: product,
            );
          }else{
            return ProductDetailsMobileLayout(
              product: product,

            );
          }
        },
    );
  }
}
