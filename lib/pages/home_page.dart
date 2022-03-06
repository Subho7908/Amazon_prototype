import 'package:amazonn/core/store.dart';
import 'package:amazonn/models/cart_model.dart';
import 'package:amazonn/models/model.dart';
import 'package:amazonn/pages/cart_page.dart';
import 'package:amazonn/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';

import 'home-widgets/amazon_header.dart';
import 'home-widgets/amazonlist.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 25;
  final String name = "Mr. Amit";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final amazonJson =
        await rootBundle.loadString("assets/files/amazoncart.json");
    final decodedData = jsonDecode(amazonJson);
    var productsData = decodedData["products"];
    AmazonModel.items = List.from(productsData)
        .map<Items>((items) => Items.fromMap(items))
        .toList();
    setState(() {});
    // print(productsData);
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation,RemoveMutation},
        builder: (context,MyStore,_)=> FloatingActionButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage())),
          child: Icon(CupertinoIcons.cart,color: Colors.white,),
          backgroundColor: MyTheme.darkBluishColor,
          
        ).badge(color: Vx.red600, size: 20, count: _cart.item.length).py16(),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AmazonHeader(),
              if (AmazonModel.items != null && AmazonModel.items.isNotEmpty)
                AmazonList().expand()
              else
                CircularProgressIndicator().expand().centered(),
            ],
          ),
        ),
      ),
    );
  }
}







