import 'package:fasten/Controllers/myFavadsController.dart';
import 'package:fasten/Models/myFavadsModel.dart';
import 'package:fasten/Screens/Login.dart';
import 'package:fasten/Widget/HomeNavigationBar.dart';
import 'package:flutter/material.dart';

import '../Helpers/images.dart';
import '../Helpers/size_conifg.dart';
import '../Widget/CustomButton.dart';
import '../Screens/Home.dart';
import '../Widget/myAppBar.dart';
import '../Controllers/AttributeForAddController.dart';
import '../Models/AttributeForAddModel.dart';

class Favorite extends StatefulWidget {
  static String routeName = '/Favorite';

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool sel = false;
  String _token;
  bool _isLoading = false;
  MyFavadsController _myFavadsController = MyFavadsController();
  MyFavAdsModel _myFavAdsModel = MyFavAdsModel();
  AttributeForAddModel _attributeForAddModel = AttributeForAddModel();
  AttributeForAddController _attributeForAddController =
      AttributeForAddController();

  @override
  initState() {
    _getmyFavads();
  }

  _getmyFavads() async {
    setState(() {
      _isLoading = true;
    });
    _myFavAdsModel = await _myFavadsController.getMyFavads();
    _attributeForAddModel = await _attributeForAddController.getAttModel();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: MyHomeBottomNavBar(),
      appBar: myAppBar(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(Home.routeName);
          },
          name: 'Wish list',
          iset: false),
      body: !_isLoading
          ? RefreshIndicator(
              onRefresh: () => _getmyFavads(),
              child: _myFavAdsModel.data.favorites.isEmpty
                  ? Center(
                      child: Text('No Data Now'),
                    )
                  : Container(
                      padding: EdgeInsets.all(15.0),
                      child: ListView.builder(
                        itemCount: _myFavAdsModel.data.favorites.length,
                        itemBuilder: (context, index) {
                          int option_idforsize = _myFavAdsModel
                              .data
                              .favorites[index]
                              .attributesData[1]
                              .selectedOptions[0]
                              .optionId;

                          return Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print(option_idforsize);
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      // side: BorderSide.none,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Container(
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      // border: Border.all(color: Color(0xFFB83B5E)),
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    height: getProportionateScreenHeight(150),
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height:
                                              getProportionateScreenHeight(150),
                                          width:
                                              getProportionateScreenWidth(150),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            image: DecorationImage(
                                                image: _myFavAdsModel
                                                        .data
                                                        .favorites[index]
                                                        .images
                                                        .isEmpty
                                                    ? AssetImage(
                                                        'assets/images/loadingImage.png')
                                                    : NetworkImage(
                                                        _myFavAdsModel
                                                            .data
                                                            .favorites[index]
                                                            .images[0]
                                                            .fullFile),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              getProportionateScreenWidth(10),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height:
                                                  getProportionateScreenHeight(
                                                      15),
                                            ),
                                            Text(
                                              _myFavAdsModel
                                                  .data.favorites[index].name,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(_myFavAdsModel
                                                .data.favorites[index].body),
                                            Text(_myFavAdsModel
                                                .data
                                                .favorites[index]
                                                .category
                                                .name),
                                            Text(
                                                '${_myFavAdsModel.data.favorites[index].price} \$'),
                                            Container(
                                              child: Row(
                                                children: [
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
                                                        height: 3,
                                                        width: 3,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // Row(
                                            //     children: List.generate(
                                            //   _myFavAdsModel
                                            //       .data
                                            //       .favorites[index]
                                            //       .attributesData[1]
                                            //       .selectedOptions
                                            //       .length,
                                            //   (index) => CustomButton(
                                            //     name: _attributeForAddModel
                                            //         .data[1]
                                            //         .options[option_idforsize]
                                            //         .name,
                                            //   ),
                                            // ))
                                            // Row(
                                            //   mainAxisAlignment:
                                            //       MainAxisAlignment
                                            //           .spaceBetween,
                                            //   crossAxisAlignment:
                                            //       CrossAxisAlignment.start,
                                            //   children: [
                                            //
                                            //     SizedBox(
                                            //       width:
                                            //           getProportionateScreenHeight(
                                            //               5),
                                            //     ),
                                            //     CustomButton(name: 'S'),
                                            //     SizedBox(
                                            //       width:
                                            //           getProportionateScreenHeight(
                                            //               5),
                                            //     ),
                                            //     CustomButton(name: 'L'),
                                            //   ],
                                            // )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(10),
                                      width: getProportionateScreenWidth(160),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(sale),
                                          Image.asset(delet),
                                        ],
                                      )),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(
                                      Icons.favorite,
                                      size: getProportionateScreenWidth(20),
                                      color: sel ? Colors.grey : Colors.red,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          );
                        },
                      ),
                    )
              // : Center(
              //     child: GestureDetector(
              //       onTap: () {
              //         Navigator.of(context)
              //             .pushReplacementNamed(Login.routeName);
              //       },
              //       child: Text(
              //         'PLEASE LOGIN ! ',
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 16,
              //         ),
              //       ),
              //     ),
              //   ),
              )
          : Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              ),
            ),
    );
  }
}
// Image.asset(delet),
// CustomButton(
// name: _attributeForAddModel
//     .data[1]
// .options[option_idforsize]
// .name,
// ),
