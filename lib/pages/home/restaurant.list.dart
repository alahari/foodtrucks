import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodtrucks/const.dart';
import 'package:foodtrucks/models/restaurant.dart';
import 'package:foodtrucks/pages/home/restaurant.dishes.dart';
import 'package:foodtrucks/services/restaurant.service.dart';
import 'package:foodtrucks/widgets/RestaurantCard.dart';

class RestaurantsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance
            .collection(Constants.restaurantDocPath)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text('Error');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text('Waiting ..');
            default:
              return new ListView(
                scrollDirection: Axis.horizontal,
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  Restaurant rest = new Restaurant();
                  rest.name = document['name'];
                  rest.address1 = document['address1'];
                  rest.address2 = document['address2'];
                  rest.city = document['city'];
                  rest.pincode = document['pincode'];
                  rest.imageName =document['imageName'];
                  rest.ref = document.reference;
                  return InkWell(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        width: (MediaQuery.of(context).size.width)  > 460 ?  350 : (MediaQuery.of(context).size.width * (70/100) ) ,
                        child: RestaurantCard(rest)),
                    onTap: () {
                      print("******************");
                      // Navigator.pushNamed(context, '/account');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RestaurantDishes(rest)));
                    },
                  );
                  // {this.name, this.address1, this.address2, this.city, this.pincode}
                }).toList(),
              );
          }
        });
  }
}