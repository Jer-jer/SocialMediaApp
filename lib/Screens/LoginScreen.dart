import 'package:FinalsProject/UI/CustomButton.dart';
import 'package:FinalsProject/UI/CustomInputfield.dart';
import 'package:FinalsProject/UI/CustomPadding.dart';
import 'package:FinalsProject/UI/LabelText.dart';
import 'package:FinalsProject/services/auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();

  //textfield state
  String email = "";
  String username = "";
  String password = "";

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
                height: 500,
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
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20.0),
                          Container(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "Email",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                              ),
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            ),
                            width: 250,
                            height: 40,
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Password",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                              ),
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                            ),
                            width: 250,
                            height: 40,
                          ),
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
                    Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 10.0)),
                        CustomButton('Not yet a member?', 15.0, '',
                            Alignment.centerLeft, '/register', Colors.white),
                        Padding(padding: EdgeInsets.only(left: 100.0)),
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
                            print(email);
                            print(password);
                          },
                        ),
                        // CustomButton('Login', 25.0, 'RockSalt',
                        //     Alignment.centerRight, '/dashboard', Colors.white),
                      ],
                    ),
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
