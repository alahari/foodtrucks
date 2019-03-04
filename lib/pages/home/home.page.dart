import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodtrucks/pages/account/account.dart';
import 'package:foodtrucks/pages/home/dishes.list.dart';
import 'package:foodtrucks/pages/home/restaurant.list.dart';
import 'package:foodtrucks/pages/order/orders.page.dart';

enum bottom_nav_tabs { Home, Orders, Account }

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bottom_nav_tabs currentTab = bottom_nav_tabs.Home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: ()
            {
              showSearch(context: context,delegate: DishSearchDelegate());
            },

          )
        ],
      ),
      body: getBodyWidget(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.truck), title: Text('Trucks')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Account'))
        ],
      ),
    );
  }

  Widget getBodyWidget() {
    if (currentTab == bottom_nav_tabs.Account) {
      return Account();
    } else if (currentTab == bottom_nav_tabs.Orders) {
      return Orders();
    } else {
      // return DishesList();
      return Container(
          height: 280,
          // width: 300,
          //child: RestaurantsList());
          child: Text('Hello'));
    }
  }

  void onTabTapped(int index) {
    setState(() {
      if (index == 1) {
        currentTab = bottom_nav_tabs.Orders;
        print("Orders");
      } else if (index == 2) {
        currentTab = bottom_nav_tabs.Account;
        print("Account");
      } else {
        currentTab = bottom_nav_tabs.Home;
        print("Home");
      }
    });
  }
}


class DishSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(
      icon: Icon(Icons.clear),
      onPressed: (){
         query = '';
      },
    ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    print('build results ');
    return Column(
      children: <Widget>[
        Text('result1'),
        Text('result2')
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('Title'),
          subtitle: Text('Sub Title'),
          onTap: (){
            showResults(context);
          },
        )
      ],
      
    );
  }

}