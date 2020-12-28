import 'package:FinalsProject/UI/CustomButton.dart';
import 'package:FinalsProject/UI/CustomInputfield.dart';
import 'package:FinalsProject/UI/CustomPadding.dart';
import 'package:FinalsProject/UI/LabelText.dart';
import 'package:FinalsProject/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //textfield state
  String email = "";
  String username = "";
  String password = "";
  String err = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(4283411658),
            child: Center(
              child: Container(
                width: 400,
                height:
                    568, //i've been resizing widths, heights and paddings to avoid overflowing
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'images/logo.png',
                      width: 150,
                      height: 150,
                    ),
                    LabelText('BAZ', 40.0, 'RockSalt', Alignment.center),
                    CustomPadding(7.0),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          LabelText('Email', 17.0, '', Alignment.centerLeft),
                          CustomPadding(5.0),
                          Container(
                            width: 350,
                            height: 40,
                            child: Material(
                              elevation: 5.0,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              child: TextFormField(
                                validator: (val) =>
                                    val.isEmpty ? 'Enter Email btch' : null,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                              ),
                            ),
                          ),
                          CustomPadding(10.0),
                          LabelText('Password', 17.0, '', Alignment.centerLeft),
                          CustomPadding(5.0),
                          Container(
                            width: 350,
                            height: 40,
                            child: Material(
                              elevation: 5.0,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              child: TextFormField(
                                validator: (val) => val.length <= 8
                                    ? 'put 8 or more chars btch'
                                    : null,
                                obscureText: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Padding(padding: EdgeInsets.only(left: 5.0)),
                              CustomButton(
                                  'Not yet a member?',
                                  15.0,
                                  '',
                                  Alignment.centerLeft,
                                  '/register',
                                  Colors.white),
                              Padding(padding: EdgeInsets.only(left: 43.0)),
                              TextButton(
                                child: Text('Login'),
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: 'RockSalt',
                                  ),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    dynamic result =
                                        await _auth.login(email, password);
                                    if (result == null) {
                                      setState(() => err =
                                          "Not signed in with those shitty ass credentials");
                                    } else {
                                      Navigator.pushReplacementNamed(
                                          context, '/dashboard');
                                    }
                                  }
                                },
                              ),
                              // CustomButton('Login', 25.0, 'RockSalt',
                              //     Alignment.centerRight, '/dashboard', Colors.white),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            err,
                            style: TextStyle(color: Colors.red, fontSize: 5),
                          )
                        ],
                      ),
                    ),
                    // LabelText('Email/Username/PhoneNumber', 17.0, '',
                    //     Alignment.centerLeft),
                    // CustomPadding(5.0),
                    // CustomInputfield(),
                    // CustomPadding(10.0),
                    // LabelText('Password', 17.0, '', Alignment.centerLeft),
                    // CustomPadding(5.0),
                    // CustomInputfield(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
