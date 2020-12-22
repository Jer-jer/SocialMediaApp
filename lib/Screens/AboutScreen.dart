import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
            'ABOUT US',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'RockSalt',
            ),
          ),
          backgroundColor: Colors.lightBlue[300],
          elevation: 0.0,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'About Us',
                style: TextStyle(
                  fontFamily: 'RockSalt',
                  fontSize: 35.0,
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 1.5,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                  style: TextStyle(
                    fontFamily: 'Thasadith',
                    fontSize: 20.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  style: TextStyle(
                    fontFamily: 'Thasadith',
                    fontSize: 20.0,
                  ),
                ),
              ),
              Stack(
                children: <Widget>[
                  Positioned(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 100, left: 62.5),
                          child: Text(
                            'BAZ',
                            style: TextStyle(
                              fontFamily: 'RockSalt',
                              fontSize: 35.0,
                            ),
                          ),
                        ),
                        Image.asset(
                          'images/logo.png',
                          width: 200,
                          height: 200,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Text(
                'WE WANT YOUR SOCIAL LIFE TO BE ONE OF A KIND',
                style: TextStyle(fontFamily: 'Rocksalt', fontSize: 10.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
