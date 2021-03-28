import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controllers/AttributeForAddController.dart';
import '../Helpers/FormatColor.dart';
import '../Models/AttributeForAddModel.dart';
import '../Controllers/AdTypesForAddController.dart';
import '../Controllers/AllCategoryController.dart';
import '../Models/AdTypesForAddModel.dart';
import '../Models/AllCategoryModel.dart';
import '../Helpers/size_conifg.dart';
import '../Widget/SelectedColor.dart';
import '../Widget/seletCategory.dart';
import '../Helpers/images.dart';
import '../Controllers/CreateadsController.dart';
import '../Models/CreateadsModel.dart';
import '../Helpers/Loading.dart';
import '../Helpers/contactData.dart';

class AddAdds extends StatefulWidget {
  static String routeName = '/AddAdds';

  @override
  _AddAddsState createState() => _AddAddsState();
}

class _AddAddsState extends State<AddAdds> {
  AllCategoryModel _allCategoryModel = AllCategoryModel();
  AllCategoryController _allCategoryController = AllCategoryController();
  AdTypesForAddModel _adTypesForAddModel = AdTypesForAddModel();
  AdTypesForAddController _adTypesForAddController = AdTypesForAddController();
  AttributeForAddController _attributeForAddController =
      AttributeForAddController();
  AttributeForAddModel _attributeForAddModel = AttributeForAddModel();
  CreateadsController _createadsController = CreateadsController();
  CreateadsModel _createadsModel = CreateadsModel();
  List<Map> staticData = ContactData.data;
  Map<int, bool> selectedFlag = {};
  bool isSelectionMode = false;
  bool _isLoading = false;
  bool _isLoad = false;
  bool _isVisible = true;
  String _token;
  Color color = Colors.black;
  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  ///var for index
  var colorindex;
  var sizeindex;
  var categoryindex;
  var tybeindex;
  int contactindex;
  List<dynamic> _selecteditems = [];
  List<dynamic> _selecteditems2 = [];
  List _sellect = [];
  int id;
  var item;

  ///var for create ads
  String name;
  String body;
  String price;
  String contactname;

  File _file;
  Future getFile() async {
    File file = await FilePicker.getFile();
    setState(() {
      _file = file;
    });
  }

  void _uploadFile(filePath, BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // setState(() {
    //   _isLoad = true;
    // });
    String fileName = basename(filePath.path);
    print("file base name: $fileName");
    try {
      dio.FormData formData = new dio.FormData.fromMap({
        "images":
            await dio.MultipartFile.fromFile(filePath.path, filename: fileName),
      });
      dio.Response response = await dio.Dio().post(
          "https://fostan.demo.asol-tec.com/api/v1/ads/files/$id",
          data: formData,
          options: dio.Options(
              headers: {'Authorization': prefs.getString('token')}));
      print("File Upload response:$response");
      print(response.data);
    } catch (e) {
      print("Exiption is :$e");
      setState(() {
        _isLoad = false;
      });
    }
    // setState(() {
    //   _isLoad = false;
    // });
  }

  _getData() async {
    setState(() {
      _isLoading = true;
    });
    _allCategoryModel = await _allCategoryController.getAllCategory();
    _adTypesForAddModel = await _adTypesForAddController.getadTypesForAdd();
    _attributeForAddModel = await _attributeForAddController.getAttModel();

    setState(() {
      _isLoading = false;
    });
  }

  _createads(context) async {
    setState(() {
      _isLoad = true;
    });
    Map<String, dynamic> _result = await _createadsController.createads(
      category_Id: categoryindex,
      name: name,
      price: price,
      body: body,
      ad_typeId: tybeindex,
      attributes1: _selecteditems2.map((e) => e).toList(),
      attributes2: colorindex,
      contname: contactname,
    );

    if (_result['success'] == true) {
      print(_result);
      print('Response Done');
      setState(() {
        _isLoad = false;
        id = _result['id'];
      });
    } else {
      print('error');
      setState(() {
        _isLoad = false;
      });
    }
    _uploadFile(_file, context);
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  Color s = Color(0xFFFE7680);
  Color s2 = Color(0xFFB83B5E);
  List<Color> co1 = [
    Color(0xFFFE7680),
    Color(0xFFB83B5E),
  ];
  List<Color> co2 = [
    Colors.white,
    Colors.white,
  ];
  Future _getToke() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString('token');
      print(_token);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
        title: Text(
          'Add advertisement',
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
            onTap: () {
              print('SignOut');
              print(_allCategoryModel.message);
              print(_adTypesForAddModel.message);
              Navigator.of(context).pop();
            },
            child: Image.asset(signout)),
      ),
      body: !_isLoading
          ? _allCategoryModel.data.isEmpty
              ? Center(
                  child: Text('Sorry !'),
                )
              : RefreshIndicator(
                  onRefresh: () => _getData(),
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Advertising photos'),
                          GestureDetector(
                            onTap: getFile,
                            child: Container(
                              height: getProportionateScreenHeight(90),
                              child: _file == null
                                  ? Image.asset(gallery)
                                  : Image.file(_file),
                            ),
                          ),
                          Text('Advertising video'),
                          Container(
                            height: 90,
                            child: Image.asset(vid),
                          ),
                          Text(
                            'Choose the category',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: getProportionateScreenWidth(14),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),

                          ///WE Will Use it
                          // MultiSelectChipField(
                          //   items: _allCategoryModel.data
                          //       .map((e) => MultiSelectItem(e.id, e.name))
                          //       .toList(),
                          //   // initialValue: [
                          //   //   _animals[4],
                          //   //   _animals[7],
                          //   //   _animals[9]
                          //   // ],
                          //   title: Text(
                          //     "Choose the Category",
                          //     style: TextStyle(
                          //         decoration: TextDecoration.underline),
                          //   ),
                          //   headerColor: Colors.transparent,
                          //   decoration: BoxDecoration(
                          //     border:
                          //         Border.all(color: Colors.white, width: 1.8),
                          //   ),
                          //   selectedChipColor: s,
                          //   selectedTextStyle: TextStyle(color: Colors.white),
                          //   onTap: (values) {
                          //     _selecteditems = values;
                          //   },
                          // ),
                          ///Finish
                          ///ForTest
                          // MultiSelectDialogField(
                          //   items: _allCategoryModel.data
                          //       .map((e) => MultiSelectItem(e, e.name.toString()))
                          //       .toList(),
                          //   title: Text("Animals"),
                          //   selectedColor: Colors.blue,
                          //   buttonIcon: Icon(
                          //     Icons.pets,
                          //     color: Colors.blue,
                          //   ),
                          //   buttonText: Text(
                          //     "Favorite Animals",
                          //     style: TextStyle(
                          //       color: Colors.blue[800],
                          //       fontSize: 16,
                          //     ),
                          //   ),
                          //   onConfirm: (results) {
                          //     // _selectedAnimals = results;
                          //   },
                          // ),
                          ///Finish
                          AnimatedOpacity(
                            opacity: !_isVisible ? 1.0 : 0.5,
                            duration: Duration(milliseconds: 500),
                            child: Container(
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemCount: _allCategoryModel.data.length,
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 120,
                                        childAspectRatio: 4.5 / 1,
                                        crossAxisSpacing: 40,
                                        mainAxisSpacing: 10),
                                itemBuilder: (BuildContext context, int index) {
                                  return selectedCategory(
                                    textColor: categoryindex !=
                                            _allCategoryModel.data[index].id
                                        ? Colors.black
                                        : Colors.white,
                                    onTap: () {
                                      setState(() {
                                        categoryindex =
                                            _allCategoryModel.data[index].id;

                                        print(
                                            'categoryindex is $categoryindex');
                                      });
                                    },
                                    name: _allCategoryModel.data[index].name,
                                    sele: categoryindex !=
                                            _allCategoryModel.data[index].id
                                        ? Colors.white
                                        : s,
                                  );
                                },
                              ),
                            ),
                          ),
                          categoryindex != 0 && categoryindex != null
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: List.generate(
                                      _allCategoryModel.data[categoryindex - 1]
                                          .childs.length, (i) {
                                    return AnimatedOpacity(
                                        opacity: _isVisible ? 1.0 : 0.0,
                                        duration: Duration(milliseconds: 500),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _sellect.add(_allCategoryModel
                                                  .data[categoryindex - 1]
                                                  .childs[i]
                                                  .id);
                                            });
                                          },
                                          child: Container(
                                            child: Text(
                                              '${_allCategoryModel.data[categoryindex - 1].childs[i].name}',
                                              style: TextStyle(color: color),
                                            ),
                                          ),
                                        ));
                                  }),
                                )
                              : Container(),

                          SizedBox(
                            height: getProportionateScreenHeight(30),
                          ),
                          GestureDetector(
                            onTap: () {
                              print(_sellect.length);
                            },
                            child: Text(
                              'Ad details',
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(14),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.5),
                              color: Colors.grey[200],
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.transparent,
                                contentPadding: EdgeInsets.all(10),
                                hintText: 'product name',
                              ),
                              onChanged: (e) {
                                setState(() {
                                  name = e;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(8),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.5),
                              color: Colors.grey[200],
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.transparent,
                                contentPadding: EdgeInsets.all(10),
                                hintText: 'price',
                              ),
                              onChanged: (e) {
                                setState(() {
                                  price = e;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(8),
                          ),
                          Container(
                            height: getProportionateScreenHeight(100),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.5),
                              color: Colors.grey[200],
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.transparent,
                                contentPadding: EdgeInsets.all(10),
                                hintText: 'detailes',
                              ),
                              onChanged: (e) {
                                setState(() {
                                  body = e;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          Text(
                            'Type',
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(14),
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                _adTypesForAddModel.data.length,
                                (index) => selectedCategory(
                                  onTap: () {
                                    setState(() {
                                      tybeindex =
                                          _adTypesForAddModel.data[index].id;
                                    });
                                    print('tybeindex is $tybeindex');
                                  },
                                  textColor: tybeindex !=
                                          _adTypesForAddModel.data[index].id
                                      ? Colors.black
                                      : Colors.white,
                                  sele: tybeindex !=
                                          _adTypesForAddModel.data[index].id
                                      ? Colors.white
                                      : s,
                                  name: _adTypesForAddModel.data[index].name,
                                ),
                              )),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          Text('Sizes'),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          MultiSelectChipField(
                            height: getProportionateScreenHeight(40),
                            items: _attributeForAddModel.data[1].options
                                .map((e) => MultiSelectItem(e.id, e.name))
                                .toList(),
                            // initialValue: [
                            //   _animals[4],
                            //   _animals[7],
                            //   _animals[9]
                            // ],
                            title: Text(
                              "",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 12),
                            ),
                            chipWidth: 30,
                            headerColor: Colors.transparent,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white, width: 0.5),
                            ),
                            selectedChipColor: s,

                            selectedTextStyle: TextStyle(color: Colors.white),
                            onTap: (values) {
                              setState(() {
                                _selecteditems2 = values;
                              });
                            },
                          ),
                          // Container(
                          //   child: GridView.builder(
                          //     shrinkWrap: true,
                          //     physics: ScrollPhysics(),
                          //     itemCount:
                          //         _attributeForAddModel.data[1].options.length,
                          //     gridDelegate:
                          //         SliverGridDelegateWithMaxCrossAxisExtent(
                          //             maxCrossAxisExtent: 120,
                          //             childAspectRatio: 4.5 / 1,
                          //             crossAxisSpacing: 40,
                          //             mainAxisSpacing: 10),
                          //     itemBuilder: (BuildContext context, int index) {
                          //       return selectedCategory(
                          //         textColor: sizeindex !=
                          //                 _attributeForAddModel
                          //                     .data[1].options[index].id
                          //             ? Colors.black
                          //             : Colors.white,
                          //         onTap: () {
                          //           setState(() {
                          //             sizeindex = _attributeForAddModel
                          //                 .data[1].options[index].id;
                          //           });
                          //           print('Size index is $sizeindex');
                          //         },
                          //         name: _attributeForAddModel
                          //             .data[1].options[index].name,
                          //         sele: sizeindex !=
                          //                 _attributeForAddModel
                          //                     .data[1].options[index].id
                          //             ? Colors.white
                          //             : s,
                          //       );
                          //     },
                          //   ),
                          // ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          Text('Contact'),
                          SizedBox(
                            height: getProportionateScreenHeight(8),
                          ),
                          Container(
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: staticData.length,
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 120,
                                      childAspectRatio: 4.5 / 1,
                                      crossAxisSpacing: 40,
                                      mainAxisSpacing: 10),
                              itemBuilder: (BuildContext context, int index) {
                                Map data = staticData[index];
                                selectedFlag[index] =
                                    selectedFlag[index] ?? false;
                                bool isSelected = selectedFlag[index];
                                return selectedCategory(
                                  textColor: contactindex != data['id']
                                      ? Colors.black
                                      : Colors.white,
                                  onTap: () {
                                    setState(() {
                                      contactindex = data['id'];
                                      contactname = data['name'];
                                    });
                                    print('contactindex is $contactindex');
                                    print('contactname is $contactname');
                                  },
                                  name: data['name'],
                                  sele: contactindex != data['id']
                                      ? Colors.white
                                      : s,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          Text('Colors'),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          Container(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: List.generate(
                                    _attributeForAddModel
                                        .data[0].options.length, (index) {
                                  return SelectedColor(
                                    onTap: () {
                                      setState(() {
                                        colorindex = _attributeForAddModel
                                            .data[0].options[index].id;
                                      });
                                      print('Color index is $colorindex');
                                    },
                                    s: HexColor(
                                      _attributeForAddModel
                                          .data[0].options[index].name,
                                    ),
                                    set: colorindex !=
                                            _attributeForAddModel
                                                .data[0].options[index].id
                                        ? Colors.white
                                        : HexColor(
                                            _attributeForAddModel
                                                .data[0].options[index].name,
                                          ),
                                  );
                                })),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          _isLoad
                              ? Reusable.showLoader(_isLoad,
                                  width: getProportionateScreenHeight(50),
                                  height: getProportionateScreenHeight(50))
                              : Center(
                                  child: Container(
                                    width: getProportionateScreenWidth(340),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: s,
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        stops: [0.1, 0.9],
                                        colors: [
                                          Color(0xFFFE7680),
                                          Color(0xFFB83B5E),
                                        ],
                                      ),
                                    ),
                                    child: FlatButton(
                                      onPressed: () {
                                        // print(_selecteditems);
                                        // print(_allCategoryModel
                                        //         .data[1].childs??[0].name ??
                                        //     0);
                                        // print(categoryindex);
                                        // print(_allCategoryModel
                                        //     .data[categoryindex]
                                        //     .childs[categoryindex]
                                        //     .id
                                        //     .toString());
                                        _createads(context);
                                        // print(id);
                                        print(_selecteditems2.map((e) => e));

                                        // Navigator.of(context)
                                        //     .pushReplacementNamed(MyAdds.routeName);
                                      },
                                      child: Text(
                                        'Add advertisement',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                        ],
                      ),
                    ),
                  ),
                )
          : Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
            ),
    );
  }

  void onTap(bool isSelected, int index) {
    setState(() {
      selectedFlag[index] = !isSelected;
      print(staticData[index]['id']);
      // If there will be any true in the selectionFlag then
      // selection Mode will be true
      isSelectionMode = selectedFlag.containsValue(true);
    });
  }
}
