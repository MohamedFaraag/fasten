import '../Helpers/Network.dart';
import '../Models/myFavadsModel.dart';



class MyFavadsController {
  NetWork _netWork = NetWork();
  MyFavAdsModel _myFavadsModel = MyFavAdsModel();
  Future<MyFavAdsModel> getMyFavads() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // print(prefs.getString('token'));
    List<Map<String, dynamic>> _headers = [
      {
        'Authorization':
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZm9zdGFuLmRlbW8uYXNvbC10ZWMuY29tXC9hcGlcL3YxXC9sb2dpbiIsImlhdCI6MTYxNDUxMjc0NiwibmJmIjoxNjE0NTEyNzQ2LCJqdGkiOiI0ZXRFQjlocFdnSlV1MUVnIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.rld2GvyRNcuzGd9E8K6bCDyIG6lpM9l0nANAU7D6FOg",
      }
    ];
    var data = await _netWork.getData(url: 'favorites', headers: _headers);
    _myFavadsModel = MyFavAdsModel.fromJson(data);
    return _myFavadsModel;
  }
}
// class MyownStoreController {
//   NetWork _netWork = NetWork();
//
//   MyownStoreModel _myownStoreModel = MyownStoreModel();
//
//   Future<MyownStoreModel> getmyowenStore() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     print(prefs.getString('token'));
//     List<Map<String, dynamic>> _headers = [
//       {'Authorization': prefs.getString('token')}
//     ];
//     var data = await _netWork.getData(url: 'my-own-stores', headers: _headers);
//     _myownStoreModel = MyownStoreModel.fromJson(data);
//     return _myownStoreModel;
//   }
// }
