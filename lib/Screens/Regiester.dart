import 'package:flutter/material.dart';

import '../Controllers/AllCitiesCountroller.dart';
import '../Controllers/AllCountriesController.dart';
import '../Models/AllCountriesModel.dart';
import '../Helpers/images.dart';
import '../Helpers/size_conifg.dart';
import '../Models/AllCitiesModel.dart';
import '../Widget/Buttons.dart';

class Regeister extends StatefulWidget {
  static String routeName = '/regiester';

  @override
  _RegeisterState createState() => _RegeisterState();
}

class _RegeisterState extends State<Regeister> {
  AllCountriesModel _allCountriesModel = AllCountriesModel();
  AllCitiesModel _allCitiesModel = AllCitiesModel();
  AllCitiesController _allCitiesController = AllCitiesController();
  AllCountriesController _allCountriesController = AllCountriesController();
  bool _isloading = false;
  bool _loadmore = false;
  int countriesId;
  int citiesesId;
  void initState() {
    super.initState();
    _getAllCountries();
  }

  List<String> _locations = ['A', 'B', 'C', 'D'];
  String _selectedLocation;
  String _selectCities;
  _getAllCountries() async {
    setState(() {
      _isloading = true;
    });
    _allCountriesModel = await _allCountriesController.getAllCountries();

    setState(() {
      _isloading = false;
    });
  }

  _getAllCities() async {
    setState(() {
      _loadmore = true;
    });
    _allCitiesModel = await _allCitiesController.getAllcities(countriesId);
    setState(() {
      _loadmore = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
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
        height: getProportionateScreenHeight(790),
        width: double.infinity,
        // color: Colors.black,
        padding: EdgeInsets.all(15.0),
        child: !_isloading
            ? Stack(children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(woImage),
                  )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'New account',
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(5.5),
                            ),
                            Text(
                              'Add your account data',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(31.5),
                            ),
                            Text(
                              'Name *',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.5),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.black,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.black,
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: 'name',
                                  suffixIcon:
                                      Icon(Icons.account_circle_rounded),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            ),
                            Text(
                              'E-mail *',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.5),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: Colors.black,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.black,
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: 'ex@email',
                                  suffixIcon: Icon(Icons.mail),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            ),
                            Text(
                              'Country *',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            Container(
                              padding: EdgeInsets.all(5.5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.5),
                                color: Colors.white,
                              ),
                              child: DropdownButton(
                                // dropdownColor: Colors.transparent,
                                isExpanded: true,
                                elevation: 2,
                                hint: Text('Please choose a Country'),

                                value: _selectedLocation,
                                onChanged: (newValue) {
                                  setState(() {
                                    this._selectedLocation = newValue;
                                  });
                                },
                                items: _allCountriesModel.data.map((e) {
                                  return DropdownMenuItem(
                                    child: Text(e.name),
                                    value: e.name,
                                    onTap: () {
                                      setState(() {
                                        countriesId = e.id;
                                        _getAllCities();
                                      });
                                    },
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            ),
                            Text(
                              'City *',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            _allCitiesModel.data != null
                                ? Container(
                                    padding: EdgeInsets.all(5.5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.5),
                                      color: Colors.white,
                                    ),
                                    child: DropdownButton(
                                      // dropdownColor: Colors.transparent,
                                      isExpanded: true,

                                      hint: Text('Please choose a City'),

                                      value: _selectCities,
                                      onChanged: (va) {
                                        setState(() {
                                          this._selectCities = va;
                                        });
                                      },
                                      items:
                                          _allCitiesModel.data.cities.map((e) {
                                        return DropdownMenuItem(
                                          child: Text(e.name),
                                          value: e.name,
                                          onTap: () {
                                            setState(() {
                                              citiesesId = e.id;
                                            });
                                          },
                                        );
                                      }).toList(),
                                    ),
                                  )
                                : Center(
                                    child: Text('NO Data'),
                                  ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            ),
                            Text(
                              'Password *',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.5),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                cursorColor: Colors.black,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.black,
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: '*****',
                                  suffixIcon: Icon(Icons.visibility),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(15),
                            ),
                            Text(
                              'Confirm password *',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.5),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                cursorColor: Colors.black,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.black,
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: '*****',
                                  suffixIcon: Icon(Icons.visibility),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            Button(
                              textButton: 'Create an account',
                              onPressed: () {
                                print('Selected $_selectedLocation');
                                print('countriesId $countriesId');
                                //print(
                                //'Request For cities is ${_allCitiesModel.data.cities[1].name}');
                                // Navigator.of(context)
                                //     .pushReplacementNamed(Finish.routeName);
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ])
            : Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              ),
      ),
    )));
  }
}
