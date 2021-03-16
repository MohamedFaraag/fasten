import 'package:shared_preferences/shared_preferences.dart';

import '../Helpers/Network.dart';
import '../Models/myFavadsModel.dart';



class MyFavadsController {
  NetWork _netWork = NetWork();
  MyFavAdsModel _myFavadsModel = MyFavAdsModel();
  Future<MyFavAdsModel> getMyFavads() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('token'));
    List<Map<String, dynamic>> _headers = [
      // {
      //   'Authorization':
      //       "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZm9zdGFuLmRlbW8uYXNvbC10ZWMuY29tXC9hcGlcL3YxXC9sb2dpbiIsImlhdCI6MTYxNDA5NjQ4MSwibmJmIjoxNjE0MDk2NDgxLCJqdGkiOiJ3VHNxemdLQlRLT1I3U2xuIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.1puShp0jCnbnVPzm1VBWgOLzoUckh6hEZWE2wWF2gas",
      // }
      {'Authorization': prefs.getString('token')}
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
