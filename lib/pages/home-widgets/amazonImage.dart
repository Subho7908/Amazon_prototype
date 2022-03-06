import 'package:flutter/material.dart';
import 'package:velocity_x/src/flutter/container.dart';
import 'package:velocity_x/src/flutter/padding.dart';
import 'package:velocity_x/src/flutter/sizedbox.dart';

import '../../widgets/theme.dart';

class ProductImage extends StatelessWidget {
  final String image;

  const ProductImage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var catalog;
    return Image.network(
      image,
    ).box.p12.color(MyTheme.creamColor).make().p12().w40(context);
  }
}