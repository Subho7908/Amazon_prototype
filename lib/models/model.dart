class AmazonModel{
   
  static List<Items> items = [];

  //Get item by id
   Items getById(int id) =>
       items.firstWhere((element) => element.id == id, orElse: null);

  //Get Item By Position
  Items getByPosition(int pos) => items[pos];
}

class Items{
final int id;
final String name;
final String desc;
final num price;
final String imageUrl;

  Items({required this.id,required this.name,required this.desc,required this.price, required this.imageUrl});

  factory Items.fromMap(Map<String,dynamic>map){
    return Items(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      imageUrl: map["imageUrl"],
    );
  }



}

