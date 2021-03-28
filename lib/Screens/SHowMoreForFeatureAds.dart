import 'package:fasten/Widget/CustomButton.dart';
import 'package:flutter/material.dart';

import '../Helpers/images.dart';
import '../Helpers/size_conifg.dart';

import '../Controllers/AddFavController.dart';
import '../Controllers/UnFavController.dart';
import '../Controllers/AdTypesForAddController.dart';
import '../Controllers/HomeController.dart';
import '../Controllers/DeletadsController.dart';

import '../Models/DeletadsModel.dart';
import '../Models/HomeModel.dart';
import '../Models/AdTypesForAddModel.dart';

import '../Screens/EditAds.dart';

class SHowMoreForFeatureAds extends StatefulWidget {
  static String routeName = '/SHowMoreForFeatureAds';
  @override
  _SHowMoreForFeatureAdsState createState() => _SHowMoreForFeatureAdsState();
}

class _SHowMoreForFeatureAdsState extends State<SHowMoreForFeatureAds> {
  AddFavAdsController _addFavAdsController = AddFavAdsController();
  UnFavAdsController _unFavAdsController = UnFavAdsController();
  AdTypesForAddModel _adTypesForAddModel = AdTypesForAddModel();
  HomeModel _homeModel = HomeModel();
  AdTypesForAddController _adTypesForAddController = AdTypesForAddController();
  HomeController _homeController = HomeController();
  DeletadsController _deletadsController = DeletadsController();
  DeletadsModel _deletadsModel = DeletadsModel();
  bool _isLoading = false;
  bool _isDel = false;
  initState() {
    _getDataa();
    super.initState();
  }

  _getDataa() async {
    setState(() {
      _isLoading = true;
    });
    _homeModel = await _homeController.getHomeData();
    _adTypesForAddModel = await _adTypesForAddController.getadTypesForAdd();
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _deletAds(int id) async {
    setState(() {
      _isDel = true;
    });
    Map<String, dynamic> _result =
        await _deletadsController.deletads(adsid: id);
    setState(() {
      _isDel = false;
    });
    _getDataa();
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
      _getDataa();
    } else {
      print('Fialed For UnFav');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              'Latest Advertising',
              style: TextStyle(color: Colors.black),
            ),
            leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset(signout))),
        body: !_isLoading
            ? RefreshIndicator(
                onRefresh: () => _getDataa(),
                child: _homeModel.data.featuredAds.isEmpty
                    ? Center(child: Text('No FeaturedAds Now'))
                    : Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
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
                        padding: EdgeInsets.all(15.0),
                        child: ListView.builder(
                            itemCount: _homeModel.data.featuredAds.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(EditAds.routeName, arguments: {
                                    'id': _homeModel.data.featuredAds[index].id
                                  });
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      // side: BorderSide.none,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      // border: Border.all(color: Color(0xFFB83B5E)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    height: getProportionateScreenHeight(150),
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            // Container(
                                            //   height:
                                            //       getProportionateScreenHeight(
                                            //           150),
                                            //   width:
                                            //       getProportionateScreenWidth(
                                            //           120),
                                            //   decoration: BoxDecoration(
                                            //     borderRadius:
                                            //         BorderRadius.circular(
                                            //             10.0),
                                            //     image: DecorationImage(
                                            //         image: NetworkImage(
                                            //             _myAdsModel
                                            //                 .data
                                            //                 .data[index]
                                            //                 .images[0]
                                            //                 .fullFile),
                                            //         fit: BoxFit.cover),
                                            //   ),
                                            // ),

                                            Container(
                                              height:
                                                  getProportionateScreenHeight(
                                                      150),
                                              width:
                                                  getProportionateScreenWidth(
                                                      120),
                                              child: FadeInImage(
                                                placeholder: AssetImage(
                                                  'assets/images/loadingImage.png',
                                                ),
                                                image: NetworkImage(
                                                  _homeModel
                                                      .data
                                                      .featuredAds[index]
                                                      .lastImage
                                                      .fullFile,
                                                ),
                                                imageErrorBuilder:
                                                    (BuildContext context,
                                                        Object exception,
                                                        StackTrace stackTrace) {
                                                  return Container(
                                                    color: Colors.amber,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'Whoops!',
                                                      style: TextStyle(
                                                          fontSize: 30),
                                                    ),
                                                  );
                                                  ;
                                                },
                                                fit: BoxFit.cover,
                                              ),
                                            ),

                                            Container(
                                              width:
                                                  getProportionateScreenWidth(
                                                      110),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.all(5),
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          print(_homeModel
                                                              .data
                                                              .featuredAds[
                                                                  index]
                                                              .id);
                                                          _deletAds(_homeModel
                                                              .data
                                                              .featuredAds[
                                                                  index]
                                                              .id);
                                                        },
                                                        child:
                                                            Image.asset(delet)),
                                                  ),
                                                  Image.asset(sale),
                                                ],
                                              ),
                                            )
                                          ],
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
                                              _homeModel
                                                  .data.featuredAds[index].name
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          10),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(_homeModel
                                                .data
                                                .featuredAds[index]
                                                .category
                                                .name),
                                            Text(_homeModel
                                                .data.featuredAds[index].body),
                                            Text(
                                                '${_homeModel.data.featuredAds[index].price} \$'),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 12,
                                                    width: 12,
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
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                              );
                            })),
              )
            : Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              ));
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
