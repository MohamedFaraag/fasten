import '../Helpers/Network.dart';
import '../Models/MyAdsModel.dart';

import 'package:shared_preferences/shared_preferences.dart';

class MyadsController {
  NetWork _netWork = NetWork();
  MyAdsModel _myAdsModel = MyAdsModel();
  Future<MyAdsModel> getmyAds() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('token'));
    List<Map<String, dynamic>> _headers = [
      // {
      //   'Authorization':
      //       "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZm9zdGFuLmRlbW8uYXNvbC10ZWMuY29tXC9hcGlcL3YxXC9sb2dpbiIsImlhdCI6MTYxNDA5NjQ4MSwibmJmIjoxNjE0MDk2NDgxLCJqdGkiOiJ3VHNxemdLQlRLT1I3U2xuIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.1puShp0jCnbnVPzm1VBWgOLzoUckh6hEZWE2wWF2gas",
      // }
      {'Authorization': prefs.getString('token')
      }
    ];
    var data = await _netWork.getData(url: 'my-ads', headers: _headers);
    _myAdsModel = MyAdsModel.fromJson(data);
    return _myAdsModel;
  }
}
