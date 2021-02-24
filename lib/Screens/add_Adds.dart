import 'package:flutter/material.dart';

import '../Controllers/AttributeForAddController.dart';
import '../Helpers/FormatColor.dart';
import '../Models/AttributeForAddModel.dart';
import '../Controllers/AdTypesForAddController.dart';
import '../Controllers/AllCategoryController.dart';
import '../Models/AdTypesForAddModel.dart';
import '../Models/AllCategoryModel.dart';
import '../Helpers/size_conifg.dart';
import '../Screens/myAdds.dart';
import '../Widget/SelectedColor.dart';
import '../Widget/seletCategory.dart';
import '../Helpers/images.dart';

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
  bool _isLoading = false;

  int colorindex;
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
              // Navigator.of(context).pushReplacementNamed(Home.routeName);
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
                            Image.asset(gallery),
                            Text('Advertising video'),
                            Image.asset(vid),
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
                            Container(
                              // width: double.infinity,
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
                                    textColor: Colors.black,
                                    name: _allCategoryModel.data[index].name,
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(30),
                            ),
                            Text(
                              'Ad details',
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(14),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(5),
                            ),
                            Text(
                              'product name : ',
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(14),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(3),
                            ),
                            Text(
                              'price : ',
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(14),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(3),
                            ),
                            Text(
                              'Select the address : ',
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(14),
                                fontWeight: FontWeight.bold,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  _adTypesForAddModel.data.length,
                                  (index) => selectedCategory(
                                  textColor: Colors.black,
                                    name:
                                        _adTypesForAddModel.data[index].name.en,
                                  ),
                                )),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            Text('Sizes'),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            Container(
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemCount: _attributeForAddModel
                                    .data[1].options.length,
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 120,
                                        childAspectRatio: 4.5 / 1,
                                        crossAxisSpacing: 40,
                                        mainAxisSpacing: 10),
                                itemBuilder: (BuildContext context, int index) {
                                  return selectedCategory(
                                  textColor: Colors.black,
                                    name: _attributeForAddModel
                                        .data[1].options[index].name,
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
                            Center(
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
                                    Navigator.of(context)
                                        .pushReplacementNamed(MyAdds.routeName);
                                  },
                                  child: Text(
                                    'Add advertisement',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
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
