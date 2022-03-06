import 'package:amazonn/core/store.dart';
import 'package:amazonn/models/cart_model.dart';
import 'package:amazonn/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.xl.make(),
      ),
      body: Column(
        children: [
          _cartList().p32().expand(),
          Divider(),
          _cartTotal(),
        ],
      ),
    ));
  }
}

class _cartTotal extends StatelessWidget {
  const _cartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         VxConsumer(
           mutations: {RemoveMutation}, 
           notifications: {},
           builder: (context,MyStore,_){
             return "\$${_cart.totalPrice}"
              .text
              .xl5
              .color(Color.fromARGB(255, 17, 253, 25))
              .make();

           }, 
        ),
          30.widthBox,
          ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(MyTheme.darkBluishColor),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            "This feature will activated soon".text.make()));
                  },
                  child: "Buy".text.color(Colors.white).make())
              .w32(context)
              .h4(context)
        ],
      ),
    );
  }
}

class _cartList extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);

    final CartModel _cart = (VxState.store as MyStore).cart;

    return _cart.item.isEmpty? "Nothing To Show".text.xl3.makeCentered() : ListView.builder(
      itemCount: _cart.item.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
            onPressed: () {
              RemoveMutation(_cart.item[index]);
              
              
            }, icon: Icon(Icons.remove_circle_outline,color: Colors.redAccent,)),
        title: _cart.item[index].name.text.make(),
      ),
    );
  }
}
