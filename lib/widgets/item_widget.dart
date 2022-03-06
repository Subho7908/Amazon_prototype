import 'package:amazonn/models/model.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  

  final Items item;

  const ItemWidget({Key? key, required this.item}) 
  : assert(item != null),
   super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: (){
          print("${item.name} pressed");
        },
        leading: Image.network(item.imageUrl),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",style: TextStyle(fontWeight:FontWeight.bold, ),textScaleFactor: 2,)
        ),
    );
  }
}