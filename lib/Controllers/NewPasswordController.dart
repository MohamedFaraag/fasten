import '../Helpers/Network.dart';
import '../Models/NewPasswordModel.dart';

import 'package:dio/dio.dart';

class NewPasswordController {
  NetWork _netWork = NetWork();
  NewPasswordModel _newPasswordModel = NewPasswordModel();
  Future<Map<String, dynamic>> changePassword(
      {var code, var phone, var newPassword}) async {
    FormData _formData = FormData.fromMap({
      "code": code,
      "phone": phone,
      "new_password": newPassword,
    });
    var response =
        await _netWork.postData(url: 'change_password', formData: _formData);
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
      _newPasswordModel = NewPasswordModel.fromJson(response);

      return {
        "result": _newPasswordModel.data.id,
        "success": true,
      };
    } else {
      return {
        "result": _newPasswordModel.message,
        "success": false,
      };
    }
  }
}
