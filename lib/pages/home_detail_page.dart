import 'package:amazonn/models/cart_model.dart';
import 'package:amazonn/models/model.dart';
import 'package:amazonn/pages/home-widgets/add_to_cart.dart';
import 'package:amazonn/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';
import 'cart_page.dart';

class HomeDetailPage extends StatelessWidget {
  final Items catalog;

  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            VxBuilder(
              mutations: {AddMutation},
              builder: (context, MyStore,_)=> IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
            
              }, 
              icon:Icon(CupertinoIcons.cart_badge_plus,color: MyTheme.darkBluishColor,size: 50,)
              ).badge(color: Vx.red600, size: 20, count:_cart.item.length).pOnly(right: 15),
            )
          ],
        ),
        backgroundColor: MyTheme.creamColor,
        bottomNavigationBar: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.bold.xl4.green900.make(),
            AddToCart(
              catalog: catalog,
            ).wh(130, 50)
          ],
        ).p32(),
        body: Column(
          children: [
            Center(
                child: Hero(
                        tag: Key(catalog.id.toString()),
                        child: Image.network(catalog.imageUrl))
                    .h32(context)),
            Expanded(
                child: VxArc(
                    height: 30,
                    edge: VxEdge.TOP,
                    arcType: VxArcType.CONVEY,
                    child: Container(
                      color: Colors.white,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          catalog.name.text.xl4
                              .color(MyTheme.darkBluishColor)
                              .bold
                              .make(),
                          catalog.desc.text.xl.make(),
                        ],
                      ).py64(),
                    )))
          ],
        ),
      ),
    );
  }
}
