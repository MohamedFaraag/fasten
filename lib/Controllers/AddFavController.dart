import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helpers/Network.dart';
import '../Models/AddFavModel.dart';

class AddFavAdsController {
  NetWork netWork = NetWork();

  AddFavAdsModel _addFavAdsModel = AddFavAdsModel();

  Future<Map<String, dynamic>> addFavAds({int adid}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('token'));
    FormData formData = FormData.fromMap({
      "ad_id": adid,
    });
    List<Map<String, dynamic>> _headers = [
      // {
      //   'Authorization':
      //       "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZm9zdGFuLmRlbW8uYXNvbC10ZWMuY29tXC9hcGlcL3YxXC9sb2dpbiIsImlhdCI6MTYxNDA5NjQ4MSwibmJmIjoxNjE0MDk2NDgxLCJqdGkiOiJ3VHNxemdLQlRLT1I3U2xuIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.1puShp0jCnbnVPzm1VBWgOLzoUckh6hEZWE2wWF2gas",
      // }
      {'Authorization': prefs.getString('token')}
    ];
    var response = await netWork.postData(
        url: 'favorites', formData: formData, headers: _headers[0]);
    print(response);
    if (response == 'not found') {
      return {
        "result": null,
        "err": 'Failed',
        "success": false,
      };
    } else if (response == 'internet') {
      return {
        "result": null,
        "err": 'no internet connection',
        "success": false,
      };
    } else if (response == null) {
      return {
        "result": null,
        "success": false,
      };
    } else if (response['success'] == true) {
      _addFavAdsModel = AddFavAdsModel.fromJson(response);

      return {
        "success": true,
      };
    } else {
      return {
        "success": false,
      };
    }
  }
}
