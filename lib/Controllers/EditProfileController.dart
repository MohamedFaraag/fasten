import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helpers/Network.dart';
import '../Models/EditProfileModel.dart';

class EditProFileController {
  NetWork _netWork = NetWork();
  EditProfileModel _editProfileModel = EditProfileModel();
  Future<Map<String, dynamic>> EditProfile({
    String name,
    String email,
    String phone,
    String password,
    var country,
    var city,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('token'));
    List<Map<String, dynamic>> _headers = [
      // {
      //   'Authorization':
      //       "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZm9zdGFuLmRlbW8uYXNvbC10ZWMuY29tXC9hcGlcL3YxXC9sb2dpbiIsImlhdCI6MTYxNDA5NjQ4MSwibmJmIjoxNjE0MDk2NDgxLCJqdGkiOiJ3VHNxemdLQlRLT1I3U2xuIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.1puShp0jCnbnVPzm1VBWgOLzoUckh6hEZWE2wWF2gas",
      // }
      {'Authorization': prefs.getString('token')}
    ];
    FormData formData = FormData.fromMap({
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'country': country,
      'city': city
    });
    var response = await _netWork.postData(
      url: 'user/update',
      formData: formData,
      headers: _headers[0],
    );
    print(response);
    if (response == 'not found') {
      return {
        "result": null,
        "err": 'Failed',
        "success": false,
      };
    } else if (response == null) {
      return {
        "result": 'error',
        "err": 'Failed',
        "success": false,
      };
    } else if (response['success']) {
      _editProfileModel = EditProfileModel.fromJson(response);
      return {
        "result": _editProfileModel.message,
        "err": _editProfileModel.message,
        "success": true,
      };
    }
    return {
      "result": _editProfileModel.message,
      "err": _editProfileModel.message,
      "success": false,
    };
  }
}
