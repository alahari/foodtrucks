import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodtrucks/const.dart';
import 'package:foodtrucks/models/restaurant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class NewRestaurant extends StatefulWidget {
  _NewRestaurantState createState() => _NewRestaurantState();
}

class _NewRestaurantState extends State<NewRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New Restaurant'),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: RestaurantForm()),
        ));
  }
}

class RestaurantForm extends StatefulWidget {
  final Widget child;

  RestaurantForm({Key key, this.child}) : super(key: key);

  _RestaurantFormState createState() => _RestaurantFormState();
}

class _RestaurantFormState extends State<RestaurantForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File imageLocation;
  Restaurant _restaurant = new Restaurant();
  bool progressIndicator = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Stack(
          children: <Widget>[
            this.progressIndicator
                ? Positioned(
                    height: (MediaQuery.of(context).size.height) / 2,
                    width: (MediaQuery.of(context).size.width),
                    child: Center(
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator(
                            backgroundColor: Colors.red,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.green)),
                      ),
                    ),
                  )
                : new Container(),
            Column(
              children: <Widget>[
                TextFormField(
                  // decoration: const In,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (name) {
                    if (name.trim().isEmpty)
                      return "Restaurant name is required";
                  },
                  onSaved: (name) {
                    _restaurant.name = name;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Address1'),
                  validator: (address1) {
                    if (address1.trim().isEmpty) return 'Address is required';
                  },
                  onSaved: (address1) {
                    _restaurant.address1 = address1;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Address2'),
                  onSaved: (address2) {
                    _restaurant.address2 = address2;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'pincode'),
                  validator: (pincode) {
                    if (pincode.trim().isEmpty) return 'Pincode is required ';
                  },
                  onSaved: (pincode) {
                    _restaurant.pincode = pincode;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 100,
                  child: Row(
                    children: <Widget>[
                      FlatButton(
                        child: imageLocation == null
                            ? Text('Select Image')
                            : Text('Change Image'),
                        textColor: Colors.blueAccent,
                        onPressed: getImage,
                      ),
                      imageLocation == null
                          ? Container()
                          : Flexible(child: Image.file(imageLocation))
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Spacer(),
                    OutlineButton(
                      highlightedBorderColor: Colors.black,
                      child: Text('Add'),
                      onPressed: postRestaurant,
                    )
                  ],
                )
              ],
            ),
          ],
        ));
  }

  Future<void> getImage() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageLocation = imageFile;
    });
  }

  Future<dynamic> uploadImage() async {
    final StorageReference ref =
        FirebaseStorage.instance.ref().child(basename(imageLocation.path));

    final StorageUploadTask task = ref.putFile(imageLocation);

    var downloadUri = (await task.onComplete).ref.getDownloadURL();
    return downloadUri;
  }

  postRestaurant() {
    bool isValid = this._formKey.currentState.validate();

    if (isValid) {
      
      setState(() {
        this.progressIndicator = true;
      });

      this._formKey.currentState.save();
      uploadImage().then((downloadUrl) {
        this._restaurant.imageName = downloadUrl;
        Firestore.instance
            .collection(Constants.restaurantDocPath)
            .add(_restaurant.toJson())
            .then((ref) {
          setState(() {
            this.progressIndicator = false;
          });
        });
      });
    }
  }
}
