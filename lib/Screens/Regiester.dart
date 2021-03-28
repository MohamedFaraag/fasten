import 'package:flutter/material.dart';

import '../Controllers/RegesterController.dart';
import '../Models/RegesterModel.dart';
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
  ReGController _reGController = ReGController();
  RegiesterModel _regiesterModel = RegiesterModel();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AllCountriesModel _allCountriesModel = AllCountriesModel();
  AllCitiesModel _allCitiesModel = AllCitiesModel();
  AllCitiesController _allCitiesController = AllCitiesController();
  AllCountriesController _allCountriesController = AllCountriesController();
  bool _isloading = false;
  bool _loadmore = false;
  bool _loading = false;
  int countriesId;

  ///Var For ReGister
  String _name;
  String _email;
  String _password;
  String _phone;
  var _country_id;
  var _city_id;
  String _id;
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

  _getAllCities(int countriesId) async {
    setState(() {
      _loadmore = true;
    });
    _allCitiesModel = await _allCitiesController.getAllcities(countriesId);
    setState(() {
      _loadmore = false;
    });
  }

  void _submitForm() async {
    setState(() {
      _loading = true;
    });
    Map<String, dynamic> _result = await _reGController.userReg(
      name: _name,
      email: _email,
      password: _password,
      phone: _phone,
      country_id: _city_id,
      city_id: _country_id,

      // id: _id,
    );
    if (_result['success']) {
      print('Response Done');
      print(_result);
    } else {
      print('Response error');
      print("Result is ${_result['errPhone']}");
      print("Result is ${_result['errPassword']}");
      print(_result['success']);
    }

    // setState(() {
    //   errPhone = _result['errPhone'];
    //   errPassword = _result['errPassword'];
    //   _loading = false;
    // });

    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
  }

  // Future<void> _getID() async {
  //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //   AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //   print('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"
  //
  //   IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  //   print('Running on ${iosInfo.utsname.machine}');
  // }

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
                  child: Form(
                    key: _formKey,
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
                                  onChanged: (valeu) {
                                    setState(() {
                                      _name = valeu;
                                    });
                                  },
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.black,
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
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: Colors.black,
                                    contentPadding: EdgeInsets.all(10),
                                    hintText: 'ex@email',
                                    suffixIcon: Icon(Icons.mail),
                                  ),
                                  onChanged: (valeu) {
                                    setState(() {
                                      _email = valeu;
                                    });
                                  },
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
                                  isExpanded: true,
                                  hint: Text("Select item"),
                                  value: _selectedLocation == null
                                      ? _locations
                                      : _selectedLocation,
                                  onChanged: (Value) {
                                    setState(() {
                                      this._selectedLocation = Value;
                                    });
                                  },
                                  items: _allCountriesModel.data.map((e) {
                                    return DropdownMenuItem(
                                      onTap: () {
                                        this._country_id = e.id;
                                        _getAllCities(e.id);
                                      },
                                      value: e.name,
                                      child: Text(
                                        e.name,
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),

                              // Container(
                              //   padding: EdgeInsets.all(5.5),
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(5.5),
                              //     color: Colors.white,
                              //   ),
                              //   child: DropdownButton(
                              //     // dropdownColor: Colors.transparent,
                              //     isExpanded: true,
                              //     elevation: 2,
                              //     value: _selectedLocation,
                              //     hint: Text('Please choose a Country'),
                              //
                              //     onChanged: (newValue) {
                              //       // newValue = '';
                              //       setState(() {
                              //         this._selectedLocation = newValue;
                              //       });
                              //     },
                              //     items: _allCountriesModel.data.map((e) {
                              //       return DropdownMenuItem(
                              //         child: Text(e.name),
                              //         onTap: () {
                              //           setState(() {
                              //             countriesId = e.id;
                              //             _getAllCities();
                              //           });
                              //         },
                              //       );
                              //     }).toList(),
                              //   ),
                              // ),
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
                                        borderRadius:
                                            BorderRadius.circular(5.5),
                                        color: Colors.white,
                                      ),
                                      child: DropdownButton(
                                        isExpanded: true,
                                        value: _selectCities == null
                                            ? _locations
                                            : _selectCities,
                                        hint: Text("Select itemss"),
                                        onChanged: (Value) {
                                          setState(() {
                                            this._selectCities = Value;
                                          });
                                        },
                                        items: _allCitiesModel.data.cities
                                            .map((e) {
                                          return DropdownMenuItem(
                                            onTap: () {
                                              this._city_id = e.id;
                                            },
                                            value: e.name,
                                            child: Text(
                                              e.name,
                                            ),
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
                                  onChanged: (valeu) {
                                    setState(() {
                                      _password = valeu;
                                    });
                                  },
                                  keyboardType: TextInputType.phone,
                                  cursorColor: Colors.black,
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
                                  onChanged: (valeu) {
                                    setState(() {
                                      _id = valeu;
                                    });
                                  },
                                  keyboardType: TextInputType.phone,
                                  cursorColor: Colors.black,
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
                                  // _submitForm();

                                  // print(_name);
                                  //
                                  // print(_password);
                                  print(_selectedLocation);
                                  // print(_city_id);
                                  print(_country_id);
                                  // print(_id);
                                  // print(_email);

                                  // Navigator.of(context)
                                  //     .pushReplacementNamed(Finish.routeName);
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
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
