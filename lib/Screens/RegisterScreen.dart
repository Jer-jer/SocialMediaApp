import 'package:FinalsProject/UI/CustomButton.dart';
import 'package:FinalsProject/UI/CustomInputfield.dart';
import 'package:FinalsProject/UI/CustomPadding.dart';
import 'package:FinalsProject/UI/LabelText.dart';
import 'package:FinalsProject/services/auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //textfield state
  String fullname = "";
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(4283411658),
            child: Center(
              child: Container(
                width: 400,
                height: 700,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/logo.png',
                        width: 150,
                        height: 150,
                      ),
                      LabelText(
                          'WE WELCOME YOU', 20.0, 'RockSalt', Alignment.center),
                      CustomPadding(7.0),
                      LabelText('Full Name', 17.0, '', Alignment.centerLeft),
                      CustomPadding(3.0),
                      Container(
                        width: 350,
                        height: 60,
                        child: TextFormField(
                          decoration: InputDecoration(
                            helperText: '',
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                            ),
                          ),
                          validator: (val) => val.isEmpty
                              ? 'Enter name btch dont be secretive'
                              : null,
                          onChanged: (val) {
                            setState(() => fullname = val);
                          },
                        ),
                      ),
                      CustomPadding(4.0),
                      LabelText(
                          'Email Address', 17.0, '', Alignment.centerLeft),
                      CustomPadding(3.0),
                      Container(
                        width: 350,
                        height: 60,
                        child: TextFormField(
                          decoration: InputDecoration(
                            helperText: '',
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                            ),
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter Email btch' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                      ),
                      CustomPadding(4.0),
                      LabelText('Password', 17.0, '', Alignment.centerLeft),
                      CustomPadding(3.0),
                      Container(
                        width: 350,
                        height: 60,
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            helperText: '',
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                            ),
                          ),
                          validator: (val) => val.length <= 8
                              ? 'put 8 or more chars btch'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(left: 20.0)),
                          CustomButton('Already a member?', 15.0, '',
                              Alignment.centerLeft, '/', Colors.white),
                          Padding(padding: EdgeInsets.only(left: 40.0)),
                          Container(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                              child: Text('Register'),
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
                                  dynamic result = await _auth.register(
                                      fullname, email, password);
                                  if (result != null) {
                                    Navigator.pushReplacementNamed(
                                        context, '/registered');
                                  }
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
