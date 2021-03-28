import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helpers/constant.dart';
import '../Helpers/images.dart';
import '../Helpers/size_conifg.dart';

import '../Models/GetTyBesModel.dart';

import '../Controllers/GetTyBesController.dart';

import '../Widget/CustomButton.dart';

class AdTybeScreen extends StatefulWidget {
  static String routeName = '/AdTybeScreen';

  @override
  _AdTybeScreenState createState() => _AdTybeScreenState();
}

class _AdTybeScreenState extends State<AdTybeScreen> {
  bool isSeletcted = false;
  bool _isLoading = false;
  int id = 0;
  String _token;
  GetTyBesModel _getTyBesModel = GetTyBesModel();
  GetTyBesController _getTyBesController = GetTyBesController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getToken();
  }

  _getData() async {
    setState(() {
      _isLoading = true;
    });
    _getTyBesModel = await _getTyBesController.getDataa(id);
    setState(() {
      _isLoading = false;
    });
  }

  _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString('token');
    });

    _getData();
  }

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;

    setState(() {
      id = routeArg['id'];
    });

    String title = routeArg['title'];
    print(id);

    return Scaffold(
      // bottomNavigationBar: MyHomeBottomNavBar(),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
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
      body: !_isLoading
          ? RefreshIndicator(
              onRefresh: () => _getData(),
              child: _getTyBesModel.data == null
                  ? Center(
                      child: Text('No Data Now'),
                    )
                  : Container(
                      padding: EdgeInsets.all(15.0),
                      child: ListView(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.tune),
                              Text(
                                  '${_getTyBesModel.data.data.length.toString()} Adds'),
                              Text('Ranking: $title'),
                            ],
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _getTyBesModel.data.data.isEmpty
                                  ? Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2,
                                      child: Center(
                                        child: Text('No Data Now'),
                                      ),
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                          _getTyBesModel.data.data.length,
                                          (index) {
                                        return Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                // border: Border.all(color: Color(0xFFB83B5E)),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              height:
                                                  getProportionateScreenHeight(
                                                      170),
                                              width: double.infinity,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Container(
                                                        height:
                                                            getProportionateScreenHeight(
                                                                150),
                                                        width:
                                                            getProportionateScreenWidth(
                                                                150),
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                                  image:
                                                                      NetworkImage(
                                                                    _getTyBesModel
                                                                        .data
                                                                        .data[
                                                                            index]
                                                                        .lastImage
                                                                        .fullFile,
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        getProportionateScreenWidth(
                                                            10),
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height:
                                                            getProportionateScreenHeight(
                                                                15),
                                                      ),
                                                      Container(
                                                        width:
                                                            getProportionateScreenWidth(
                                                                170),
                                                        child: Text(
                                                          _getTyBesModel.data
                                                              .data[index].name,
                                                          overflow:
                                                              TextOverflow.clip,
                                                          style: TextStyle(
                                                              fontSize:
                                                                  getProportionateScreenWidth(
                                                                      15),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ),
                                                      Text(_getTyBesModel.data
                                                          .data[index].body),
                                                      // Text('women'),
                                                      Text(
                                                          '${_getTyBesModel.data.data[index].price} \$'),
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              height:
                                                                  getProportionateScreenWidth(
                                                                      12),
                                                              width:
                                                                  getProportionateScreenHeight(
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
                                                      //     mainAxisAlignment:
                                                      //         MainAxisAlignment
                                                      //             .spaceBetween,
                                                      //     crossAxisAlignment:
                                                      //         CrossAxisAlignment
                                                      //             .start,
                                                      //     children: List.generate(
                                                      //         _getTyBesModel
                                                      //             .data
                                                      //             .data[index]
                                                      //             .attributesData[
                                                      //                 1]
                                                      //             .selectedOptions
                                                      //             .length, (i) {
                                                      //       String id = _getTyBesModel
                                                      //           .data
                                                      //           .data[index]
                                                      //           .attributesData[
                                                      //               2]
                                                      //           .selectedOptions[
                                                      //               i]
                                                      //           .name;
                                                      //       return CustomButton(
                                                      //         name: id,
                                                      //       );
                                                      //     })
                                                      //     //[
                                                      //     //   CustomButton(name: 'ss'),
                                                      //     //   SizedBox(
                                                      //     //     width:
                                                      //     //         getProportionateScreenHeight(
                                                      //     //             5),
                                                      //     //   ),
                                                      //     //   CustomButton(name: 'Xl'),
                                                      //     //   SizedBox(
                                                      //     //     width:
                                                      //     //         getProportionateScreenHeight(
                                                      //     //             5),
                                                      //     //   ),
                                                      //     //   CustomButton(name: 'L'),
                                                      //     // ],
                                                      //     )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Image.asset(sale),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        isSeletcted =
                                                            !isSeletcted;
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.favorite,
                                                      size: 20,
                                                      color: isSeletcted
                                                          ? Colors.red
                                                          : Colors.grey,
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
                    ),
            )
          : Center(
              child: CircularProgressIndicator(
                backgroundColor: s,
              ),
            ),
    );
  }
}
// Container(
// height: getProportionateScreenHeight(815),
// width: double.infinity,
// child: ListView.builder(itemBuilder: (context, index) {
// return Card();
// }),
// )
