import 'package:flutter/material.dart';

import '../Controllers/HomeController.dart';
import '../Models/HomeModel.dart';
import '../Helpers/images.dart';
import '../Screens/ProductForSell.dart';
import '../Widget/TestCat.dart';
import '../Widget/CustomButton.dart';
import '../Widget/HomeNavigationBar.dart';
import '../Helpers/size_conifg.dart';
import '../Widget/CustomAppBar.dart';
import '../Controllers/AddFavController.dart';
import '../Controllers/UnFavController.dart';
import '../Screens/details.dart';

class Home extends StatefulWidget {
  static String routeName = '/Home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController _homeController = HomeController();
  AddFavAdsController _addFavAdsController = AddFavAdsController();
  UnFavAdsController _unFavAdsController = UnFavAdsController();
  HomeModel _homeModel = HomeModel();
  bool _isLoading = false;

  initState() {
    _getHomeData();
    super.initState();
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

  void _addFavAdd(int curentid) async {
    setState(() {
      showLoaderDialog(context);
    });
    Map<String, dynamic> _result =
        await _addFavAdsController.addFavAds(adid: curentid);

    if (_result['success']) {
      print('Response Done For addFav Done');
      print(_result);
      print(curentid);
      Navigator.pop(context);
      _getHomeData();
    } else {
      print('Failed For addFav');
    }
  }

  void _unFavAdss(int setid) async {
    setState(() {
      showLoaderDialog(context);
    });
    Map<String, dynamic> _resultt =
        await _unFavAdsController.unFavads(adid: setid);
    if (_resultt['success']) {
      print('Response For UnFav Done');
      print(_resultt);
      print(setid);
      Navigator.pop(context);
      _getHomeData();
    } else {
      print('Fialed For UnFav');
    }
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
                                      Column(
                                        children: [
                                          TestCat(
                                            image: CategoryImage[0],
                                          ),
                                          Text(_homeModel.data.types[0].name)
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .pushReplacementNamed(
                                                  ProductForSell.routeName);
                                        },
                                        child: Column(
                                          children: [
                                            TestCat(
                                              image: CategoryImage[1],
                                            ),
                                            Text(_homeModel.data.types[1].name)
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          TestCat(
                                            image: CategoryImage[2],
                                          ),
                                          Text(_homeModel.data.types[2].name)
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(13),
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
                                  SizedBox(
                                    height: getProportionateScreenHeight(13),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: getProportionateScreenHeight(285),
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            _homeModel.data.latestAds.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushReplacementNamed(
                                                      Detials.routeName,
                                                      arguments: {
                                                    "id": _homeModel.data
                                                        .latestAds[index].id
                                                  });
                                            },
                                            child: Card(
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.5),
                                                    ),
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.5),
                                                          border: Border.all(
                                                              color: Color(
                                                                  0xFFB83B5E),
                                                              width: 1.5)),
                                                      height:
                                                          getProportionateScreenHeight(
                                                              300),
                                                      width:
                                                          getProportionateScreenWidth(
                                                              170),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            height:
                                                                getProportionateScreenHeight(
                                                                    160),
                                                            decoration:
                                                                BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                image: _homeModel
                                                                        .data
                                                                        .latestAds[
                                                                            index]
                                                                        .images
                                                                        .isEmpty
                                                                    ? AssetImage(
                                                                        'assets/images/loadingImage.png')
                                                                    : NetworkImage(_homeModel
                                                                        .data
                                                                        .latestAds[
                                                                            index]
                                                                        .images[
                                                                            0]
                                                                        .fullFile),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                          ),
                                                          Text(
                                                            _homeModel
                                                                .data
                                                                .latestAds[
                                                                    index]
                                                                .name,
                                                            style: TextStyle(
                                                                fontSize:
                                                                    getProportionateScreenWidth(
                                                                        10),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          Text(
                                                            '${_homeModel.data.latestAds[index].price} \$',
                                                            style: TextStyle(
                                                                fontSize:
                                                                    getProportionateScreenWidth(
                                                                        12),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          Text(_homeModel
                                                              .data
                                                              .latestAds[index]
                                                              .body),
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
                                                              CustomButton(
                                                                  name: 'L'),
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
                                                                  color: Colors
                                                                      .green,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                child: Center(
                                                                  child:
                                                                      Container(
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
                                                                          BorderRadius.circular(
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
                                                                  color: Colors
                                                                      .green,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                child: Center(
                                                                  child:
                                                                      Container(
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
                                                                          BorderRadius.circular(
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
                                                  Container(
                                                    width:
                                                        getProportionateScreenWidth(
                                                            180),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child:
                                                              Image.asset(sale),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              print(_homeModel
                                                                  .data
                                                                  .latestAds[
                                                                      index]
                                                                  .id);
                                                              _homeModel
                                                                      .data
                                                                      .latestAds[
                                                                          index]
                                                                      .isFav
                                                                  ? _unFavAdss(
                                                                      _homeModel
                                                                          .data
                                                                          .latestAds[
                                                                              index]
                                                                          .id)
                                                                  : _addFavAdd(
                                                                      _homeModel
                                                                          .data
                                                                          .latestAds[
                                                                              index]
                                                                          .id);
                                                            },
                                                            child: Icon(
                                                              Icons.favorite,
                                                              size: 20,
                                                              color: _homeModel
                                                                      .data
                                                                      .latestAds[
                                                                          index]
                                                                      .isFav
                                                                  ? Colors.red
                                                                  : Colors.grey,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  )
                                  // Row(
                                  //   children: [
                                  //     Stack(
                                  //       children: [
                                  //         GestureDetector(
                                  //           onTap: () {
                                  //             Navigator.of(context)
                                  //                 .pushReplacementNamed(
                                  //                     Detials.routeName);
                                  //           },
                                  //           child: Container(
                                  //             decoration: BoxDecoration(
                                  //               borderRadius:
                                  //                   BorderRadius.circular(10.5),
                                  //             ),
                                  //             child: Container(
                                  //               padding: EdgeInsets.all(5.0),
                                  //               decoration: BoxDecoration(
                                  //                   borderRadius:
                                  //                       BorderRadius.circular(
                                  //                           10.5)),
                                  //               height:
                                  //                   getProportionateScreenHeight(
                                  //                       260),
                                  //               width:
                                  //                   getProportionateScreenWidth(
                                  //                       170),
                                  //               child: Column(
                                  //                 mainAxisAlignment:
                                  //                     MainAxisAlignment
                                  //                         .spaceAround,
                                  //                 crossAxisAlignment:
                                  //                     CrossAxisAlignment.start,
                                  //                 children: [
                                  //                   Container(
                                  //                     height:
                                  //                         getProportionateScreenHeight(
                                  //                             160),
                                  //                     decoration: BoxDecoration(
                                  //                         image: DecorationImage(
                                  //                             image: AssetImage(
                                  //                                 ProImage[0]),
                                  //                             fit: BoxFit
                                  //                                 .cover)),
                                  //                   ),
                                  //                   Row(
                                  //                     mainAxisAlignment:
                                  //                         MainAxisAlignment
                                  //                             .spaceBetween,
                                  //                     children: [
                                  //                       Text(
                                  //                         'Women shoes',
                                  //                         style: TextStyle(
                                  //                             fontSize:
                                  //                                 getProportionateScreenWidth(
                                  //                                     12),
                                  //                             fontWeight:
                                  //                                 FontWeight
                                  //                                     .w400),
                                  //                       ),
                                  //                       Text(
                                  //                         '300 \$',
                                  //                         style: TextStyle(
                                  //                             fontSize:
                                  //                                 getProportionateScreenWidth(
                                  //                                     12),
                                  //                             fontWeight:
                                  //                                 FontWeight
                                  //                                     .w400),
                                  //                       ),
                                  //                     ],
                                  //                   ),
                                  //                   Text('Guess tan'),
                                  //                   Row(
                                  //                     mainAxisAlignment:
                                  //                         MainAxisAlignment
                                  //                             .spaceAround,
                                  //                     crossAxisAlignment:
                                  //                         CrossAxisAlignment
                                  //                             .start,
                                  //                     children: [
                                  //                       CustomButton(
                                  //                         name: 'XXl',
                                  //                       ),
                                  //                       CustomButton(
                                  //                           name: 'Xl'),
                                  //                       CustomButton(name: 'L'),
                                  //                       SizedBox(
                                  //                         width:
                                  //                             getProportionateScreenWidth(
                                  //                                 35),
                                  //                       ),
                                  //                       Container(
                                  //                         height:
                                  //                             getProportionateScreenHeight(
                                  //                                 12),
                                  //                         width:
                                  //                             getProportionateScreenWidth(
                                  //                                 12),
                                  //                         decoration:
                                  //                             BoxDecoration(
                                  //                           color: Colors.green,
                                  //                           borderRadius:
                                  //                               BorderRadius
                                  //                                   .circular(
                                  //                                       10),
                                  //                         ),
                                  //                         child: Center(
                                  //                           child: Container(
                                  //                             height:
                                  //                                 getProportionateScreenHeight(
                                  //                                     3),
                                  //                             width:
                                  //                                 getProportionateScreenWidth(
                                  //                                     3),
                                  //                             decoration:
                                  //                                 BoxDecoration(
                                  //                               color: Colors
                                  //                                   .white,
                                  //                               borderRadius:
                                  //                                   BorderRadius
                                  //                                       .circular(
                                  //                                           2),
                                  //                             ),
                                  //                           ),
                                  //                         ),
                                  //                       ),
                                  //                       Container(
                                  //                         height:
                                  //                             getProportionateScreenHeight(
                                  //                                 12),
                                  //                         width:
                                  //                             getProportionateScreenWidth(
                                  //                                 12),
                                  //                         decoration:
                                  //                             BoxDecoration(
                                  //                           color: Colors.green,
                                  //                           borderRadius:
                                  //                               BorderRadius
                                  //                                   .circular(
                                  //                                       10),
                                  //                         ),
                                  //                         child: Center(
                                  //                           child: Container(
                                  //                             height:
                                  //                                 getProportionateScreenHeight(
                                  //                                     3),
                                  //                             width:
                                  //                                 getProportionateScreenWidth(
                                  //                                     3),
                                  //                             decoration:
                                  //                                 BoxDecoration(
                                  //                               color: Colors
                                  //                                   .white,
                                  //                               borderRadius:
                                  //                                   BorderRadius
                                  //                                       .circular(
                                  //                                           2),
                                  //                             ),
                                  //                           ),
                                  //                         ),
                                  //                       ),
                                  //                     ],
                                  //                   )
                                  //                 ],
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         Container(
                                  //           width: getProportionateScreenWidth(
                                  //               170),
                                  //           child: Row(
                                  //             crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //             mainAxisAlignment:
                                  //                 MainAxisAlignment
                                  //                     .spaceBetween,
                                  //             children: [
                                  //               Padding(
                                  //                 padding: const EdgeInsets.all(
                                  //                     10.0),
                                  //                 child: Image.asset(sale),
                                  //               ),
                                  //               Padding(
                                  //                 padding: const EdgeInsets.all(
                                  //                     10.0),
                                  //                 child: GestureDetector(
                                  //                   onTap: () {
                                  //                     setState(() {
                                  //                       sel = !sel;
                                  //                       print(sel);
                                  //                     });
                                  //                   },
                                  //                   child: Icon(
                                  //                     Icons.favorite,
                                  //                     size:
                                  //                         getProportionateScreenWidth(
                                  //                             20),
                                  //                     color: sel
                                  //                         ? Colors.grey
                                  //                         : Colors.red,
                                  //                   ),
                                  //                 ),
                                  //               )
                                  //             ],
                                  //           ),
                                  //         )
                                  //       ],
                                  //     ),
                                  //     SizedBox(
                                  //       width: getProportionateScreenWidth(3),
                                  //     ),
                                  //     Stack(
                                  //       children: [
                                  //         GestureDetector(
                                  //           onTap: () {
                                  //             Navigator.of(context)
                                  //                 .pushReplacementNamed(
                                  //                     Detials.routeName);
                                  //           },
                                  //           child: Container(
                                  //             decoration: BoxDecoration(
                                  //               borderRadius:
                                  //                   BorderRadius.circular(10.5),
                                  //             ),
                                  //             child: Container(
                                  //               padding: EdgeInsets.all(5.0),
                                  //               decoration: BoxDecoration(
                                  //                   borderRadius:
                                  //                       BorderRadius.circular(
                                  //                           10.5)),
                                  //               height:
                                  //                   getProportionateScreenHeight(
                                  //                       260),
                                  //               width:
                                  //                   getProportionateScreenWidth(
                                  //                       170),
                                  //               child: Column(
                                  //                 mainAxisAlignment:
                                  //                     MainAxisAlignment
                                  //                         .spaceAround,
                                  //                 crossAxisAlignment:
                                  //                     CrossAxisAlignment.start,
                                  //                 children: [
                                  //                   Container(
                                  //                     height:
                                  //                         getProportionateScreenHeight(
                                  //                             160),
                                  //                     decoration: BoxDecoration(
                                  //                         image: DecorationImage(
                                  //                             image: AssetImage(
                                  //                                 ProImage[0]),
                                  //                             fit: BoxFit
                                  //                                 .cover)),
                                  //                   ),
                                  //                   Row(
                                  //                     mainAxisAlignment:
                                  //                         MainAxisAlignment
                                  //                             .spaceBetween,
                                  //                     children: [
                                  //                       Text(
                                  //                         'Women shoes',
                                  //                         style: TextStyle(
                                  //                             fontSize:
                                  //                                 getProportionateScreenWidth(
                                  //                                     12),
                                  //                             fontWeight:
                                  //                                 FontWeight
                                  //                                     .w400),
                                  //                       ),
                                  //                       Text(
                                  //                         '300 \$',
                                  //                         style: TextStyle(
                                  //                             fontSize:
                                  //                                 getProportionateScreenWidth(
                                  //                                     12),
                                  //                             fontWeight:
                                  //                                 FontWeight
                                  //                                     .w400),
                                  //                       ),
                                  //                     ],
                                  //                   ),
                                  //                   Text('Guess tan'),
                                  //                   Row(
                                  //                     mainAxisAlignment:
                                  //                         MainAxisAlignment
                                  //                             .spaceAround,
                                  //                     crossAxisAlignment:
                                  //                         CrossAxisAlignment
                                  //                             .start,
                                  //                     children: [
                                  //                       CustomButton(
                                  //                         name: 'XXl',
                                  //                       ),
                                  //                       CustomButton(
                                  //                           name: 'Xl'),
                                  //                       CustomButton(name: 'L'),
                                  //                       SizedBox(
                                  //                         width:
                                  //                             getProportionateScreenWidth(
                                  //                                 35),
                                  //                       ),
                                  //                       Container(
                                  //                         height:
                                  //                             getProportionateScreenHeight(
                                  //                                 12),
                                  //                         width:
                                  //                             getProportionateScreenWidth(
                                  //                                 12),
                                  //                         decoration:
                                  //                             BoxDecoration(
                                  //                           color: Colors.green,
                                  //                           borderRadius:
                                  //                               BorderRadius
                                  //                                   .circular(
                                  //                                       10),
                                  //                         ),
                                  //                         child: Center(
                                  //                           child: Container(
                                  //                             height:
                                  //                                 getProportionateScreenHeight(
                                  //                                     3),
                                  //                             width:
                                  //                                 getProportionateScreenWidth(
                                  //                                     3),
                                  //                             decoration:
                                  //                                 BoxDecoration(
                                  //                               color: Colors
                                  //                                   .white,
                                  //                               borderRadius:
                                  //                                   BorderRadius
                                  //                                       .circular(
                                  //                                           2),
                                  //                             ),
                                  //                           ),
                                  //                         ),
                                  //                       ),
                                  //                       Container(
                                  //                         height:
                                  //                             getProportionateScreenHeight(
                                  //                                 12),
                                  //                         width:
                                  //                             getProportionateScreenWidth(
                                  //                                 12),
                                  //                         decoration:
                                  //                             BoxDecoration(
                                  //                           color: Colors.green,
                                  //                           borderRadius:
                                  //                               BorderRadius
                                  //                                   .circular(
                                  //                                       10),
                                  //                         ),
                                  //                         child: Center(
                                  //                           child: Container(
                                  //                             height:
                                  //                                 getProportionateScreenHeight(
                                  //                                     3),
                                  //                             width:
                                  //                                 getProportionateScreenWidth(
                                  //                                     3),
                                  //                             decoration:
                                  //                                 BoxDecoration(
                                  //                               color: Colors
                                  //                                   .white,
                                  //                               borderRadius:
                                  //                                   BorderRadius
                                  //                                       .circular(
                                  //                                           2),
                                  //                             ),
                                  //                           ),
                                  //                         ),
                                  //                       ),
                                  //                     ],
                                  //                   )
                                  //                 ],
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         Container(
                                  //           width: getProportionateScreenWidth(
                                  //               170),
                                  //           child: Row(
                                  //             crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //             mainAxisAlignment:
                                  //                 MainAxisAlignment
                                  //                     .spaceBetween,
                                  //             children: [
                                  //               Padding(
                                  //                 padding: const EdgeInsets.all(
                                  //                     10.0),
                                  //                 child: Image.asset(sale),
                                  //               ),
                                  //               Padding(
                                  //                 padding: const EdgeInsets.all(
                                  //                     10.0),
                                  //                 child: GestureDetector(
                                  //                   onTap: () {
                                  //                     setState(() {
                                  //                       sel = !sel;
                                  //                       print(sel);
                                  //                     });
                                  //                   },
                                  //                   child: Icon(
                                  //                     Icons.favorite,
                                  //                     size:
                                  //                         getProportionateScreenWidth(
                                  //                             20),
                                  //                     color: sel
                                  //                         ? Colors.grey
                                  //                         : Colors.red,
                                  //                   ),
                                  //                 ),
                                  //               )
                                  //             ],
                                  //           ),
                                  //         )
                                  //       ],
                                  //     ),
                                  //     // SizedBox(
                                  //     //   width: getProportionateScreenWidth(3),
                                  //     // ),
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   height: getProportionateScreenHeight(15),
                                  // ),
                                  // Row(
                                  //   children: [
                                  //     Stack(
                                  //       children: [
                                  //         GestureDetector(
                                  //           onTap: () {
                                  //             Navigator.of(context)
                                  //                 .pushReplacementNamed(
                                  //                     Detials.routeName);
                                  //           },
                                  //           child: Container(
                                  //             decoration: BoxDecoration(
                                  //               borderRadius:
                                  //                   BorderRadius.circular(10.5),
                                  //             ),
                                  //             child: Container(
                                  //               padding: EdgeInsets.all(5.0),
                                  //               decoration: BoxDecoration(
                                  //                   borderRadius:
                                  //                       BorderRadius.circular(
                                  //                           10.5)),
                                  //               height:
                                  //                   getProportionateScreenHeight(
                                  //                       260),
                                  //               width:
                                  //                   getProportionateScreenWidth(
                                  //                       170),
                                  //               child: Column(
                                  //                 mainAxisAlignment:
                                  //                     MainAxisAlignment
                                  //                         .spaceAround,
                                  //                 crossAxisAlignment:
                                  //                     CrossAxisAlignment.start,
                                  //                 children: [
                                  //                   Container(
                                  //                     height:
                                  //                         getProportionateScreenHeight(
                                  //                             160),
                                  //                     decoration: BoxDecoration(
                                  //                         image: DecorationImage(
                                  //                             image: AssetImage(
                                  //                                 ProImage[0]),
                                  //                             fit: BoxFit
                                  //                                 .cover)),
                                  //                   ),
                                  //                   Row(
                                  //                     mainAxisAlignment:
                                  //                         MainAxisAlignment
                                  //                             .spaceBetween,
                                  //                     children: [
                                  //                       Text(
                                  //                         'Women shoes',
                                  //                         style: TextStyle(
                                  //                             fontSize:
                                  //                                 getProportionateScreenWidth(
                                  //                                     12),
                                  //                             fontWeight:
                                  //                                 FontWeight
                                  //                                     .w400),
                                  //                       ),
                                  //                       Text(
                                  //                         '300 \$',
                                  //                         style: TextStyle(
                                  //                             fontSize:
                                  //                                 getProportionateScreenWidth(
                                  //                                     12),
                                  //                             fontWeight:
                                  //                                 FontWeight
                                  //                                     .w400),
                                  //                       ),
                                  //                     ],
                                  //                   ),
                                  //                   Text('Guess tan'),
                                  //                   Row(
                                  //                     mainAxisAlignment:
                                  //                         MainAxisAlignment
                                  //                             .spaceAround,
                                  //                     crossAxisAlignment:
                                  //                         CrossAxisAlignment
                                  //                             .start,
                                  //                     children: [
                                  //                       CustomButton(
                                  //                         name: 'XXl',
                                  //                       ),
                                  //                       CustomButton(
                                  //                           name: 'Xl'),
                                  //                       CustomButton(name: 'L'),
                                  //                       SizedBox(
                                  //                         width:
                                  //                             getProportionateScreenWidth(
                                  //                                 35),
                                  //                       ),
                                  //                       Container(
                                  //                         height:
                                  //                             getProportionateScreenHeight(
                                  //                                 12),
                                  //                         width:
                                  //                             getProportionateScreenWidth(
                                  //                                 12),
                                  //                         decoration:
                                  //                             BoxDecoration(
                                  //                           color: Colors.green,
                                  //                           borderRadius:
                                  //                               BorderRadius
                                  //                                   .circular(
                                  //                                       10),
                                  //                         ),
                                  //                         child: Center(
                                  //                           child: Container(
                                  //                             height:
                                  //                                 getProportionateScreenHeight(
                                  //                                     3),
                                  //                             width:
                                  //                                 getProportionateScreenWidth(
                                  //                                     3),
                                  //                             decoration:
                                  //                                 BoxDecoration(
                                  //                               color: Colors
                                  //                                   .white,
                                  //                               borderRadius:
                                  //                                   BorderRadius
                                  //                                       .circular(
                                  //                                           2),
                                  //                             ),
                                  //                           ),
                                  //                         ),
                                  //                       ),
                                  //                       Container(
                                  //                         height:
                                  //                             getProportionateScreenHeight(
                                  //                                 12),
                                  //                         width:
                                  //                             getProportionateScreenWidth(
                                  //                                 12),
                                  //                         decoration:
                                  //                             BoxDecoration(
                                  //                           color: Colors.green,
                                  //                           borderRadius:
                                  //                               BorderRadius
                                  //                                   .circular(
                                  //                                       10),
                                  //                         ),
                                  //                         child: Center(
                                  //                           child: Container(
                                  //                             height:
                                  //                                 getProportionateScreenHeight(
                                  //                                     3),
                                  //                             width:
                                  //                                 getProportionateScreenWidth(
                                  //                                     3),
                                  //                             decoration:
                                  //                                 BoxDecoration(
                                  //                               color: Colors
                                  //                                   .white,
                                  //                               borderRadius:
                                  //                                   BorderRadius
                                  //                                       .circular(
                                  //                                           2),
                                  //                             ),
                                  //                           ),
                                  //                         ),
                                  //                       ),
                                  //                     ],
                                  //                   )
                                  //                 ],
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         Container(
                                  //           width: getProportionateScreenWidth(
                                  //               170),
                                  //           child: Row(
                                  //             crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //             mainAxisAlignment:
                                  //                 MainAxisAlignment
                                  //                     .spaceBetween,
                                  //             children: [
                                  //               Padding(
                                  //                 padding: const EdgeInsets.all(
                                  //                     10.0),
                                  //                 child: Image.asset(sale),
                                  //               ),
                                  //               Padding(
                                  //                 padding: const EdgeInsets.all(
                                  //                     10.0),
                                  //                 child: GestureDetector(
                                  //                   onTap: () {
                                  //                     setState(() {
                                  //                       sel = !sel;
                                  //                       print(sel);
                                  //                     });
                                  //                   },
                                  //                   child: Icon(
                                  //                     Icons.favorite,
                                  //                     size:
                                  //                         getProportionateScreenWidth(
                                  //                             20),
                                  //                     color: sel
                                  //                         ? Colors.grey
                                  //                         : Colors.red,
                                  //                   ),
                                  //                 ),
                                  //               )
                                  //             ],
                                  //           ),
                                  //         )
                                  //       ],
                                  //     ),
                                  //     Stack(
                                  //       children: [
                                  //         GestureDetector(
                                  //           onTap: () {
                                  //             Navigator.of(context)
                                  //                 .pushReplacementNamed(
                                  //                     Detials.routeName);
                                  //           },
                                  //           child: Container(
                                  //             decoration: BoxDecoration(
                                  //               borderRadius:
                                  //                   BorderRadius.circular(10.5),
                                  //             ),
                                  //             child: Container(
                                  //               padding: EdgeInsets.all(5.0),
                                  //               decoration: BoxDecoration(
                                  //                   borderRadius:
                                  //                       BorderRadius.circular(
                                  //                           10.5)),
                                  //               height:
                                  //                   getProportionateScreenHeight(
                                  //                       260),
                                  //               width:
                                  //                   getProportionateScreenWidth(
                                  //                       170),
                                  //               child: Column(
                                  //                 mainAxisAlignment:
                                  //                     MainAxisAlignment
                                  //                         .spaceAround,
                                  //                 crossAxisAlignment:
                                  //                     CrossAxisAlignment.start,
                                  //                 children: [
                                  //                   Container(
                                  //                     height:
                                  //                         getProportionateScreenHeight(
                                  //                             160),
                                  //                     decoration: BoxDecoration(
                                  //                         image: DecorationImage(
                                  //                             image: AssetImage(
                                  //                                 ProImage[0]),
                                  //                             fit: BoxFit
                                  //                                 .cover)),
                                  //                   ),
                                  //                   Row(
                                  //                     mainAxisAlignment:
                                  //                         MainAxisAlignment
                                  //                             .spaceBetween,
                                  //                     children: [
                                  //                       Text(
                                  //                         'Women shoes',
                                  //                         style: TextStyle(
                                  //                             fontSize:
                                  //                                 getProportionateScreenWidth(
                                  //                                     12),
                                  //                             fontWeight:
                                  //                                 FontWeight
                                  //                                     .w400),
                                  //                       ),
                                  //                       Text(
                                  //                         '300 \$',
                                  //                         style: TextStyle(
                                  //                             fontSize:
                                  //                                 getProportionateScreenWidth(
                                  //                                     12),
                                  //                             fontWeight:
                                  //                                 FontWeight
                                  //                                     .w400),
                                  //                       ),
                                  //                     ],
                                  //                   ),
                                  //                   Text('Guess tan'),
                                  //                   Row(
                                  //                     mainAxisAlignment:
                                  //                         MainAxisAlignment
                                  //                             .spaceAround,
                                  //                     crossAxisAlignment:
                                  //                         CrossAxisAlignment
                                  //                             .start,
                                  //                     children: [
                                  //                       CustomButton(
                                  //                         name: 'XXl',
                                  //                       ),
                                  //                       CustomButton(
                                  //                           name: 'Xl'),
                                  //                       CustomButton(name: 'L'),
                                  //                       SizedBox(
                                  //                         width:
                                  //                             getProportionateScreenWidth(
                                  //                                 35),
                                  //                       ),
                                  //                       Container(
                                  //                         height:
                                  //                             getProportionateScreenHeight(
                                  //                                 12),
                                  //                         width:
                                  //                             getProportionateScreenWidth(
                                  //                                 12),
                                  //                         decoration:
                                  //                             BoxDecoration(
                                  //                           color: Colors.green,
                                  //                           borderRadius:
                                  //                               BorderRadius
                                  //                                   .circular(
                                  //                                       10),
                                  //                         ),
                                  //                         child: Center(
                                  //                           child: Container(
                                  //                             height:
                                  //                                 getProportionateScreenHeight(
                                  //                                     3),
                                  //                             width:
                                  //                                 getProportionateScreenWidth(
                                  //                                     3),
                                  //                             decoration:
                                  //                                 BoxDecoration(
                                  //                               color: Colors
                                  //                                   .white,
                                  //                               borderRadius:
                                  //                                   BorderRadius
                                  //                                       .circular(
                                  //                                           2),
                                  //                             ),
                                  //                           ),
                                  //                         ),
                                  //                       ),
                                  //                       Container(
                                  //                         height:
                                  //                             getProportionateScreenHeight(
                                  //                                 12),
                                  //                         width:
                                  //                             getProportionateScreenWidth(
                                  //                                 12),
                                  //                         decoration:
                                  //                             BoxDecoration(
                                  //                           color: Colors.green,
                                  //                           borderRadius:
                                  //                               BorderRadius
                                  //                                   .circular(
                                  //                                       10),
                                  //                         ),
                                  //                         child: Center(
                                  //                           child: Container(
                                  //                             height:
                                  //                                 getProportionateScreenHeight(
                                  //                                     3),
                                  //                             width:
                                  //                                 getProportionateScreenWidth(
                                  //                                     3),
                                  //                             decoration:
                                  //                                 BoxDecoration(
                                  //                               color: Colors
                                  //                                   .white,
                                  //                               borderRadius:
                                  //                                   BorderRadius
                                  //                                       .circular(
                                  //                                           2),
                                  //                             ),
                                  //                           ),
                                  //                         ),
                                  //                       ),
                                  //                     ],
                                  //                   )
                                  //                 ],
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         Container(
                                  //           width: getProportionateScreenWidth(
                                  //               170),
                                  //           child: Row(
                                  //             crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //             mainAxisAlignment:
                                  //                 MainAxisAlignment
                                  //                     .spaceBetween,
                                  //             children: [
                                  //               Padding(
                                  //                 padding: const EdgeInsets.all(
                                  //                     10.0),
                                  //                 child: Image.asset(sale),
                                  //               ),
                                  //               Padding(
                                  //                 padding: const EdgeInsets.all(
                                  //                     10.0),
                                  //                 child: GestureDetector(
                                  //                   onTap: () {
                                  //                     setState(() {
                                  //                       sel = !sel;
                                  //                       print(sel);
                                  //                     });
                                  //                   },
                                  //                   child: Icon(
                                  //                     Icons.favorite,
                                  //                     size:
                                  //                         getProportionateScreenWidth(
                                  //                             20),
                                  //                     color: sel
                                  //                         ? Colors.grey
                                  //                         : Colors.red,
                                  //                   ),
                                  //                 ),
                                  //               )
                                  //             ],
                                  //           ),
                                  //         )
                                  //       ],
                                  //     ),
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   height: getProportionateScreenHeight(15),
                                  // ),
                                  // Row(
                                  //   children: [
                                  //     Stack(
                                  //       children: [
                                  //         GestureDetector(
                                  //           onTap: () {
                                  //             Navigator.of(context)
                                  //                 .pushReplacementNamed(
                                  //                     Detials.routeName);
                                  //           },
                                  //           child: Container(
                                  //             decoration: BoxDecoration(
                                  //               borderRadius:
                                  //                   BorderRadius.circular(10.5),
                                  //             ),
                                  //             child: Container(
                                  //               padding: EdgeInsets.all(5.0),
                                  //               decoration: BoxDecoration(
                                  //                   borderRadius:
                                  //                       BorderRadius.circular(
                                  //                           10.5)),
                                  //               height:
                                  //                   getProportionateScreenHeight(
                                  //                       260),
                                  //               width:
                                  //                   getProportionateScreenWidth(
                                  //                       170),
                                  //               child: Column(
                                  //                 mainAxisAlignment:
                                  //                     MainAxisAlignment
                                  //                         .spaceAround,
                                  //                 crossAxisAlignment:
                                  //                     CrossAxisAlignment.start,
                                  //                 children: [
                                  //                   Container(
                                  //                     height:
                                  //                         getProportionateScreenHeight(
                                  //                             160),
                                  //                     decoration: BoxDecoration(
                                  //                         image: DecorationImage(
                                  //                             image: AssetImage(
                                  //                                 ProImage[0]),
                                  //                             fit: BoxFit
                                  //                                 .cover)),
                                  //                   ),
                                  //                   Row(
                                  //                     mainAxisAlignment:
                                  //                         MainAxisAlignment
                                  //                             .spaceBetween,
                                  //                     children: [
                                  //                       Text(
                                  //                         'Women shoes',
                                  //                         style: TextStyle(
                                  //                             fontSize:
                                  //                                 getProportionateScreenWidth(
                                  //                                     12),
                                  //                             fontWeight:
                                  //                                 FontWeight
                                  //                                     .w400),
                                  //                       ),
                                  //                       Text(
                                  //                         '300 \$',
                                  //                         style: TextStyle(
                                  //                             fontSize:
                                  //                                 getProportionateScreenWidth(
                                  //                                     12),
                                  //                             fontWeight:
                                  //                                 FontWeight
                                  //                                     .w400),
                                  //                       ),
                                  //                     ],
                                  //                   ),
                                  //                   Text('Guess tan'),
                                  //                   Row(
                                  //                     mainAxisAlignment:
                                  //                         MainAxisAlignment
                                  //                             .spaceAround,
                                  //                     crossAxisAlignment:
                                  //                         CrossAxisAlignment
                                  //                             .start,
                                  //                     children: [
                                  //                       CustomButton(
                                  //                         name: 'XXl',
                                  //                       ),
                                  //                       CustomButton(
                                  //                           name: 'Xl'),
                                  //                       CustomButton(name: 'L'),
                                  //                       SizedBox(
                                  //                         width:
                                  //                             getProportionateScreenWidth(
                                  //                                 35),
                                  //                       ),
                                  //                       Container(
                                  //                         height:
                                  //                             getProportionateScreenHeight(
                                  //                                 12),
                                  //                         width:
                                  //                             getProportionateScreenWidth(
                                  //                                 12),
                                  //                         decoration:
                                  //                             BoxDecoration(
                                  //                           color: Colors.green,
                                  //                           borderRadius:
                                  //                               BorderRadius
                                  //                                   .circular(
                                  //                                       10),
                                  //                         ),
                                  //                         child: Center(
                                  //                           child: Container(
                                  //                             height:
                                  //                                 getProportionateScreenHeight(
                                  //                                     3),
                                  //                             width:
                                  //                                 getProportionateScreenWidth(
                                  //                                     3),
                                  //                             decoration:
                                  //                                 BoxDecoration(
                                  //                               color: Colors
                                  //                                   .white,
                                  //                               borderRadius:
                                  //                                   BorderRadius
                                  //                                       .circular(
                                  //                                           2),
                                  //                             ),
                                  //                           ),
                                  //                         ),
                                  //                       ),
                                  //                       Container(
                                  //                         height:
                                  //                             getProportionateScreenHeight(
                                  //                                 12),
                                  //                         width:
                                  //                             getProportionateScreenWidth(
                                  //                                 12),
                                  //                         decoration:
                                  //                             BoxDecoration(
                                  //                           color: Colors.green,
                                  //                           borderRadius:
                                  //                               BorderRadius
                                  //                                   .circular(
                                  //                                       10),
                                  //                         ),
                                  //                         child: Center(
                                  //                           child: Container(
                                  //                             height:
                                  //                                 getProportionateScreenHeight(
                                  //                                     3),
                                  //                             width:
                                  //                                 getProportionateScreenWidth(
                                  //                                     3),
                                  //                             decoration:
                                  //                                 BoxDecoration(
                                  //                               color: Colors
                                  //                                   .white,
                                  //                               borderRadius:
                                  //                                   BorderRadius
                                  //                                       .circular(
                                  //                                           2),
                                  //                             ),
                                  //                           ),
                                  //                         ),
                                  //                       ),
                                  //                     ],
                                  //                   )
                                  //                 ],
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         Container(
                                  //           width: getProportionateScreenWidth(
                                  //               170),
                                  //           child: Row(
                                  //             crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //             mainAxisAlignment:
                                  //                 MainAxisAlignment
                                  //                     .spaceBetween,
                                  //             children: [
                                  //               Padding(
                                  //                 padding: const EdgeInsets.all(
                                  //                     10.0),
                                  //                 child: Image.asset(sale),
                                  //               ),
                                  //               Padding(
                                  //                 padding: const EdgeInsets.all(
                                  //                     10.0),
                                  //                 child: GestureDetector(
                                  //                   onTap: () {
                                  //                     setState(() {
                                  //                       sel = !sel;
                                  //                       print(sel);
                                  //                     });
                                  //                   },
                                  //                   child: Icon(
                                  //                     Icons.favorite,
                                  //                     size:
                                  //                         getProportionateScreenWidth(
                                  //                             20),
                                  //                     color: sel
                                  //                         ? Colors.grey
                                  //                         : Colors.red,
                                  //                   ),
                                  //                 ),
                                  //               )
                                  //             ],
                                  //           ),
                                  //         )
                                  //       ],
                                  //     ),
                                  //     SizedBox(
                                  //       width: getProportionateScreenWidth(0),
                                  //     ),
                                  //     Stack(
                                  //       children: [
                                  //         GestureDetector(
                                  //           onTap: () {
                                  //             Navigator.of(context)
                                  //                 .pushReplacementNamed(
                                  //                     Detials.routeName);
                                  //           },
                                  //           child: Container(
                                  //             decoration: BoxDecoration(
                                  //               borderRadius:
                                  //                   BorderRadius.circular(10.5),
                                  //             ),
                                  //             child: Container(
                                  //               padding: EdgeInsets.all(5.0),
                                  //               decoration: BoxDecoration(
                                  //                   borderRadius:
                                  //                       BorderRadius.circular(
                                  //                           10.5)),
                                  //               height:
                                  //                   getProportionateScreenHeight(
                                  //                       260),
                                  //               width:
                                  //                   getProportionateScreenWidth(
                                  //                       170),
                                  //               child: Column(
                                  //                 mainAxisAlignment:
                                  //                     MainAxisAlignment
                                  //                         .spaceAround,
                                  //                 crossAxisAlignment:
                                  //                     CrossAxisAlignment.start,
                                  //                 children: [
                                  //                   Container(
                                  //                     height:
                                  //                         getProportionateScreenHeight(
                                  //                             160),
                                  //                     decoration: BoxDecoration(
                                  //                         image: DecorationImage(
                                  //                             image: AssetImage(
                                  //                                 ProImage[0]),
                                  //                             fit: BoxFit
                                  //                                 .cover)),
                                  //                   ),
                                  //                   Row(
                                  //                     mainAxisAlignment:
                                  //                         MainAxisAlignment
                                  //                             .spaceBetween,
                                  //                     children: [
                                  //                       Text(
                                  //                         'Women shoes',
                                  //                         style: TextStyle(
                                  //                             fontSize:
                                  //                                 getProportionateScreenWidth(
                                  //                                     12),
                                  //                             fontWeight:
                                  //                                 FontWeight
                                  //                                     .w400),
                                  //                       ),
                                  //                       Text(
                                  //                         '300 \$',
                                  //                         style: TextStyle(
                                  //                             fontSize:
                                  //                                 getProportionateScreenWidth(
                                  //                                     12),
                                  //                             fontWeight:
                                  //                                 FontWeight
                                  //                                     .w400),
                                  //                       ),
                                  //                     ],
                                  //                   ),
                                  //                   Text('Guess tan'),
                                  //                   Row(
                                  //                     mainAxisAlignment:
                                  //                         MainAxisAlignment
                                  //                             .spaceAround,
                                  //                     crossAxisAlignment:
                                  //                         CrossAxisAlignment
                                  //                             .start,
                                  //                     children: [
                                  //                       CustomButton(
                                  //                         name: 'XXl',
                                  //                       ),
                                  //                       CustomButton(
                                  //                           name: 'Xl'),
                                  //                       CustomButton(name: 'L'),
                                  //                       SizedBox(
                                  //                         width:
                                  //                             getProportionateScreenWidth(
                                  //                                 35),
                                  //                       ),
                                  //                       Container(
                                  //                         height:
                                  //                             getProportionateScreenHeight(
                                  //                                 12),
                                  //                         width:
                                  //                             getProportionateScreenWidth(
                                  //                                 12),
                                  //                         decoration:
                                  //                             BoxDecoration(
                                  //                           color: Colors.green,
                                  //                           borderRadius:
                                  //                               BorderRadius
                                  //                                   .circular(
                                  //                                       10),
                                  //                         ),
                                  //                         child: Center(
                                  //                           child: Container(
                                  //                             height:
                                  //                                 getProportionateScreenHeight(
                                  //                                     3),
                                  //                             width:
                                  //                                 getProportionateScreenWidth(
                                  //                                     3),
                                  //                             decoration:
                                  //                                 BoxDecoration(
                                  //                               color: Colors
                                  //                                   .white,
                                  //                               borderRadius:
                                  //                                   BorderRadius
                                  //                                       .circular(
                                  //                                           2),
                                  //                             ),
                                  //                           ),
                                  //                         ),
                                  //                       ),
                                  //                       Container(
                                  //                         height:
                                  //                             getProportionateScreenHeight(
                                  //                                 12),
                                  //                         width:
                                  //                             getProportionateScreenWidth(
                                  //                                 12),
                                  //                         decoration:
                                  //                             BoxDecoration(
                                  //                           color: Colors.green,
                                  //                           borderRadius:
                                  //                               BorderRadius
                                  //                                   .circular(
                                  //                                       10),
                                  //                         ),
                                  //                         child: Center(
                                  //                           child: Container(
                                  //                             height:
                                  //                                 getProportionateScreenHeight(
                                  //                                     3),
                                  //                             width:
                                  //                                 getProportionateScreenWidth(
                                  //                                     3),
                                  //                             decoration:
                                  //                                 BoxDecoration(
                                  //                               color: Colors
                                  //                                   .white,
                                  //                               borderRadius:
                                  //                                   BorderRadius
                                  //                                       .circular(
                                  //                                           2),
                                  //                             ),
                                  //                           ),
                                  //                         ),
                                  //                       ),
                                  //                     ],
                                  //                   )
                                  //                 ],
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         Container(
                                  //           width: getProportionateScreenWidth(
                                  //               170),
                                  //           child: Row(
                                  //             crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //             mainAxisAlignment:
                                  //                 MainAxisAlignment
                                  //                     .spaceBetween,
                                  //             children: [
                                  //               Padding(
                                  //                 padding: const EdgeInsets.all(
                                  //                     10.0),
                                  //                 child: Image.asset(sale),
                                  //               ),
                                  //               Padding(
                                  //                 padding: const EdgeInsets.all(
                                  //                     10.0),
                                  //                 child: GestureDetector(
                                  //                   onTap: () {
                                  //                     setState(() {
                                  //                       sel = !sel;
                                  //                       print(sel);
                                  //                     });
                                  //                   },
                                  //                   child: Icon(
                                  //                     Icons.favorite,
                                  //                     size:
                                  //                         getProportionateScreenWidth(
                                  //                             20),
                                  //                     color: sel
                                  //                         ? Colors.grey
                                  //                         : Colors.red,
                                  //                   ),
                                  //                 ),
                                  //               )
                                  //             ],
                                  //           ),
                                  //         )
                                  //       ],
                                  //     ),
                                  //   ],
                                  // ),
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

  showLoaderDialog(BuildContext context) {
    Widget circel = Center(child: CircularProgressIndicator());
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return circel;
      },
    );
  }
}
