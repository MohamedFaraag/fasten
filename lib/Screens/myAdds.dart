import '../Controllers/MyadsController.dart';
import '../Models/MyAdsModel.dart';
import '../Screens/add_Adds.dart';
import '../Helpers/images.dart';
import '../Helpers/size_conifg.dart';
import '../Widget/CustomButton.dart';

import 'package:flutter/material.dart';

class MyAdds extends StatefulWidget {
  static String routeName = '/myAdds';

  @override
  _MyAddsState createState() => _MyAddsState();
}

class _MyAddsState extends State<MyAdds> {
  bool _loading = false;
  MyAdsModel _myAdsModel = MyAdsModel();
  MyadsController _myadsController = MyadsController();
  @override
  void initState() {
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
                  Navigator.of(context).pushReplacementNamed(AddAdds.routeName);
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
                              return Card(
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
                                      height: getProportionateScreenHeight(150),
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                height: 150,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                        _myAdsModel
                                                            .data
                                                            .data[index]
                                                            .images[0]
                                                            .fullFile,
                                                      ),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    getProportionateScreenWidth(
                                                        125),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      child: Image.asset(delet),
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
                                                _myAdsModel
                                                    .data.data[index].name
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(_myAdsModel.data.data[index]
                                                  .category.name.en),
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
                                                      decoration: BoxDecoration(
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
                                                            color: Colors.white,
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
