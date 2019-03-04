class Restaurant {
  String name;
  String address1;
  String address2;
  String city;
  String pincode;
  String imageName;
  var ref;

  Restaurant(
      {this.name, this.address1, this.address2, this.city, this.pincode});

  Map<String, dynamic> toJson() => {
        'name': this.name,
        'address1': address1,
        "address2": address2,
        "city": city,
        "pincode": pincode,
        "imageName": imageName,
        "ref": ref
      };
}
