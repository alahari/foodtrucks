import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodtrucks/pages/account/account.dart';
import 'package:foodtrucks/pages/home/home.page.dart';
import 'package:foodtrucks/pages/restaurant/restaurant.new.dart';
import 'package:foodtrucks/pages/samples/pokiman.dart';
import 'package:foodtrucks/scoped-models/main.model.dart';
import 'package:foodtrucks/theme.dart';
import 'package:scoped_model/scoped_model.dart';

void main(){
 // debugPaintSizeEnabled = true;
  runApp(MyApp());
 
} 


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: MainModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: getThemeData(),
        home: 
       // Pokiman(),

        
        HomePage(),

        routes: {
          "/account": (context) => Account(),
          "/restaurant": (context) => NewRestaurant()
        },
        
       // MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }

}


