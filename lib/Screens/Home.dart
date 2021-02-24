import 'package:flutter/material.dart';

import '../Controllers/HomeController.dart';
import '../Models/HomeModel.dart';
import '../Helpers/images.dart';
import '../Screens/ProductForSell.dart';
import '../Screens/details.dart';
import '../Widget/TestCat.dart';
import '../Widget/CustomButton.dart';
import '../Widget/HomeNavigationBar.dart';
import '../Helpers/size_conifg.dart';
import '../Widget/CustomAppBar.dart';

class Home extends StatefulWidget {
  static String routeName = '/Home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController _homeController = HomeController();
  HomeModel _homeModel = HomeModel();
  bool _isLoading = false;
  initState() {
    _getHomeData();
  }

  _getHomeData() async {
    setState(() {
      _isLoading = true;
    });
    _homeModel = await _homeController.getHomeData();
    setState(() {
      _isLoading = false;
    });
  }

  bool sel = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: MyHomeBottomNavBar(),
          appBar: buildAppBAr(context),
          body: !_isLoading
              ? RefreshIndicator(
                  onRefresh: () => _getHomeData(),
                  child: _homeModel.data.sliders.isEmpty
                      ? Center(
                          child: Text('No Data Now'),
                        )
                      : ListView(
                          children: [
                            Container(
                              // height: getProportionateScreenHeight(815),
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.tune),
                                      Container(
                                        width: getProportionateScreenWidth(300),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xFFCDD4D9)),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          // color: Colors.green,
                                        ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          cursorColor: Colors.black,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            fillColor: Colors.black,
                                            hintText: 'search for products ...',
                                            prefixIcon: Icon(Icons.search),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(20.0),
                                  ),
                                  Container(
                                    height: getProportionateScreenHeight(208),
                                    width: getProportionateScreenWidth(345),
                                    child: ListView.builder(
                                      physics: AlwaysScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: _homeModel.data.sliders.length,
                                      itemBuilder: (context, index) {
                                        return Card(
                                          child: Container(
                                            height:
                                                getProportionateScreenHeight(
                                                    208),
                                            width: getProportionateScreenWidth(
                                                345),
                                            child: FadeInImage(
                                              placeholder: AssetImage(
                                                  'assets/images/loadingImage.png'),
                                              image: NetworkImage(_homeModel
                                                  .data.sliders[index].image),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(30.0),
                                  ),
                                  Text(
                                    'Shop from the departments',
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(17),
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF222222),
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(30.0),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TestCat(
                                        image: CategoryImage[0],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .pushReplacementNamed(
                                                  ProductForSell.routeName);
                                        },
                                        child: TestCat(
                                          image: CategoryImage[1],
                                        ),
                                      ),
                                      TestCat(
                                        image: CategoryImage[2],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Special Advertising',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      17),
                                              color: Color(0xFF222222)),
                                        ),
                                        Text(
                                          'Show more',
                                          style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      12),
                                              decoration:
                                                  TextDecoration.underline,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF777777)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Stack(
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
                                                        BorderRadius.circular(
                                                            10.5)),
                                                height:
                                                    getProportionateScreenHeight(
                                                        260),
                                                width:
                                                    getProportionateScreenWidth(
                                                        170),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
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
                                                              fit: BoxFit
                                                                  .cover)),
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
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        Text(
                                                          '300 \$',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  getProportionateScreenWidth(
                                                                      12),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ],
                                                    ),
                                                    Text('Guess tan'),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CustomButton(
                                                          name: 'XXl',
                                                        ),
                                                        CustomButton(
                                                            name: 'Xl'),
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2),
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2),
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
                                            width: getProportionateScreenWidth(
                                                170),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Image.asset(sale),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        sel = !sel;
                                                        print(sel);
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.favorite,
                                                      size:
                                                          getProportionateScreenWidth(
                                                              20),
                                                      color: sel
                                                          ? Colors.grey
                                                          : Colors.red,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(3),
                                      ),
                                      Stack(
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
                                                        BorderRadius.circular(
                                                            10.5)),
                                                height:
                                                    getProportionateScreenHeight(
                                                        260),
                                                width:
                                                    getProportionateScreenWidth(
                                                        170),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
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
                                                              fit: BoxFit
                                                                  .cover)),
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
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        Text(
                                                          '300 \$',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  getProportionateScreenWidth(
                                                                      12),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ],
                                                    ),
                                                    Text('Guess tan'),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CustomButton(
                                                          name: 'XXl',
                                                        ),
                                                        CustomButton(
                                                            name: 'Xl'),
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2),
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2),
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
                                            width: getProportionateScreenWidth(
                                                170),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Image.asset(sale),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        sel = !sel;
                                                        print(sel);
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.favorite,
                                                      size:
                                                          getProportionateScreenWidth(
                                                              20),
                                                      color: sel
                                                          ? Colors.grey
                                                          : Colors.red,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      // SizedBox(
                                      //   width: getProportionateScreenWidth(3),
                                      // ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(15),
                                  ),
                                  Row(
                                    children: [
                                      Stack(
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
                                                        BorderRadius.circular(
                                                            10.5)),
                                                height:
                                                    getProportionateScreenHeight(
                                                        260),
                                                width:
                                                    getProportionateScreenWidth(
                                                        170),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
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
                                                              fit: BoxFit
                                                                  .cover)),
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
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        Text(
                                                          '300 \$',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  getProportionateScreenWidth(
                                                                      12),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ],
                                                    ),
                                                    Text('Guess tan'),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CustomButton(
                                                          name: 'XXl',
                                                        ),
                                                        CustomButton(
                                                            name: 'Xl'),
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2),
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2),
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
                                            width: getProportionateScreenWidth(
                                                170),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Image.asset(sale),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        sel = !sel;
                                                        print(sel);
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.favorite,
                                                      size:
                                                          getProportionateScreenWidth(
                                                              20),
                                                      color: sel
                                                          ? Colors.grey
                                                          : Colors.red,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Stack(
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
                                                        BorderRadius.circular(
                                                            10.5)),
                                                height:
                                                    getProportionateScreenHeight(
                                                        260),
                                                width:
                                                    getProportionateScreenWidth(
                                                        170),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
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
                                                              fit: BoxFit
                                                                  .cover)),
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
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        Text(
                                                          '300 \$',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  getProportionateScreenWidth(
                                                                      12),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ],
                                                    ),
                                                    Text('Guess tan'),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CustomButton(
                                                          name: 'XXl',
                                                        ),
                                                        CustomButton(
                                                            name: 'Xl'),
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2),
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2),
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
                                            width: getProportionateScreenWidth(
                                                170),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Image.asset(sale),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        sel = !sel;
                                                        print(sel);
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.favorite,
                                                      size:
                                                          getProportionateScreenWidth(
                                                              20),
                                                      color: sel
                                                          ? Colors.grey
                                                          : Colors.red,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(15),
                                  ),
                                  Row(
                                    children: [
                                      Stack(
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
                                                        BorderRadius.circular(
                                                            10.5)),
                                                height:
                                                    getProportionateScreenHeight(
                                                        260),
                                                width:
                                                    getProportionateScreenWidth(
                                                        170),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
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
                                                              fit: BoxFit
                                                                  .cover)),
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
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        Text(
                                                          '300 \$',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  getProportionateScreenWidth(
                                                                      12),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ],
                                                    ),
                                                    Text('Guess tan'),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CustomButton(
                                                          name: 'XXl',
                                                        ),
                                                        CustomButton(
                                                            name: 'Xl'),
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2),
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2),
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
                                            width: getProportionateScreenWidth(
                                                170),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Image.asset(sale),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        sel = !sel;
                                                        print(sel);
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.favorite,
                                                      size:
                                                          getProportionateScreenWidth(
                                                              20),
                                                      color: sel
                                                          ? Colors.grey
                                                          : Colors.red,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(0),
                                      ),
                                      Stack(
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
                                                        BorderRadius.circular(
                                                            10.5)),
                                                height:
                                                    getProportionateScreenHeight(
                                                        260),
                                                width:
                                                    getProportionateScreenWidth(
                                                        170),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
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
                                                              fit: BoxFit
                                                                  .cover)),
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
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        Text(
                                                          '300 \$',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  getProportionateScreenWidth(
                                                                      12),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ],
                                                    ),
                                                    Text('Guess tan'),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CustomButton(
                                                          name: 'XXl',
                                                        ),
                                                        CustomButton(
                                                            name: 'Xl'),
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2),
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2),
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
                                            width: getProportionateScreenWidth(
                                                170),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Image.asset(sale),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        sel = !sel;
                                                        print(sel);
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.favorite,
                                                      size:
                                                          getProportionateScreenWidth(
                                                              20),
                                                      color: sel
                                                          ? Colors.grey
                                                          : Colors.red,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                )
              : Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                  ),
                )),
    );
  }
}
