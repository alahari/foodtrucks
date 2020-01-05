import 'package:flutter/material.dart';
import 'package:foodtrucks/models/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant _restaurant;
  RestaurantCard(this._restaurant);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: ClipRRect(
            child: Image.network(
              this._restaurant.imageName,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          _restaurant.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Chicken Biriyani',
          style: TextStyle(
            color: Colors.red[500],
          ),
        ),
        
      ],
      
    );
  }

  
}