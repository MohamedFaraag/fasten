import 'package:dio/dio.dart';
import '../Models/RegesterModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helpers/Network.dart';

class ReGController {
  NetWork netWork = NetWork();

  RegiesterModel _regiesterModel = RegiesterModel();

  Future<Map<String, dynamic>> userReg({
    String phone,
    String password,
    String name,
    String email,
    String country_id,
    String city_id,
    // String id
  }) async {
    FormData formData = FormData.fromMap({
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
      "country_id": country_id,
      "city_id": city_id,
      // "device_id": id
    });
    var response = await netWork.postData(url: '/register', formData: formData);
    print(response);
    if (response == 'not found') {
      return {
        "result": null,
        "err": 'password or phone incorrect',
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
        "errPhone": 'Phone Invalid',
        "errPassword": 'Password Invalid',
        "success": false,
      };
    } else if (response['success']) {
      _regiesterModel = RegiesterModel.fromJson(response);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', "Bearer " + _regiesterModel.data.token);
      prefs.setString('role', _regiesterModel.data.user.role);

      return {
        "result": _regiesterModel.data.user.role,
        "err": _regiesterModel.data.user.role,
        "success": true,
      };
    } else {
      return {
        "result": _regiesterModel.data.user.role,
        "err": _regiesterModel.data.user.role,
        "success": false,
      };
    }
  }
}
