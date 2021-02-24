import 'package:flutter/material.dart';

import '../Screens/Home.dart';
import '../Helpers/images.dart';
import '../Helpers/size_conifg.dart';
import '../Widget/Buttons.dart';

class SingoutConfirm extends StatelessWidget {
  static String routeName = '/SingoutConfirm';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // color: Color(0xFFFFFFFF),
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
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: getProportionateScreenHeight(152),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(120),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(woImage),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white,
                              offset: Offset(0.7, 0.7),
                              blurRadius: 2.0,
                              spreadRadius: 0.2),
                        ],
                      ),
                      padding: EdgeInsets.all(15.0),
                      height: getProportionateScreenHeight(600),
                      width: double.infinity,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.topRight,
                              height: getProportionateScreenHeight(20),
                              width: double.infinity,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed(Home.routeName);
                                },
                                child: Icon(
                                  Icons.close,
                                  size: 30,
                                ),
                              ),
                            ),
                            Container(
                              height: getProportionateScreenHeight(100),
                            ),
                            Container(
                              height: getProportionateScreenHeight(110),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(sc),
                                ),
                              ),
                            ),
                            Text(
                              'Exit !',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFB83B5E),
                              ),
                            ),
                            Text(
                              'Do you want out of dresses',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: getProportionateScreenWidth(17),
                              ),
                            ),
                            Button(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed(Home.routeName);
                              },
                              textButton: 'Continuation',
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(30),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
