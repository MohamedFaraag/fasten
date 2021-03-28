import 'package:fasten/Screens/SHowMoreForFeatureAds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/HomeModel.dart';
import '../Models/AdTypesForAddModel.dart';

import '../Helpers/images.dart';
import '../Helpers/size_conifg.dart';

import '../Screens/AdTybeScreen.dart';
import '../Screens/SingleProduct.dart';
import '../Screens/ShowMoreForLatestAds.dart';
import '../Screens/add_Adds.dart';
import '../Screens/Login.dart';

import '../Widget/SelectCategory.dart';
import '../Widget/CustomButton.dart';
import '../Widget/HomeNavigationBar.dart';
import '../Widget/CustomAppBar.dart';

import '../Controllers/AddFavController.dart';
import '../Controllers/UnFavController.dart';
import '../Controllers/HomeController.dart';
import '../Controllers/AdTypesForAddController.dart';

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
  AdTypesForAddModel _adTypesForAddModel = AdTypesForAddModel();
  AdTypesForAddController _adTypesForAddController = AdTypesForAddController();
  bool _isLoading = false;
  String _token;

  initState() {
    _getHomeData();
    super.initState();
  }

  _getHomeData() async {
    setState(() {
      _isLoading = true;
    });
    _homeModel = await _homeController.getHomeData();
    _adTypesForAddModel = await _adTypesForAddController.getadTypesForAdd();
    setState(() {
      _isLoading = false;
    });
    _getToke();
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
        _getHomeData();
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
        _getHomeData();
      } else {
        print('Fialed For UnFav');
        Navigator.of(context).pop();
      }
    } else {
      showMyDialog(context);
    }
  }

  Future _getToke() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString('token');
      print(_token);
    });
  }

  bool sel = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: MyHomeBottomNavBar(),
          appBar: buildAppBAr(context, () {
            _token != null
                ? Navigator.of(context).pushNamed(AddAdds.routeName)
                : showMyDialog(context);
          }),
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
                                  SizedBox(
                                    height: getProportionateScreenHeight(13),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: _adTypesForAddModel.data.map((e) {
                                      return Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pushNamed(
                                                  AdTybeScreen.routeName,
                                                  arguments: {
                                                    "id": e.id,
                                                    "title": e.name
                                                  });
                                            },
                                            child: SelectCategory(
                                              image: e.image,
                                            ),
                                          ),
                                          Text(e.name)
                                        ],
                                      );
                                    }).toList(),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(20),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Featured Advertising',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      17),
                                              color: Color(0xFF222222)),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                                SHowMoreForFeatureAds.routeName,
                                                arguments: {});
                                          },
                                          child: Text(
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
                                        ),
                                      ],
                                    ),
                                  ),
                                  _homeModel.data.featuredAds.isNotEmpty
                                      ? Container(
                                          height:
                                              getProportionateScreenHeight(285),
                                          width: double.infinity,
                                          child: GridView.builder(
                                            shrinkWrap: true,
                                            physics: ScrollPhysics(),
                                            itemCount: _homeModel
                                                .data.featuredAds.length,
                                            gridDelegate:
                                                SliverGridDelegateWithMaxCrossAxisExtent(
                                                    maxCrossAxisExtent:
                                                        getProportionateScreenHeight(
                                                            285),
                                                    childAspectRatio: 2 / 3,
                                                    crossAxisSpacing: 30,
                                                    mainAxisSpacing: 8),
                                            itemBuilder: (context, i) {
                                              return GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                          SingleProduct
                                                              .routeName,
                                                          arguments: {
                                                        "id": _homeModel.data
                                                            .featuredAds[i].id
                                                      });
                                                },
                                                child: Card(
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.5),
                                                        ),
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.5),
                                                              border: Border.all(
                                                                  color: _homeModel
                                                                          .data
                                                                          .featuredAds[
                                                                              i]
                                                                          .isFav
                                                                      ? Color(
                                                                          0xFFB83B5E)
                                                                      : Colors
                                                                          .transparent,
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
                                                                            .featuredAds[
                                                                                i]
                                                                            .images
                                                                            .isEmpty
                                                                        ? AssetImage(
                                                                            'assets/images/loadingImage.png')
                                                                        : NetworkImage(_homeModel
                                                                            .data
                                                                            .featuredAds[i]
                                                                            .images[0]
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
                                                                    .featuredAds[
                                                                        i]
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
                                                                '${_homeModel.data.featuredAds[i].price} \$',
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
                                                                  .featuredAds[
                                                                      i]
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
                                                                      name:
                                                                          'Xl'),
                                                                  CustomButton(
                                                                      name:
                                                                          'L'),
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
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            getProportionateScreenHeight(3),
                                                                        width:
                                                                            getProportionateScreenWidth(3),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          borderRadius:
                                                                              BorderRadius.circular(2),
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
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            getProportionateScreenHeight(3),
                                                                        width:
                                                                            getProportionateScreenWidth(3),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          borderRadius:
                                                                              BorderRadius.circular(2),
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
                                                                          .all(
                                                                      15.0),
                                                              child:
                                                                  Image.asset(
                                                                      sale),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      15.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () => _homeModel
                                                                        .data
                                                                        .featuredAds[
                                                                            i]
                                                                        .isFav
                                                                    ? _unFavAdss(
                                                                        _homeModel
                                                                            .data
                                                                            .featuredAds[
                                                                                i]
                                                                            .id)
                                                                    : _addFavAdd(
                                                                        _homeModel
                                                                            .data
                                                                            .featuredAds[i]
                                                                            .id),
                                                                child: Icon(
                                                                  Icons
                                                                      .favorite,
                                                                  size: 20,
                                                                  color: _homeModel
                                                                          .data
                                                                          .featuredAds[
                                                                              i]
                                                                          .isFav
                                                                      ? Colors
                                                                          .red
                                                                      : Colors
                                                                          .grey,
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
                                            },
                                          ))
                                      : Container(
                                          height:
                                              getProportionateScreenHeight(258),
                                          child: Center(
                                            child: Text('No FeaturedAds  Now'),
                                          ),
                                        ),
                                  // Container(
                                  //   child: GridView.builder(
                                  //       shrinkWrap: true,
                                  //       physics: ScrollPhysics(),
                                  //       gridDelegate:
                                  //           SliverGridDelegateWithMaxCrossAxisExtent(
                                  //               maxCrossAxisExtent: 120,
                                  //               childAspectRatio: 4.5 / 1,
                                  //               crossAxisSpacing: 40,
                                  //               mainAxisSpacing: 10),
                                  //       itemBuilder:
                                  //           (BuildContext context, int ix) {
                                  //         return Container(
                                  //           child: Text('asdas'),
                                  //         );
                                  //       }),
                                  // ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Latest Advertising',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      17),
                                              color: Color(0xFF222222)),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                                ShowMoreForLatestAds.routeName);
                                          },
                                          child: Text(
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
                                              Navigator.of(context).pushNamed(
                                                  SingleProduct.routeName,
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
                                                              BorderRadius.circular(
                                                                  10.5),
                                                          border: Border.all(
                                                              color: _homeModel
                                                                      .data
                                                                      .latestAds[
                                                                          index]
                                                                      .isFav
                                                                  ? Color(
                                                                      0xFFB83B5E)
                                                                  : Colors
                                                                      .transparent,
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
                                                            175),
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
