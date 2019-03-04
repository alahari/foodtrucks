import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodtrucks/services/auth.service.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

enum Status { Unauthenticated, Unregistered, Authenticated }

class UserModel extends Model {
  static Status _status =Status.Unauthenticated;
  final AuthService authService;
  final FirebaseAuth firebaseAuth;
  static FirebaseUser firebaseUser;

  UserModel.instance():firebaseAuth = FirebaseAuth.instance,authService = AuthService.instance(){
    this.firebaseAuth.onAuthStateChanged.listen(_onAuthStateChanged);
  }

  Future<void> signOut(){
    authService.googleSignIn.signOut();
    return firebaseAuth.signOut();
     
  }
  Future<void> googleSignIn() {
    return authService.signInWithGoogle();
  }

  Status getStatus(){
    print(_status);
    return _status;
  }

  FirebaseUser getFireBaseUser(){
    return firebaseUser;
  }

  Future<void> _onAuthStateChanged(FirebaseUser firebaseUser) async {
    if(firebaseUser ==null){
      print("Got firebase user null");
      _status =Status.Unauthenticated;
    }else {
        print("user "+firebaseUser.displayName);
        _status =Status.Authenticated;
        firebaseUser =firebaseUser;
    }
    notifyListeners();
  }

  static UserModel of(BuildContext context) => ScopedModel.of<UserModel>(context,rebuildOnChange: true);
}

//static CurrentUserModel of(BuildContext context) =>
  //    ScopedModel.of<CurrentUserModel>(context);

/* 

Future<void> _onAuthStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _firebaseUser = null;
      _user = null;
      _status = Status.Unauthenticated;
    } else {
      if (firebaseUser.uid != _firebaseUser?.uid) {
        _firebaseUser = firebaseUser;
      }
      _status = Status.Unregistered;
      if (firebaseUser.uid != _user?.id) {
        _user = await userService.getById(_firebaseUser.uid);
      }
      if (_user != null) {
        _status = Status.Authenticated;
      }
    }

    notifyListeners();
    _listenToUserChanges();
  }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../services/auth_service.dart';
import '../services/user_service.dart';
import 'user.dart';

enum Status {
  Unauthenticated,
  Unregistered,
  Authenticated,
}

class CurrentUserModel extends Model {
  CurrentUserModel({
    @required this.firestore,
    @required this.firebaseAuth,
    @required this.userService,
  });

  CurrentUserModel.instance()
      : firestore = Firestore.instance,
        firebaseAuth = FirebaseAuth.instance,
        userService = UserService.instance(),
        authService = AuthService.instance() {
    firebaseAuth.onAuthStateChanged.listen(_onAuthStateChanged);
  }

  Status _status = Status.Unauthenticated;
  Firestore firestore;
  FirebaseAuth firebaseAuth;
  UserService userService;
  User _user;
  FirebaseUser _firebaseUser;
  AuthService authService;

  static CurrentUserModel of(BuildContext context) =>
      ScopedModel.of<CurrentUserModel>(context);

  User get user => _user;
  Status get status => _status;
  FirebaseUser get firebaseUser => _firebaseUser;

  Future<void> signIn() {
    return authService.signInWithGoogle();
  }

  Future<void> signOut() {
    return firebaseAuth.signOut();
  }

  Future<void> register(Map<String, String> formData) async {
    await userService.createUser(_firebaseUser.uid, formData);
  }

  

  void _onUserDocumentChange(DocumentSnapshot snapshot) {
    if (snapshot.exists) {
      _user = User.fromDocumentSnapshot(snapshot.documentID, snapshot.data);
      _status = Status.Authenticated;
    } else {
      _user = null;
      _status = Status.Unregistered;
    }
    notifyListeners();
  }

  void _listenToUserChanges() {
    if (_firebaseUser == null) {
      return;
    }
    // TODO(abraham): Does this need any cleanup if uid changes?
    firestore
        .collection('users')
        .document(_firebaseUser.uid)
        .snapshots()
        .listen(_onUserDocumentChange);
  }
}




*/
