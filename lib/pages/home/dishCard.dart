import 'package:flutter/material.dart';

class DishCard extends StatelessWidget {
  //final String restaurnatName;

  Widget getImageSection(imageUrl) {
    return new Image(
      image: new AssetImage(imageUrl),
    );
  }

  Widget dishImageSection = new Image(
    image: new AssetImage('assets/biriyani.jpg'),
  );

  Widget dishDescSection = new Container(
    padding: const EdgeInsets.all(1.0),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                ]),
          ),
        ),
        Text('10\$'),
        Icon(Icons.star),
        Text('4.6')
      ],
    ),
  );

  // DishCard(this.dish, this.restaurnatName);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
          child: Container(
            width: MediaQuery.of(context).size.width * (50 / 100),

            //  height: 00.0,
            //  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            color: Colors.red,
            child: Column(
              children: <Widget>[
                //getImageSection(this.dish.imageUrl),
                dishDescSection
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  //builder: (context) => TrucksList(this.dish),
                  ),
            );
          }),
    );
  }
}
