import 'package:amazonn/models/cart_model.dart';
import 'package:amazonn/pages/home_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/model.dart';
import '../../widgets/theme.dart';
import 'add_to_cart.dart';
import 'amazonImage.dart';

class AmazonList extends StatelessWidget {
  const AmazonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: AmazonModel.items.length,
      itemBuilder: (context, index) {
        final amazon = AmazonModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(
                          catalog: amazon,
                        ))),
            child: AmazonItem(catalog: amazon));
      },
    );
  }
}

class AmazonItem extends StatelessWidget {
  final Items catalog;

  const AmazonItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: ProductImage(
            image: catalog.imageUrl,
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
            catalog.desc.text.make(),
            15.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                AddToCart(catalog : catalog)
              ],
            )
          ],
        ))
      ],
    )).white.rounded.square(150).make().py16();
  }
}

