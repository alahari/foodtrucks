import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodtrucks/const.dart';
import 'package:foodtrucks/models/dish.dart';
import 'package:foodtrucks/pages/home/dishCard.dart';
import 'package:foodtrucks/services/restaurant.service.dart';

class DishesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 12,bottom: 4,left: 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Recommended Dishes ',
              style: TextStyle(fontSize: 28),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 240,
          // width: MediaQuery.of(context).size.width*(70/100),
          child: StreamBuilder(
            stream: Firestore.instance.collection(Constants.dishesDocPath).snapshots(),
            builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
              return ListView(
               scrollDirection: Axis.horizontal,
               children: snapshot.data.documents.map((document){
                 Dish dish = new Dish(document.data);
                return DishCard(dish);
               }).toList()
              );
            },
          )
          
        /*  ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: new DishCard(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new DishCard(),
              ),
            ],
          ), */
        ),
      ],
    );
  }
}


