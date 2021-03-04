import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import '../Helpers/Network.dart';
import '../Models/GenerateCodeModel.dart';

class GenerateCodeController {
  NetWork netWork = NetWork();

  GenerateCodeModel _generateCodeModel = GenerateCodeModel();

  Future<Map<String, dynamic>> userCode({String phone}) async {
    FormData formData = FormData.fromMap({
      "phone": phone,
    });
    var response =
        await netWork.postData(url: 'forgot_password', formData: formData);
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
        "success": false,
      };
    } else if (response['success']) {
      _generateCodeModel = GenerateCodeModel.fromJson(response);

      return {
        "success": true,
        "code":_generateCodeModel.data.code
      };
    } else {
      return {
        "success": false,
      };
    }
  }
}
