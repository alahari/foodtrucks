import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  AuthService({@required this.googleSignIn, @required this.firebaseAuth});
  AuthService.instance()
      : googleSignIn = GoogleSignIn(),
        firebaseAuth = FirebaseAuth.instance;

  final GoogleSignIn googleSignIn;
  final FirebaseAuth firebaseAuth;

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =await googleSignInAccount.authentication;
    await firebaseAuth.signInWithGoogle(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken
    );
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
