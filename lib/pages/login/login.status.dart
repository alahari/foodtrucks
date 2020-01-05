import 'package:flutter/material.dart';
import 'package:foodtrucks/scoped-models/main.model.dart';
import 'package:foodtrucks/scoped-models/user.model.dart';
import 'package:scoped_model/scoped_model.dart';

class UserStatus extends StatefulWidget {
  _UserStatusState createState() => _UserStatusState();
}

class _UserStatusState extends State<UserStatus> {
  @override
  Widget build(BuildContext context) {
      UserModel model = ScopedModel.of<MainModel>(context).userModel;

    return Scaffold(
      appBar: AppBar(title: Text('Nice !!!'),),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('ClickMe'),
            onPressed: (){
           //  _status =  model.getStatus().toString();
             setState(() {
               
             });
            },
          ),
          Text('superb !!!'+model.getStatus().toString())
        ],
      ) 
      
    );
  }
}