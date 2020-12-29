import 'package:FinalsProject/UI/CustomPadding.dart';
import 'package:FinalsProject/UI/Text2.dart';
import 'package:FinalsProject/models/user.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:FinalsProject/services/database.dart';
import 'package:provider/provider.dart';
import 'package:FinalsProject/services/auth.dart';
import 'dart:io';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final FirebaseStorage _storage = FirebaseStorage.instanceFor(
      bucket: 'gs://socialmediadb-7552c.appspot.com');
  File _image;

  Future getImage() async {
    final imagePicker = ImagePicker();
    PickedFile picked = await imagePicker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(picked.path);
      UploadTask _uploadTask;
      String filename = basename(_image.path);
      setState(() {
        _uploadTask = _storage.ref().child(filename).putFile(_image);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context, listen: false);
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
        body: StreamBuilder<Object>(
            stream: Database(uid: user.uid).userData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                UserData userData = snapshot.data;
                return SingleChildScrollView(
                  child: Builder(
                    builder: (context) => Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 100.0),
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
                          Text2(userData.fullname, 13.0),
                          CustomPadding(10.0),
                          Text2('Age', 25.0),
                          CustomPadding(5.0),
                          Text2(userData.age, 13.0),
                          CustomPadding(10.0),
                          Text2('Address', 25.0),
                          CustomPadding(5.0),
                          Text2(userData.address, 13.0),
                          CustomPadding(20.0),
                          // CustomButton('Edit', 25.0, 'Thasadith', Alignment.bottomCenter,
                          //     '', Colors.blue),
                          Container(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: TextButton(
                                onPressed: () {
                                  createAlertDialog(context);
                                },
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
                );
              }
            }),
      ),
    );
  }

  Future<String> createAlertDialog(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final AuthService _auth = AuthService();
    final user = Provider.of<TheUser>(context, listen: false);

    String fullname = "";
    String address = "";
    String age = "";

    return showDialog(
      context: context,
      builder: (context) {
        return StreamBuilder<UserData>(
          stream: Database(uid: user.uid).userData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              UserData userData = snapshot.data;
              return Form(
                key: _formKey,
                child: AlertDialog(
                  titlePadding: EdgeInsets.all(10.0),
                  title: Text('Edit Details'),
                  content: SizedBox(
                    height: 190,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Enter Something' : null,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            hintText: userData.fullname,
                          ),
                          onChanged: (val) {
                            setState(() => fullname = val);
                          },
                        ),
                        TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Enter Something' : null,
                          decoration: InputDecoration(
                            labelText: 'Address',
                          ),
                          onChanged: (val) {
                            setState(() => address = val);
                          },
                        ),
                        TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Enter Something' : null,
                            decoration: InputDecoration(
                              labelText: 'Age',
                              hintText: userData.age,
                            ),
                            onChanged: (val) {
                              setState(() => age = val);
                            }),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    MaterialButton(
                      onPressed: () async {
                        dynamic result = _auth.delete();
                        if (result != null) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/', (_) => false);
                        } else {
                          print("something is wrong");
                        }
                      },
                      elevation: 5.0,
                      child: Text('Delete'),
                    ),
                    MaterialButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await Database(uid: userData.uid).updateUser(
                              fullname, age, address, userData.email);
                          Navigator.of(context).pop();
                        }
                      },
                      elevation: 5.0,
                      child: Image.asset(
                        'images/enter(4FACCA).png',
                        width: 30.0,
                        height: 30.0,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        );
      },
    );
  }
}
