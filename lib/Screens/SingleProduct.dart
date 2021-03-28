import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helpers/images.dart';
import '../Helpers/size_conifg.dart';
import '../Helpers/constant.dart';

import '../Widget/Buttons.dart';
import '../Widget/CustomButton.dart';
import '../Widget/SelectedColorSmallVer.dart';

import '../Models/SingleProductModel.dart';
import '../Models/RelatedAdsModel.dart';

import '../Controllers/SingleProductController.dart';
import '../Controllers/RelatedAdsController.dart';
import '../Controllers/AddFavController.dart';
import '../Controllers/UnFavController.dart';

import '../Screens/Login.dart';

import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SingleProduct extends StatefulWidget {
  static String routeName = '/Details';

  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  SingleProductContoller _singleProductContoller = SingleProductContoller();
  SingleProductModel _singleProductModel = SingleProductModel();
  RelatedAdsController _relatedAdsController = RelatedAdsController();
  RelatedAdsModel _relatedAdsModel = RelatedAdsModel();
  AddFavAdsController _addFavAdsController = AddFavAdsController();
  UnFavAdsController _unFavAdsController = UnFavAdsController();
  var rating = 3.0;
  bool isSet = false;
  int id = 0;
  bool _isLoading = false;
  String _token;
  @override
  initState() {
    super.initState();
    _getToken();
  }

  _getData() async {
    setState(() {
      _isLoading = true;
    });
    _singleProductModel = await _singleProductContoller.getSingleProduct(id);
    setState(() {
      _isLoading = false;
    });
  }

  _getRelatedAds() async {
    setState(() {
      _isLoading = true;
    });
    _relatedAdsModel = await _relatedAdsController.getRelatedAds(id);
    setState(() {
      _isLoading = false;
    });
  }

  void _addFavAdd(int curentid) async {
    if (_token != null) {
      showLoaderDialog.call(context);

      Map<String, dynamic> _result =
          await _addFavAdsController.addFavAds(adid: curentid);

      if (_result['success'] == true) {
        print('Response Done For addFav Done');
        print(_result);
        print(curentid);
        Navigator.pop(context);
        _getRelatedAds();
      } else {
        print('Failed For addFav');
        Navigator.of(context).pop();
      }
    } else {
      showMyDialog(context);
    }
  }

  void _unFavAdss(int setid) async {
    if (_token != null) {
      showLoaderDialog(context);

      Map<String, dynamic> _resultt =
          await _unFavAdsController.unFavads(adid: setid);
      if (_resultt['success'] == true) {
        print('Response For UnFav Done');
        print(_resultt);
        print(setid);
        Navigator.pop(context);
        _getRelatedAds();
      } else {
        print('Fialed For UnFav');
        Navigator.of(context).pop();
      }
    } else {
      showMyDialog(context);
    }
  }

  _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString('token');
    });

    _getData();
    _getRelatedAds();
  }

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    setState(() {
      id = routeArg["id"];
    });
    print(id);
    print(_singleProductModel.success);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(signout)),
          actions: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: !_isLoading && _singleProductModel.data != null
            ? Container(
                padding: EdgeInsets.all(15.0),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _singleProductModel.data.images.isNotEmpty
                            ? Container(
                                height: getProportionateScreenHeight(312),
                                width: getProportionateScreenWidth(375),
                                // decoration: BoxDecoration(
                                //   image: DecorationImage(
                                //     image: NetworkImage(
                                //         _singleProductModel.data.images[0].fullFile),
                                //   ),
                                // ),
                                child: FadeInImage(
                                  placeholder: AssetImage(
                                      'assets/images/loadingImage.png'),
                                  image: NetworkImage(_singleProductModel
                                      .data.images[0].fullFile),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Center(
                                child: Container(
                                  child: Text(
                                    'Sorry! No Images For this adds ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21),
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
                              itemCount: _singleProductModel.data.images.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: getProportionateScreenHeight(112),
                                  width: getProportionateScreenWidth(112),
                                  // decoration: BoxDecoration(
                                  //   image: DecorationImage(
                                  //     image: NetworkImage(
                                  //       _singleProductModel
                                  //           .data.images[index].fullFile,
                                  //     ),
                                  //   ),
                                  // ),
                                  child: FadeInImage(
                                    placeholder: AssetImage(
                                        'assets/images/loadingImage.png'),
                                    image: NetworkImage(_singleProductModel
                                        .data.images[index].fullFile),
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        Text(
                          '${_singleProductModel.data.price} \$',
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(20),
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFB83B5E),
                          ),
                        ),
                        Container(
                          width: getProportionateScreenWidth(200),
                          child: Text(
                            _singleProductModel.data.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: getProportionateScreenWidth(20),
                                color: Colors.black),
                          ),
                        ),
                        Text(
                          _singleProductModel.data.body,
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
                            GestureDetector(
                                onTap: () {
                                  print(_singleProductModel.data.id.toString());
                                },
                                child: Text(
                                    'It is ${_singleProductModel.data.distance} km away')),
                            Text('${_singleProductModel.data.id} days ago'),
                            Text(_singleProductModel.data.adViews.toString()),
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
                              isReadOnly: true,
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
                          onPressed: () {
                            print(_singleProductModel.message);
                          },
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
                              Text(_singleProductModel.data.body),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              Text(
                                'Code : ${_singleProductModel.data.id} ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenWidth(18),
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(5),
                              ),
                              Text(
                                'Category : ${_singleProductModel.data.category.name}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenWidth(18),
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(5),
                              ),
                              // Text(
                              //   'Size : $} ',
                              //   style: TextStyle(
                              //     fontWeight: FontWeight.bold,
                              //     fontSize: getProportionateScreenWidth(18),
                              //   ),
                              // ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
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
                                      '${_singleProductModel.data.averageRating} Rate ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                            getProportionateScreenWidth(17),
                                      ),
                                    ),
                                    Text(
                                      '4.5 From 5.0 ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                            getProportionateScreenWidth(17),
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
                              itemCount: _relatedAdsModel.data.data.length,
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    Container(
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
                                                      150),
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image:
                                                        AssetImage(ProImage[0]),
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width:
                                                      getProportionateScreenWidth(
                                                          200),
                                                  child: Text(
                                                    _relatedAdsModel
                                                        .data.data[index].name,
                                                    style: TextStyle(
                                                        fontSize:
                                                            getProportionateScreenWidth(
                                                                12),
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                                Text(
                                                  '${_relatedAdsModel.data.data[index].price} \$',
                                                  style: TextStyle(
                                                      fontSize:
                                                          getProportionateScreenWidth(
                                                              12),
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            Text(_relatedAdsModel
                                                .data.data[index].body),
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
                                              onTap: () => _relatedAdsModel
                                                      .data.data[index].isFav
                                                  ? _unFavAdss(_relatedAdsModel
                                                      .data.data[index].id)
                                                  : _addFavAdd(_relatedAdsModel
                                                      .data.data[index].id),
                                              child: Icon(
                                                Icons.favorite,
                                                size: 20,
                                                color: _relatedAdsModel
                                                        .data.data[index].isFav
                                                    ? Colors.red
                                                    : Colors.grey,
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
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(
                  backgroundColor: s,
                ),
              ),
      ),
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

  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        // user must tap button!
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(
              'Please Login !',
              style: TextStyle(
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w400,
                fontSize: getProportionateScreenWidth(18),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Login',
                  style: TextStyle(color: Color(0xFFFE7680)),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(Login.routeName);
                },
              ),
              TextButton(
                child: Text(
                  'Exit',
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
