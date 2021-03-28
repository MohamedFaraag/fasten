import 'package:flutter/material.dart';

import '../Helpers/size_conifg.dart';
import '../Screens/NavgatorForSettings/lang.dart';
import '../Widget/myAppBar.dart';
import '../Widget/ProfileText.dart';
import '../Helpers/images.dart';

import 'Profile.dart';

class Settings extends StatelessWidget {
  static String routeName = '/Settings';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: myAppBar(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(ProFile.routeName);
          },
          name: 'Settings',
          iset: true),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ahmed Hassan'),
                      Text('anwarahmed@gmail.com'),
                    ],
                  ),
                  CircleAvatar(
                    radius: getProportionateScreenWidth(30),
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
                    radius: getProportionateScreenWidth(40),
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
              height: getProportionateScreenHeight(250),
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, Language.routeName);
                    },
                    child: CustomTextProfiel(
                      name: 'Language',
                    ),
                  ),
                  CustomTextProfiel(
                    name: 'Complaints and suggestions',
                  ),
                  CustomTextProfiel(
                    name: 'Terms and Conditions',
                  ),
                  CustomTextProfiel(
                    name: 'About the platform',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(70),
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    height: getProportionateScreenHeight(50),
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
