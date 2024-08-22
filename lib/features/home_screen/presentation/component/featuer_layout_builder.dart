import 'package:bn_website/features/home_screen/domain/entity/product_entity.dart';
import 'package:flutter/cupertino.dart';

import 'feature_desktop_layout_item.dart';
import 'feature_mobile_layout_item.dart';

class FeatureLayoutBuilder extends StatelessWidget {
  const FeatureLayoutBuilder({
    super.key,
    required this.product
  });

  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1000) {
            return FeatureDesktopLayoutItem(
              product: product,
            );
          } else {
            return  FeatureMobileLayoutItem(
              product: product,
            );
          }
        },
    );
  }
}
