import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodtrucks/const.dart';
import 'package:foodtrucks/models/order.dart';
import 'package:foodtrucks/pages/order/order.card.dart';

class Orders extends StatefulWidget {
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[];
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      child: StreamBuilder(
        stream: Firestore.instance
            .collection(Constants.ordersDocPath).where('userId',isEqualTo: 'venkat.alahari@gmail.com')
            .snapshots(),
         builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
           if(snapshot.hasError)
             return Text('Error');
           switch (snapshot.connectionState) {
             case ConnectionState.waiting:
             return Text('Waiting ..');               
               break;
             default: return ListView(
               children: snapshot.data.documents.map(
                 (document) {
                   Order order = new Order();
                   order.orderId =document['orderId'].toString();
                  // order.totalAmount =document['totalAmount'];

                   return OrderCard(order);
                 }
               ).toList(),
             );
           }  
         },
      ),
    );
  }
}
