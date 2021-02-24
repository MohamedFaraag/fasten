import 'package:fasten/Controllers/MyadsController.dart';
import 'package:fasten/Controllers/myFavadsController.dart';
import 'package:fasten/Models/MyAdsModel.dart';
import 'package:fasten/Models/myFavadsModel.dart';
import 'package:flutter/material.dart';

import '../Helpers/images.dart';
import '../Helpers/size_conifg.dart';
import '../Widget/CustomButton.dart';
import '../Screens/Home.dart';
import '../Widget/myAppBar.dart';

class Favorite extends StatefulWidget {
  static String routeName = '/Favorite';

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool sel = false;
  bool _isLoading = false;
  MyFavadsController _myFavadsController = MyFavadsController();
  MyFavAdsModel _myFavAdsModel = MyFavAdsModel();
  @override
  initState() {
    _getmyFavads();
  }

  _getmyFavads() async {
    setState(() {
      _isLoading = true;
    });
    _myFavAdsModel = await _myFavadsController.getMyFavads();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: myAppBar(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(Home.routeName);
          },
          name: 'Wish list'),
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
                        itemCount: ProImage.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Card(
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height:
                                            getProportionateScreenHeight(150),
                                        width: getProportionateScreenWidth(150),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                ProImage[index],
                                              ),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(10),
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
                                            'Women shoes',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text('Guess tan side zip boots'),
                                          Text('women'),
                                          Text('1000 \$'),
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
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomButton(
                                                name: 'XXl',
                                              ),
                                              SizedBox(
                                                width:
                                                    getProportionateScreenHeight(
                                                        5),
                                              ),
                                              CustomButton(name: 'Xl'),
                                              SizedBox(
                                                width:
                                                    getProportionateScreenHeight(
                                                        5),
                                              ),
                                              CustomButton(name: 'L'),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
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
                    ),
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
