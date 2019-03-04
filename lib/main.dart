import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodtrucks/pages/account/account.dart';
import 'package:foodtrucks/pages/home/home.page.dart';
import 'package:foodtrucks/scoped-models/main.model.dart';
import 'package:foodtrucks/theme.dart';
import 'package:scoped_model/scoped_model.dart';

void main(){
 // debugPaintSizeEnabled = true;
  runApp(MyApp());
 
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: MainModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: getThemeData(),
        home: HomePage(),
        routes: {
          "/account": (context) => Account()
        },
        
       // MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}


/*

routes: {
        //'/': (context) => Home(),
        '/foodTruck': (context) => UserLogin(),
      // '/foodTruck': (context) => Home(),
       '/restaurant': (context) => Restaurant()
      // '/checkout':(context) => Checkout(),
       },

       */
