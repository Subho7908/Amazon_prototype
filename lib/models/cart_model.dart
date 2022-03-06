import 'dart:math';

import 'package:amazonn/core/store.dart';
import 'package:amazonn/models/model.dart';
import 'package:velocity_x/velocity_x.dart';




class CartModel {
  
  
 



  late AmazonModel _catalog;
// colection of ids
  final List<int> _itemIds=[];
  

//get catalog
  AmazonModel get catalog => _catalog;
  set catalog(AmazonModel newCatalog) {
    _catalog = newCatalog;
    
  }
//get item in the cart
  List<Items> get item => _itemIds.map((id) => _catalog.getById(id)).toList();

//get total price  
num get totalPrice => item.fold(0, (total, current) => total + current.price);



//add item

/*Map productQuantity(catalog){
  var quantity = Map();

  catalog.forEach((catalog){
    if(!quantity.containsKey(catalog)){
      quantity[catalog]=1;
    }
    else{
      quantity[catalog] += 1;
    }
  });

  return quantity;
}*/


}

class AddMutation extends VxMutation<MyStore>{

  final Items item ;
 


  AddMutation(this.item);

  @override
  perform() {
  
      store!.cart._itemIds.add(item.id);
      
  
  }
}

class RemoveMutation extends VxMutation<MyStore>{

  final Items item ;

  RemoveMutation(this.item);

  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}


