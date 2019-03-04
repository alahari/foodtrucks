import 'package:flutter/material.dart';
import 'package:foodtrucks/services/restaurant.service.dart';

class DishesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 300,
      // width: MediaQuery.of(context).size.width*(70/100),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          new DishCard(),
          new DishCard(),
        ],
      ),
    );
  }
}

class DishCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: ClipRRect(
            child: Image.asset(
              'assets/biriyani.jpg',
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Chennai Express - Alpharetta',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Chicken Biriyani',
          style: TextStyle(
            color: Colors.red[500],
          ),
        ),
        RaisedButton(
          onPressed: (){
              printMyName();
          },
          child: Text('Click Me !!'),
        )
      ],
      
    );
  }

  Future<void> printMyName() async {
   // RestaurantService service = new RestaurantService.instance();
         //String nameMe =    await service.getRestaurantsList();
            print('Great Job !!!');
  }
}
