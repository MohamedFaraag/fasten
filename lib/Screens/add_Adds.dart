import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_select/smart_select.dart';

import '../Controllers/AttributeForAddController.dart';
import '../Controllers/AdTypesForAddController.dart';
import '../Controllers/AllCategoryController.dart';
import '../Controllers/CreateadsController.dart';
import '../Controllers/AllAttributesController.dart';

import '../Models/AllAttributesModel.dart';
import '../Models/AttributeForAddModel.dart';
import '../Models/AdTypesForAddModel.dart';
import '../Models/AllCategoryModel.dart';
import '../Models/CreateadsModel.dart';

import '../Helpers/FormatColor.dart';
import '../Helpers/size_conifg.dart';
import '../Helpers/images.dart';
import '../Helpers/Loading.dart';
import '../Helpers/contactData.dart';

import '../Widget/seletCategory.dart';

import '../Screens/myAdds.dart';

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
  AllAttributesController _allAttributesController = AllAttributesController();
  AllAttributesModel _allAttributesModel = AllAttributesModel();

  List<Map> staticData = ContactData.data;
  Map<int, bool> selectedFlag = {};
  bool isSelectionMode = false;
  bool _isLoading = false;
  bool _isLoad = false;
  bool _isVisible = true;
  String _token;
  Color color = Colors.black;
  final _multiSelectKey = GlobalKey<FormFieldState>();
  final _multiSelectss = GlobalKey<FormFieldState>();
  final _mutliSelectXX = GlobalKey<FormFieldState>();
  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
      categoryindex = null;
    });
  }

  List colorList = [];
  List<dynamic> value = [];
  List<S2Choice<String>> options = [
    S2Choice<String>(value: 'ion', title: 'Ionic'),
    S2Choice<String>(value: 'flu', title: 'Flutter'),
    S2Choice<String>(value: 'rea', title: 'React Native'),
  ];

  ///var for index
  int colorindex;
  var sizeindex;
  var categoryindex;
  var tybeindex;
  int contactindex;
  List<int> _selecteditems = [];
  List<int> _selectSize = [];
  List<int> _selectedContact = [];

  List _sellect = [];
  int id;

  var item;

  ///TestForMe
  List<AdTypesForAddModel> itemList;
  List<AdTypesForAddModel> selectedList;

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
    _allAttributesModel = await _allAttributesController.AllAttributes();
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
      attributes1: _selectSize,
      attributes2: colorindex,
      contname: contactname,
    );

    if (_result['success'] == true) {
      print(_result);
      print('Response Done');
      Navigator.of(context).pushReplacementNamed(MyAdds.routeName);
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
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),

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
                              ? AnimatedOpacity(
                                  duration: Duration(milliseconds: 500),
                                  opacity: _isVisible ? 1.0 : 0.5,
                                  child: MultiSelectChipField(
                                    height: getProportionateScreenHeight(40),
                                    items: _allCategoryModel
                                        .data[categoryindex - 1].childs
                                        //
                                        .map((e) =>
                                            MultiSelectItem(e.id, e.name))
                                        .toList(),

                                    title: Text(
                                      "",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 12),
                                    ),
                                    // chipWidth: 30,
                                    headerColor: Colors.transparent,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 0.5),
                                    ),
                                    selectedChipColor: s,

                                    selectedTextStyle:
                                        TextStyle(color: Colors.white),
                                    onTap: (values) {
                                      setState(() {
                                        _selectSize = values;
                                      });
                                    },
                                  ),
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

                          MultiSelectChipField(
                            key: _multiSelectKey,
                            height: getProportionateScreenHeight(40),
                            title: Text(
                              'Size',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            chipWidth: 25,
                            textStyle:
                                TextStyle(color: Colors.black, fontSize: 13),
                            headerColor: Colors.transparent,
                            items: _attributeForAddModel.data[1].options
                                .map((e) => MultiSelectItem(e.id, e.name))
                                .toList(),
                            itemBuilder: (
                              item,
                              state,
                            ) {
                              return GestureDetector(
                                onTap: () {
                                  _selectSize.contains(item.value)
                                      ? _selectSize.remove(item.value)
                                      : _selectSize.add(item.value);
                                  state.didChange(_selectSize);
                                  _multiSelectKey.currentState.validate();
                                  print(_selectSize);
                                },
                                child: Card(
                                  elevation: 0.0,
                                  child: Container(
                                    // padding: EdgeInsets.all(value),
                                    decoration: BoxDecoration(
                                      color: _selectSize.contains(item.value)
                                          ? s
                                          : Colors.white,
                                      border: Border.all(
                                          color: Colors.grey, width: 1.3),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    // height: getProportionateScreenHeight(10),
                                    width: getProportionateScreenWidth(80),
                                    child: Center(
                                        child: Text(
                                      item.label,
                                    )),
                                  ),
                                ),
                              );
                            },

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.transparent),
                            ),
                            // title: Text(
                          ),

                          MultiSelectChipField(
                            key: _mutliSelectXX,
                            height: getProportionateScreenHeight(40),
                            title: Text(
                              'Contact',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            chipWidth: 25,
                            textStyle:
                                TextStyle(color: Colors.black, fontSize: 13),
                            headerColor: Colors.transparent,
                            items: _allAttributesModel
                                .data.attributes[2].selectedOptions
                                .map((e) => MultiSelectItem(e.id, e.name))
                                .toList(),
                            itemBuilder: (
                              item,
                              state,
                            ) {
                              return GestureDetector(
                                onTap: () {
                                  _selectSize.contains(item.value)
                                      ? _selectSize.remove(item.value)
                                      : _selectSize.add(item.value);
                                  state.didChange(_selectSize);
                                  _multiSelectKey.currentState.validate();
                                  print(_selectSize);
                                },
                                child: Card(
                                  elevation: 0.0,
                                  child: Container(
                                    decoration: BoxDecoration(

                                      border: Border.all(
                                          color: Colors.grey, width: 1.3),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    height: getProportionateScreenHeight(29),
                                    width: getProportionateScreenWidth(100),
                                    child: Center(
                                        child: Text(
                                      item.label,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )),
                                  ),
                                ),
                              );
                            },

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.transparent),
                            ),
                            // title: Text(
                          ),

                          MultiSelectChipField(
                            key: _multiSelectss,
                            height: getProportionateScreenHeight(40),
                            title: Text(
                              'Colors',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            chipWidth: 25,

                            headerColor: Colors.transparent,
                            items: _attributeForAddModel.data[0].options
                                .map((e) => MultiSelectItem(e.id, e.name))
                                .toList(),
                            itemBuilder: (
                              item,
                              state,
                            ) {
                              return GestureDetector(
                                onTap: () {
                                  _selecteditems.contains(item.value)
                                      ? _selecteditems.remove(item.value)
                                      : _selecteditems.add(item.value);
                                  state.didChange(_selecteditems);
                                  _multiSelectss.currentState.validate();
                                  print(_selecteditems);
                                },
                                child: Card(
                                  elevation: 0.0,
                                  child: Container(
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            color: _selecteditems
                                                    .contains(item.value)
                                                ? HexColor(item.label)
                                                : Colors.white,
                                            border: Border.all(
                                                color: Colors.grey[400]),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: Center(
                                            child: Container(
                                              height: 15,
                                              width: 15,
                                              decoration: BoxDecoration(
                                                color: HexColor(item.label),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Container(
                                                  height: 5,
                                                  width: 5,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.transparent),
                            ),
                            // title: Text(
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
                                        print(_selectSize.length);
                                        _createads(context);

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
                                        // _createads(context);
                                        // print(id);
                                        // print(_selecteditems2.map((e) => e));
                                        // print(value);

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
}
