import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodtrucks/models/restaurant.dart';
import 'package:foodtrucks/const.dart';
class RestaurantService {
  final Firestore firestore;
  List<Restaurant> _restaurantsList = [];

  RestaurantService.instance() : firestore = Firestore.instance;
  
  List<Restaurant> getRestaurantsList()  {
    print("Hello");
    firestore.collection(Constants.restaurantDocPath).snapshots().listen((data){
      data.documents.forEach((document){
        Restaurant rest = new Restaurant();
        rest.name = document['name'];
       print("Venki");
       print(document['name']);
       _restaurantsList.add(rest);
      }
      
      );
    });
    return _restaurantsList;

  }

}

/* 


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  AuthService({
    @required this.googleSignIn,
    @required this.firebaseAuth,
  });

  AuthService.instance()
      : googleSignIn = GoogleSignIn(),
        firebaseAuth = FirebaseAuth.instance;

  final GoogleSignIn googleSignIn;
  final FirebaseAuth firebaseAuth;

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount googleAccount = await googleSignIn.signIn();
    // TODO(abraham): Handle null googleAccount
    final GoogleSignInAuthentication googleAuth =
        await googleAccount.authentication;
    await firebaseAuth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
  }
}
 */
