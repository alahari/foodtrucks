import 'package:flutter/material.dart';
import 'package:foodtrucks/pages/samples/pokiman.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(title: Text('Account'),),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text('Add a new restaurant ..'),
            onTap: (){
              Navigator.pushNamed(context, '/restaurant');
            },
          ),
          ListTile(
            title: Text('Edit Restaurants'),
            leading: Icon(Icons.edit),
            onTap: (){
              Navigator.pushNamed(context, '/restaurant/edit');
            },
          ),
          ListTile(
            title: Text('Pokiman'),
            leading: Icon(Icons.phonelink_ring),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Pokiman()));
            },
          )
        ],
      ),
    );
  }
}