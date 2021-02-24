import 'package:flutter/material.dart';

import '../Helpers/images.dart';
import '../Helpers/size_conifg.dart';
import '../Screens/Finish.dart';
import '../Widget/Buttons.dart';

class Regeister extends StatelessWidget {
  static String routeName = '/regiester';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
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
        height: getProportionateScreenHeight(790),
        width: double.infinity,
        // color: Colors.black,
        padding: EdgeInsets.all(15.0),
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(woImage),
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New account',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5.5),
                      ),
                      Text(
                        'Add your account data',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(31.5),
                      ),
                      Text(
                        'Name *',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.5),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.black,
                            contentPadding: EdgeInsets.all(10),
                            hintText: 'name',
                            suffixIcon: Icon(Icons.account_circle_rounded),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(15),
                      ),
                      Text(
                        'E-mail *',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.5),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.black,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.black,
                            contentPadding: EdgeInsets.all(10),
                            hintText: 'ex@email',
                            suffixIcon: Icon(Icons.mail),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(15),
                      ),
                      Text(
                        'Country *',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.5),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          cursorColor: Colors.black,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.black,
                            contentPadding: EdgeInsets.all(10),
                            hintText: 'Saudi',
                            suffixIcon: Icon(Icons.location_city),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(15),
                      ),
                      Text(
                        'City *',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.5),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.black,
                            contentPadding: EdgeInsets.all(10),
                            hintText: 'Riyadh',
                            suffixIcon: Icon(Icons.flag),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(15),
                      ),
                      Text(
                        'Password *',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.5),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          cursorColor: Colors.black,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.black,
                            contentPadding: EdgeInsets.all(10),
                            hintText: '*****',
                            suffixIcon: Icon(Icons.visibility),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(15),
                      ),
                      Text(
                        'Confirm password *',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.5),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          cursorColor: Colors.black,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.black,
                            contentPadding: EdgeInsets.all(10),
                            hintText: '*****',
                            suffixIcon: Icon(Icons.visibility),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Button(
                        textButton: 'Create an account',
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(Finish.routeName);
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    )));
  }
}
