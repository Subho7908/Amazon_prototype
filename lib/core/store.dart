import 'package:amazonn/models/cart_model.dart';
import 'package:amazonn/models/model.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{
   late AmazonModel amazon ;
   late CartModel cart;

  MyStore(){
    amazon = AmazonModel();
    cart = CartModel();
    cart.catalog = amazon;
  }

  
}