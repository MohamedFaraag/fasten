import 'package:flutter/material.dart';
import 'package:fasten/Helpers/images.dart';
import 'package:fasten/Helpers/size_conifg.dart';
import 'package:fasten/Widget/ProfileText.dart';

import '../Settings.dart';

class Language extends StatelessWidget {
  static String routeName = '/Language';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'Language',
            style: TextStyle(color: Colors.black),
          ),
          leading: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, Settings.routeName);
              },
              child: Image.asset(signout))),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFFB83B5E),
                    Color(0xFFFE7680),
                  ],
                ),
              ),
              width: double.infinity,
              height: getProportionateScreenHeight(100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('Edit'),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(100),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ahmed Hassan'),
                      Text('anwarahmed@gmail.com'),
                    ],
                  ),
                  CircleAvatar(
                    radius: 45,
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      profileImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            Container(
              height: getProportionateScreenHeight(100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      sidImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  CircleAvatar(
                    radius: 60,
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    child: Stack(
                      children: [
                        Image.asset(
                          sideImage2,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            Container(
              height: getProportionateScreenHeight(150),
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextProfiel(
                    name: 'Arabic',
                  ),
                  CustomTextProfiel(
                    name: 'English',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(200),
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(set))),
                  ),
                  Text(
                    'Designed and implemented by Osoul Tech',
                    style: TextStyle(color: Color(0xFF777777)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
