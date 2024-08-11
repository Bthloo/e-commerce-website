import 'package:flutter/cupertino.dart';

import 'feature_desktop_layout_item.dart';
import 'feature_mobile_layout_item.dart';

class FeatureLayoutBuilder extends StatelessWidget {
  const FeatureLayoutBuilder({
    super.key,
    required this.name,
    required this.description,
    required this.imageUrl,
  });
  final String name;
  final String description;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1000) {
            return FeatureDesktopLayoutItem(
              name: name,
              description: description,
              imageUrl: imageUrl,
            );
          } else {
            return  FeatureMobileLayoutItem(
              name: name,
              description: description,
              imageUrl: imageUrl,
            );
          }
        },
    );
  }
}
