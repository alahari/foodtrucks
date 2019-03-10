class Dish {

  String name;
  String description;
  double price;
  double rating;
  String imageUrl;
  var restRef;

  Dish(Map<dynamic,dynamic> map){
    this.name = map['name'];
    this.description = map['description'];
    this.price = map['price'];
    this.rating = map['rating'];
    this.imageUrl = map['imageUrl'];
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'imageUrl': imageUrl,
        'restRef': restRef
      };

}