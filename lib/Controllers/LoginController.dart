import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helpers/Network.dart';
import '../Models/LoginModel.dart';

class LoginController {
  NetWork netWork = NetWork();

  LoginModel _loginModel = LoginModel();

  Future<Map<String, dynamic>> userLogin(
      {String phone, String password}) async {
    FormData formData = FormData.fromMap({
      "phone": phone,
      "password": password,
    });
    var response = await netWork.postData(url: 'login', formData: formData);
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
      _loginModel = LoginModel.fromJson(response);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', "Bearer " + _loginModel.data.token);
      prefs.setString('role', _loginModel.data.user.role);

      return {
        "result": _loginModel.data.user.role,
        "err": _loginModel.data.user.role,
        "success": true,
      };
    } else {
      return {
        "result": _loginModel.data.user.role,
        "err": _loginModel.data.user.role,
        "success": false,
      };
    }
  }
}
