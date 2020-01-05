import 'package:flutter/material.dart';
import 'package:foodtrucks/pages/login/login.status.dart';
import 'package:foodtrucks/scoped-models/main.model.dart';
import 'package:foodtrucks/scoped-models/user.model.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('DashBoard'),),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('Google Login'),
            onPressed: (){
               final UserModel model =  MainModel().userModel;
               model.googleSignIn();
               Navigator.push(context, MaterialPageRoute(builder: (context) => UserStatus()));
              
            },
          ),
          RaisedButton(
           child: Text('Logout'),
           onPressed: (){
            MainModel().userModel.signOut(); 
           },
          ),
          Text('superb !!!'+MainModel().userModel.getStatus().toString())
        ],
      
      )
    );
  }
}



/*


import 'package:flutter/material.dart';

import 'models/current_user_model.dart';
import 'models/user.dart';
import 'pages/register_page.dart';

class SignInFab extends StatelessWidget {
  const SignInFab();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => _handleSignIn(context),
      icon: Image.asset('assets/google_g_logo.png', height: 24.0),
      label: const Text('Sign in with Google'),
    );
  }

  Future<void> _handleSignIn(BuildContext context) async {
    final CurrentUserModel currentUserModel = CurrentUserModel.of(context);
    await currentUserModel.signIn();
    if (currentUserModel.status == Status.Unregistered) {
      _navigateToRegistration(context);
    } else if (currentUserModel.status == Status.Authenticated) {
      final User user = currentUserModel.user;
      _showSnackBar(context, 'Welcome ${user.fullName}');
    }
  }

  void _showSnackBar(BuildContext context, String msg) {
    final SnackBar snackBar = SnackBar(content: Text(msg));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void _navigateToRegistration(BuildContext context) {
    Navigator.pushNamed(context, RegisterPage.routeName);
  }
} */