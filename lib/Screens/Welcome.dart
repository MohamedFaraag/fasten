import 'package:flutter/material.dart';
import 'package:fasten/Screens/Home.dart';
import 'package:fasten/Screens/SingUp.dart';

import '../Screens/Login.dart';
import '../Helpers/images.dart';
import '../Helpers/size_conifg.dart';
import '../Widget/Buttons.dart';

class Welcome extends StatelessWidget {
  static String routeName = '/welcome';
  @override
  Widget build(BuildContext context) {
    //To fix bug in getProportionateScreenHeight Function
    SizeConfig().init(context);
    return Scaffold(
      // appBar: AppBar(
      //       //   backgroundColor:  Color(0xFFEFE0E4),
      //       //   elevation: 0.0,
      //       //   title: Text("Hai"),
      //       // ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFEFE0E4),
            Color(0xFFEFE0E4),
            Color(0xFFEFE0E4),
          ],
        )),
        padding: EdgeInsets.all(15.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(woImage),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  Container(
                    height: getProportionateScreenHeight(120),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(welcomeImage),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome to Dresses',
                            style: TextStyle(
                                fontSize: 21,
                                color: Color(0xFF000000),
                                // fontFamily: 'DIN Next LT Arabic',
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(15),
                          ),
                          Text(
                            "Lorem Ipsum is a method for writing text in graphic design commonly used to illustrate the visual appearance of a document",
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Button(
                          textButton: 'Login',
                          onPressed: () {
                            print('Loing');
                            Navigator.of(context)
                                .pushReplacementNamed(Login.routeName);
                          },
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(15),
                        ),
                        Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: Color(0xFFB83B5E), width: 2),
                            color: Color(0xFFEFE0E4),
                          ),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            elevation: 0.0,
                            color: Color(0xFFEFE0E4),
                            onPressed: () {
                              print('SingUp');
                              Navigator.of(context)
                                  .pushReplacementNamed(SingUp.routeName);
                            },
                            child: Text(
                              'SingUp',
                              style: TextStyle(
                                  color: Color(0xFFB83B5E), fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('visitor');
                      Navigator.of(context)
                          .pushReplacementNamed(Home.routeName);
                    },
                    child: Text(
                      'Log in as a visitor',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xFF333333),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
