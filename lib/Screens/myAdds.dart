import '../Controllers/MyadsController.dart';
import '../Models/MyAdsModel.dart';
import '../Screens/EditAds.dart';
import '../Helpers/images.dart';
import '../Helpers/size_conifg.dart';
import '../Widget/CustomButton.dart';
import '../Controllers/DeletadsController.dart';
import '../Models/DeletadsModel.dart';

import 'package:flutter/material.dart';

class MyAdds extends StatefulWidget {
  static String routeName = '/myAdds';

  @override
  _MyAddsState createState() => _MyAddsState();
}

class _MyAddsState extends State<MyAdds> {
  bool _loading = false;
  bool _isDel = false;
  bool _isLoad = false;
  MyAdsModel _myAdsModel = MyAdsModel();
  MyadsController _myadsController = MyadsController();
  DeletadsController _deletadsController = DeletadsController();
  DeletadsModel _deletadsModel = DeletadsModel();

  // ///ForEditAds
  // EditAdsController _editAdsController = EditAdsController();
  // EditAdsModel _editAdsModel = EditAdsModel();
  // ///var for index
  // var colorindex;
  // var sizeindex;
  // var categoryindex;
  // var tybeindex;
  // int contactindex;
  // ///var for create ads
  // String name;
  // String body;
  // String price;
  // String contactname;
  // _editads() async {
  //   setState(() {
  //     _isLoad = true;
  //   });
  //   Map<String, dynamic> _result = await _editAdsController.editAds(
  //     category_Id: categoryindex,
  //     name: name,
  //     price: price,
  //     body: body,
  //     ad_typeId: tybeindex,
  //     attributes1: sizeindex,
  //     attributes2: colorindex,
  //     contname: contactname,
  //   );
  //
  //   if (_result['success']) {
  //     print(_result);
  //     print('Response Done');
  //     setState(() {
  //       _isLoad = false;
  //     });
  //   } else {
  //     print('error');
  //     setState(() {
  //       _isLoad = false;
  //     });
  //   }
  // }

  @override
  void initState() {
    _getmyAds();
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
    _getmyAds();
  }

  _getmyAds() async {
    setState(() {
      _loading = true;
    });
    _myAdsModel = await _myadsController.getmyAds();
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              )
            ],
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              'My Ads',
              style: TextStyle(color: Colors.black),
            ),
            leading: GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushReplacementNamed(EditAds.routeName);
                },
                child: Image.asset(signout))),
        body: !_loading
            ? RefreshIndicator(
                onRefresh: () => _getmyAds(),
                child: _myAdsModel.data.data.isEmpty
                    ? Text('NoData Now')
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
                            itemCount: _myAdsModel.data.data.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(EditAds.routeName, arguments: {
                                    'id': _myAdsModel.data.data[index].id
                                  });
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      // side: BorderSide.none,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          // border: Border.all(color: Color(0xFFB83B5E)),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        height:
                                            getProportionateScreenHeight(150),
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
                                                      _myAdsModel
                                                          .data
                                                          .data[index]
                                                          .lastImage
                                                          .fullFile,
                                                    ),
                                                    imageErrorBuilder:
                                                        (BuildContext context,
                                                            Object exception,
                                                            StackTrace
                                                                stackTrace) {
                                                      return Container(
                                                        color: Colors.amber,
                                                        alignment:
                                                            Alignment.center,
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
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        child: GestureDetector(
                                                            onTap: () {
                                                              print(_myAdsModel
                                                                  .data
                                                                  .data[index]
                                                                  .id);
                                                              _deletAds(
                                                                  _myAdsModel
                                                                      .data
                                                                      .data[
                                                                          index]
                                                                      .id);
                                                            },
                                                            child: Image.asset(
                                                                delet)),
                                                      ),
                                                      Image.asset(sale),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width:
                                                  getProportionateScreenWidth(
                                                      10),
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
                                                  _myAdsModel
                                                      .data.data[index].name
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize:
                                                          getProportionateScreenWidth(
                                                              10),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(_myAdsModel.data
                                                    .data[index].category.name),
                                                Text(_myAdsModel
                                                    .data.data[index].body),
                                                Text(
                                                    '${_myAdsModel.data.data[index].price} \$'),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        height: 12,
                                                        width: 12,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.green,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Center(
                                                          child: Container(
                                                            height: 3,
                                                            width: 3,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2),
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
                                      Positioned(
                                        left: getProportionateScreenHeight(323),
                                        child: Image.asset(bannar),
                                      ),
                                      Positioned(
                                        left: getProportionateScreenHeight(335),
                                        child: Image.asset(
                                          no,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
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
}
