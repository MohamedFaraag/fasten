import 'package:flutter/material.dart';
import 'package:fasten/Helpers/images.dart';
import 'package:fasten/Helpers/size_conifg.dart';
import 'package:fasten/Screens/Home.dart';
import 'package:fasten/Screens/Profile.dart';
import 'package:fasten/Widget/Buttons.dart';
import 'package:fasten/Widget/myAppBar.dart';

class EditProFile extends StatelessWidget {
  static String routeName = '/EditProfile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(ProFile.routeName);
            },
            name: ''),
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
                    Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: getProportionateScreenWidth(30),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.transparent,
                            child: Image.asset(
                              profileImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text('Ahmed Hassan'),
                          Text('anwarahmed@gmail.com'),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            textButton: 'Save',
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(Home.routeName);
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
