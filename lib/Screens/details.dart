import 'package:fasten/Helpers/images.dart';
import 'package:fasten/Helpers/size_conifg.dart';
import 'package:fasten/Widget/Buttons.dart';
import 'package:fasten/Widget/CustomButton.dart';
import 'package:fasten/Widget/SelectedColorSmallVer.dart';
import 'package:flutter/material.dart';

import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'Home.dart';

class Detials extends StatefulWidget {
  static String routeName = '/Details';

  @override
  _DetialsState createState() => _DetialsState();
}

class _DetialsState extends State<Detials> {
  var rating = 3.0;
  bool isSet = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: ListView(
            children: [
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: getProportionateScreenHeight(312),
                        width: getProportionateScreenWidth(375),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(fist),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Container(
                        height: getProportionateScreenHeight(112),
                        width: double.infinity,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: ban.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: getProportionateScreenHeight(112),
                                width: getProportionateScreenWidth(112),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      ban[index],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Text(
                        '45 \$',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(20),
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFB83B5E),
                        ),
                      ),
                      Text(
                        'Straight cut dress',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(20),
                            color: Colors.black),
                      ),
                      Text(
                        'Round neck roses',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(20),
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('It is 5 km away'),
                          Text('2 days ago'),
                          Text('255'),
                          Text('Share'),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmoothStarRating(
                            rating: rating,
                            isReadOnly: false,
                            size: getProportionateScreenHeight(25),
                            color: Color(0xFFB83B5E),
                            borderColor: Colors.grey,
                            filledIconData: Icons.star,
                            halfFilledIconData: Icons.star_half,
                            defaultIconData: Icons.star_border,
                            starCount: 5,
                            allowHalfRating: true,
                            spacing: 2.0,
                            onRated: (value) {
                              print("rating value -> $value");
                              // print("rating value dd -> ${value.truncate()}");
                            },
                          ),
                          Text('(Seller Rating)')
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text('Colors'),
                              Container(
                                child: Row(
                                  children: [
                                    //custom
                                    SmallVer(),
                                    SizedBox(
                                      width: getProportionateScreenWidth(3),
                                    ),
                                    SmallVer(),
                                    SizedBox(
                                      width: getProportionateScreenWidth(3),
                                    ),
                                    SmallVer(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Sizes'),
                              Row(
                                children: [
                                  CustomButton(
                                    name: 'XXl',
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(3),
                                  ),
                                  CustomButton(
                                    name: 'XXl',
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(3),
                                  ),
                                  CustomButton(
                                    name: 'XXl',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Button(
                        textButton: 'Talk to the seller',
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(30),
                      ),
                      Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description Adds',
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(16),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                                '5Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy'),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            Text(
                              'Code : ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: getProportionateScreenWidth(18),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(5),
                            ),
                            Text(
                              'Category : ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: getProportionateScreenWidth(18),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(5),
                            ),
                            Text(
                              'Size : ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: getProportionateScreenWidth(18),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(60),
                            ),
                            Text(
                              'Rating ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: getProportionateScreenWidth(21),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(16),
                            ),
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '225 Rate ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: getProportionateScreenWidth(17),
                                    ),
                                  ),
                                  Text(
                                    '4.5 From 5.5 ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: getProportionateScreenWidth(17),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(60),
                            ),
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Similar ads',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            getProportionateScreenWidth(21)),
                                  ),
                                  Text(
                                    'Show more',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                            getProportionateScreenWidth(17),
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: getProportionateScreenHeight(225),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: ban.length,
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                              Detials.routeName);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.5),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.5)),
                                        height:
                                            getProportionateScreenHeight(260),
                                        width: getProportionateScreenWidth(170),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height:
                                                  getProportionateScreenHeight(
                                                      160),
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          ProImage[0]),
                                                      fit: BoxFit.cover)),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Women shoes',
                                                  style: TextStyle(
                                                      fontSize:
                                                          getProportionateScreenWidth(
                                                              12),
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  '300 \$',
                                                  style: TextStyle(
                                                      fontSize:
                                                          getProportionateScreenWidth(
                                                              12),
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            Text('Guess tan'),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomButton(
                                                  name: 'XXl',
                                                ),
                                                CustomButton(name: 'Xl'),
                                                CustomButton(name: 'L'),
                                                SizedBox(
                                                  width:
                                                      getProportionateScreenWidth(
                                                          35),
                                                ),
                                                Container(
                                                  height:
                                                      getProportionateScreenHeight(
                                                          12),
                                                  width:
                                                      getProportionateScreenWidth(
                                                          12),
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Center(
                                                    child: Container(
                                                      height:
                                                          getProportionateScreenHeight(
                                                              3),
                                                      width:
                                                          getProportionateScreenWidth(
                                                              3),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height:
                                                      getProportionateScreenHeight(
                                                          12),
                                                  width:
                                                      getProportionateScreenWidth(
                                                          12),
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Center(
                                                    child: Container(
                                                      height:
                                                          getProportionateScreenHeight(
                                                              3),
                                                      width:
                                                          getProportionateScreenWidth(
                                                              3),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2),
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
                                  ),
                                  Container(
                                    width: getProportionateScreenWidth(170),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Image.asset(sale),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isSet = !isSet;
                                                print(isSet);
                                              });
                                            },
                                            child: Icon(
                                              Icons.favorite,
                                              size: getProportionateScreenWidth(
                                                  20),
                                              color: isSet
                                                  ? Colors.grey
                                                  : Colors.red,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              );
                            }),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed(Home.routeName);
                        },
                        child: Container(
                          height: getProportionateScreenHeight(20),
                          width: getProportionateScreenWidth(20),
                          child: Image.asset(
                            signout,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSet = !isSet;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50.0)),
                          height: getProportionateScreenHeight(50),
                          width: getProportionateScreenWidth(50),
                          child: Center(
                            child: Icon(
                              Icons.favorite,
                              size: getProportionateScreenWidth(45),
                              color: isSet ? Colors.red : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
