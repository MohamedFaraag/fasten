import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helpers/images.dart';
import '../Screens/Boob.dart';
import '../Screens/Home.dart';
import '../Screens/Welcome.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/SplashScreen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _token;
  String massage = '';
  bool direction;
  _getbool() async {
    final SharedPreferences prefsfor = await SharedPreferences.getInstance();

    direction = prefsfor.getBool('x');
    _getToke();
  }

  @override
  void initState() {
    _getbool();
    Timer(
      Duration(seconds: 2),
      () {
        (direction == false || direction == null)
            ? Navigator.pushReplacementNamed(context, Boob.routeName)
            : _token == null
                ? Navigator.pushReplacementNamed(context, Welcome.routeName)
                : Navigator.pushReplacementNamed(context, Home.routeName);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(welcomeImage))),
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  Future _getToke() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString('token');
      print(_token);
    });
  }
}
