import 'package:flutter/material.dart';
import 'package:foodtrucks/models/dish.dart';
class DishCard extends StatelessWidget {
  final Dish dish;
  DishCard(this.dish);
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 3,
      child: Container(
        width: MediaQuery.of(context).size.width * (70 / 100),
        decoration: BoxDecoration(
        //  shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(10)
          
        ),
        child: Column(
          children: <Widget>[
            Flexible(
              child: Image.network(
                this.dish.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                dish.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}