import 'package:FinalsProject/UI/CustomButton.dart';
import 'package:FinalsProject/UI/CustomPadding.dart';
import 'package:FinalsProject/UI/Text2.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  File _image;

  Future getImage() async {
    final imagePicker = ImagePicker();
    PickedFile picked = await imagePicker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(picked.path);
    });
  }

  // Future uploadPic(BuildContext context) async {
  //   String filename = basename(_image.path);
  //   final Reference firebaseStorage =
  //       FirebaseStorage.instance.ref().child('images/$filename');
  //   final UploadTask uploadTask = firebaseStorage.putFile(_image);
  //   await uploadTask.whenComplete(() {
  //     setState(() {
  //       Scaffold.of(context).showSnackBar(SnackBar(
  //         content: Text('Profile Picture Uploaded'),
  //       ));
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pushNamed('/dashboard');
            },
          ),
          title: Text(
            'ACCOUNT SETTINGS',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'RockSalt',
            ),
          ),
          backgroundColor: Color(4283411658),
          elevation: 0.0,
        ),
        body: Builder(
          builder: (context) => Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 50.0),
                    ),
                    CircleAvatar(
                      radius: 100,
                      backgroundColor: Color(4283411658),
                      child: ClipOval(
                        child: SizedBox(
                          width: 180.0,
                          height: 180.0,
                          child: (_image != null)
                              ? Image.file(_image, fit: BoxFit.fill)
                              : Image.network(
                                  'https://manila-wine.com/media/catalog/product/r/e/red-label-700ml.jpg',
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 60.0),
                      child: IconButton(
                        icon: Icon(Icons.camera),
                        iconSize: 30.0,
                        color: Color(4283411658),
                        onPressed: () {
                          getImage();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Text2('Full Name', 25.0),
                CustomPadding(5.0),
                Text2('Get Data From Database', 13.0),
                CustomPadding(10.0),
                Text2('Password', 25.0),
                CustomPadding(5.0),
                Text2('Get Data From Database', 13.0),
                CustomPadding(10.0),
                Text2('Email Address', 25.0),
                CustomPadding(5.0),
                Text2('Get Data From Database', 13.0),
                CustomPadding(20.0),
                // CustomButton('Edit', 25.0, 'Thasadith', Alignment.bottomCenter,
                //     '', Colors.blue),
                Container(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.blue,
                          fontFamily: 'Thasadith',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
