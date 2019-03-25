import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodtrucks/const.dart';
import 'package:foodtrucks/models/restaurant.dart';

class RestaurantDishes extends StatelessWidget {
  final Restaurant _restaurant;
  RestaurantDishes(this._restaurant);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hello'),
        ),
        body:  Container(
          child: StreamBuilder(
            stream: Firestore.instance
                .collection(Constants.dishesDocPath).where('restRef',isEqualTo: _restaurant.ref)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) return Text('Error');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Text('Waiting ...');
                default:
                  return ListView(
                   children: snapshot.data.documents.map((document){
                     return ListTile(
                       title: Text(document['name']),
                       subtitle: Text(MediaQuery.of(context).size.height.toString()),
                     );
                   }).toList(),
                  );
              }
            },
          ),
        ));

   
  }
}
